// See LICENSE for license details.
package sifive.fpgashells.shell.xilinx.ku040shell

import Chisel._
import chisel3.core.{Input, Output, attach}
import chisel3.experimental.{RawModule, Analog, withClockAndReset}

import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.{SyncResetSynchronizerShiftReg, ElaborationArtefacts, HeterogeneousBag}

import sifive.blocks.devices.gpio._
import sifive.blocks.devices.spi._
import sifive.blocks.devices.uart._
import sifive.blocks.devices.chiplink._

import sifive.fpgashells.devices.xilinx.xilinxku040mig._
import sifive.fpgashells.ip.xilinx.{IBUFDS, PowerOnResetFPGAOnly, sdio_spi_bridge, ku040_sys_clock_mmcm0, 
                                    ku040_sys_clock_mmcm1, ku040_sys_clock_mmcm2 , ku040reset}

//-------------------------------------------------------------------------
// KU040Shell
//-------------------------------------------------------------------------

trait HasDDR3 { this: KU040Shell =>
  
  require(!p.lift(MemoryXilinxDDRKey).isEmpty)
  val ddr = IO(new XilinxKU040MIGPads(p(MemoryXilinxDDRKey)))
  
  def connectMIG(dut: HasMemoryXilinxKU040MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxku040mig.sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxku040mig.ui_clk
    mig_sys_reset                := dut.xilinxku040mig.ui_clk_sync_rst
    mig_mmcm_locked              := dut.xilinxku040mig.mmcm_locked
    dut.xilinxku040mig.aresetn   := mig_resetn
    dut.xilinxku040mig.sys_rst   := sys_reset

    ddr <> dut.xilinxku040mig
  }
}

trait HasDebugJTAG { this: KU040Shell =>
  // JTAG
  val jtag_TCK             = IO(Input(Clock()))
  val jtag_TMS             = IO(Input(Bool()))
  val jtag_TDI             = IO(Input(Bool()))
  val jtag_TDO             = IO(Output(Bool()))

  def connectDebugJTAG(dut: HasPeripheryDebugModuleImp, fmcxm105: Boolean = true): SystemJTAGIO = {
  
    ElaborationArtefacts.add(
    """debugjtag.vivado.tcl""",
    """set ku040debugjtag_vivado_tcl_dir [file dirname [file normalize [info script]]]
       add_files -fileset [current_fileset -constrset] [glob -directory $ku040debugjtag_vivado_tcl_dir {*.ku040debugjtag.xdc}]"""
    )

    if(fmcxm105) {
      //KU040 constraints for Xilinx FMC XM105 Debug Card
      ElaborationArtefacts.add(
        """ku040debugjtag.xdc""",
        """set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK_IBUF]
           set_property -dict { PACKAGE_PIN R32  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TCK}]
           set_property -dict { PACKAGE_PIN W36  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TMS}]
           set_property -dict { PACKAGE_PIN W37  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDI}]
           set_property -dict { PACKAGE_PIN V40  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDO}] """
      )
    } else {
      //KU040 constraints for Olimex connect to LCD panel header
     ElaborationArtefacts.add(
        """ku040debugjtag.xdc""",
        """
           #Olimex Pin  Olimex Function LCD Pin LCD Function FPGA Pin
           #1           VREF            14      5V
           #3           TTRST_N         1       LCD_DB7       AN40
           #5           TTDI            2       LCD_DB6       AR39
           #7           TTMS            3       LCD_DB5       AR38
           #9           TTCK            4       LCD_DB4       AT42
           #11          TRTCK           NC      NC            NC
           #13          TTDO            9       LCD_E         AT40
           #15          TSRST_N         10      LCD_RW        AR42
           #2           VREF            14      5V
           #18          GND             13      GND
           set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK_IBUF]
           set_property -dict { PACKAGE_PIN AT42  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TCK}]
           set_property -dict { PACKAGE_PIN AR38  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TMS}]
           set_property -dict { PACKAGE_PIN AR39  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDI}]
           set_property -dict { PACKAGE_PIN AT40  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDO}] """
      )
    }
   
    val djtag     = dut.debug.systemjtag.get

    djtag.jtag.TCK := jtag_TCK
    djtag.jtag.TMS := jtag_TMS
    djtag.jtag.TDI := jtag_TDI
    jtag_TDO       := djtag.jtag.TDO.data

    djtag.mfr_id   := p(JtagDTMKey).idcodeManufId.U(11.W)

    djtag.reset    := PowerOnResetFPGAOnly(dut_clock)
    dut_ndreset    := dut.debug.ndreset
    djtag
  }
}

trait HasKU040ChipLink { this: KU040Shell =>

  val chiplink = IO(new WideDataLayerPort(ChipLinkParams(Nil,Nil)))
  val ereset_n = IO(Bool(INPUT))

  def constrainChipLink(iofpga: Boolean = false): Unit = {
    val direction0Pins = if(iofpga) "chiplink_b2c"  else "chiplink_c2b"
    val direction1Pins = if(iofpga) "chiplink_c2b"  else "chiplink_b2c"

    ElaborationArtefacts.add(
      """ku040chiplink.vivado.tcl""",
      """set ku040chiplink_vivado_tcl_dir [file dirname [file normalize [info script]]]
         add_files -fileset [current_fileset -constrset] [glob -directory $ku040chiplink_vivado_tcl_dir {*.ku040chiplink.xdc}]"""
    )

    ElaborationArtefacts.add(
      """ku040chiplink.xdc""", s"""
        set_property PACKAGE_PIN AF39 [get_ports ${direction0Pins}_clk]
        set_property PACKAGE_PIN AD40 [get_ports {${direction0Pins}_data[0]}]
        set_property PACKAGE_PIN AD41 [get_ports {${direction0Pins}_data[1]}]
        set_property PACKAGE_PIN AF41 [get_ports {${direction0Pins}_data[2]}]
        set_property PACKAGE_PIN AG41 [get_ports {${direction0Pins}_data[3]}]
        set_property PACKAGE_PIN AK39 [get_ports {${direction0Pins}_data[4]}]
        set_property PACKAGE_PIN AL39 [get_ports {${direction0Pins}_data[5]}]
        set_property PACKAGE_PIN AJ42 [get_ports {${direction0Pins}_data[6]}]
        set_property PACKAGE_PIN AK42 [get_ports {${direction0Pins}_data[7]}]
        set_property PACKAGE_PIN AL41 [get_ports {${direction0Pins}_data[8]}]
        set_property PACKAGE_PIN AL42 [get_ports {${direction0Pins}_data[9]}]
        set_property PACKAGE_PIN AF42 [get_ports {${direction0Pins}_data[10]}]
        set_property PACKAGE_PIN AG42 [get_ports {${direction0Pins}_data[11]}]
        set_property PACKAGE_PIN AD38 [get_ports {${direction0Pins}_data[12]}]
        set_property PACKAGE_PIN AE38 [get_ports {${direction0Pins}_data[13]}]
        set_property PACKAGE_PIN AC40 [get_ports {${direction0Pins}_data[14]}]
        set_property PACKAGE_PIN AC41 [get_ports {${direction0Pins}_data[15]}]
        set_property PACKAGE_PIN AD42 [get_ports {${direction0Pins}_data[16]}]
        set_property PACKAGE_PIN AE42 [get_ports {${direction0Pins}_data[17]}]
        set_property PACKAGE_PIN AJ38 [get_ports {${direction0Pins}_data[18]}]
        set_property PACKAGE_PIN AK38 [get_ports {${direction0Pins}_data[19]}]
        set_property PACKAGE_PIN AB41 [get_ports {${direction0Pins}_data[20]}]
        set_property PACKAGE_PIN AB42 [get_ports {${direction0Pins}_data[21]}]
        set_property PACKAGE_PIN Y42  [get_ports {${direction0Pins}_data[22]}]
        set_property PACKAGE_PIN AA42 [get_ports {${direction0Pins}_data[23]}]
        set_property PACKAGE_PIN Y39  [get_ports {${direction0Pins}_data[24]}]
        set_property PACKAGE_PIN AA39 [get_ports {${direction0Pins}_data[25]}]
        set_property PACKAGE_PIN W40  [get_ports {${direction0Pins}_data[26]}]
        set_property PACKAGE_PIN Y40  [get_ports {${direction0Pins}_data[27]}]
        set_property PACKAGE_PIN AB38 [get_ports {${direction0Pins}_data[28]}]
        set_property PACKAGE_PIN AB39 [get_ports {${direction0Pins}_data[29]}]
        set_property PACKAGE_PIN AC38 [get_ports {${direction0Pins}_data[30]}]
        set_property PACKAGE_PIN AC39 [get_ports {${direction0Pins}_data[31]}]
        set_property PACKAGE_PIN AJ40 [get_ports ${direction0Pins}_send]
        set_property PACKAGE_PIN AJ41 [get_ports ${direction0Pins}_rst]

        set_property PACKAGE_PIN U39 [get_ports ${direction1Pins}_clk]
        set_property PACKAGE_PIN U37 [get_ports {${direction1Pins}_data[0]}]
        set_property PACKAGE_PIN U38 [get_ports {${direction1Pins}_data[1]}]
        set_property PACKAGE_PIN U36 [get_ports {${direction1Pins}_data[2]}]
        set_property PACKAGE_PIN T37 [get_ports {${direction1Pins}_data[3]}]
        set_property PACKAGE_PIN U32 [get_ports {${direction1Pins}_data[4]}]
        set_property PACKAGE_PIN U33 [get_ports {${direction1Pins}_data[5]}]
        set_property PACKAGE_PIN V33 [get_ports {${direction1Pins}_data[6]}]
        set_property PACKAGE_PIN V34 [get_ports {${direction1Pins}_data[7]}]
        set_property PACKAGE_PIN P35 [get_ports {${direction1Pins}_data[8]}]
        set_property PACKAGE_PIN P36 [get_ports {${direction1Pins}_data[9]}]
        set_property PACKAGE_PIN W32 [get_ports {${direction1Pins}_data[10]}]
        set_property PACKAGE_PIN W33 [get_ports {${direction1Pins}_data[11]}]
        set_property PACKAGE_PIN R38 [get_ports {${direction1Pins}_data[12]}]
        set_property PACKAGE_PIN R39 [get_ports {${direction1Pins}_data[13]}]
        set_property PACKAGE_PIN U34 [get_ports {${direction1Pins}_data[14]}]
        set_property PACKAGE_PIN T35 [get_ports {${direction1Pins}_data[15]}]
        set_property PACKAGE_PIN R33 [get_ports {${direction1Pins}_data[16]}]
        set_property PACKAGE_PIN R34 [get_ports {${direction1Pins}_data[17]}]
        set_property PACKAGE_PIN N33 [get_ports {${direction1Pins}_data[18]}]
        set_property PACKAGE_PIN N34 [get_ports {${direction1Pins}_data[19]}]
        set_property PACKAGE_PIN P32 [get_ports {${direction1Pins}_data[20]}]
        set_property PACKAGE_PIN P33 [get_ports {${direction1Pins}_data[21]}]
        set_property PACKAGE_PIN V35 [get_ports {${direction1Pins}_data[22]}]
        set_property PACKAGE_PIN V36 [get_ports {${direction1Pins}_data[23]}]
        set_property PACKAGE_PIN W36 [get_ports {${direction1Pins}_data[24]}]
        set_property PACKAGE_PIN W37 [get_ports {${direction1Pins}_data[25]}]
        set_property PACKAGE_PIN T32 [get_ports {${direction1Pins}_data[26]}]
        set_property PACKAGE_PIN R32 [get_ports {${direction1Pins}_data[27]}]
        set_property PACKAGE_PIN V39 [get_ports {${direction1Pins}_data[28]}]
        set_property PACKAGE_PIN V40 [get_ports {${direction1Pins}_data[29]}]
        set_property PACKAGE_PIN P37 [get_ports {${direction1Pins}_data[30]}]
        set_property PACKAGE_PIN P38 [get_ports {${direction1Pins}_data[31]}]

        set_property PACKAGE_PIN T36 [get_ports ${direction1Pins}_send]
        set_property PACKAGE_PIN R37 [get_ports ${direction1Pins}_rst]

        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[31]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[30]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[29]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[28]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[27]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[26]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[25]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[24]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[23]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[22]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[21]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[20]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[19]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[18]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[17]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[16]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[15]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[14]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[13]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[12]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[11]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[10]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[9]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[8]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[7]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[6]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[5]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[4]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[3]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[2]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[1]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction0Pins}_data[0]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[31]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[30]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[29]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[28]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[27]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[26]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[25]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[24]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[23]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[22]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[21]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[20]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[19]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[18]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[17]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[16]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[15]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[14]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[13]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[12]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[11]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[10]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[9]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[8]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[7]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[6]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[5]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[4]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[3]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[2]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[1]}]
        set_property IOSTANDARD LVCMOS18 [get_ports {${direction1Pins}_data[0]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[31]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[30]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[29]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[28]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[27]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[26]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[25]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[24]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[23]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[22]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[21]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[20]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[19]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[18]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[17]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[16]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[15]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[14]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[13]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[12]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[11]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[10]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[9]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[8]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[7]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[6]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[5]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[4]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[3]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[2]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[1]}]
        set_property SLEW FAST [get_ports {${direction1Pins}_data[0]}]


        set_property IOSTANDARD LVCMOS18 [get_ports ${direction0Pins}_clk]
        set_property IOSTANDARD LVCMOS18 [get_ports ${direction0Pins}_rst]
        set_property IOSTANDARD LVCMOS18 [get_ports ${direction0Pins}_send]
        set_property IOSTANDARD LVCMOS18 [get_ports ${direction1Pins}_clk]
        set_property IOSTANDARD LVCMOS18 [get_ports ${direction1Pins}_rst]
        set_property IOSTANDARD LVCMOS18 [get_ports ${direction1Pins}_send]
        set_property SLEW FAST [get_ports ${direction1Pins}_clk]
        set_property SLEW FAST [get_ports ${direction1Pins}_rst]
        set_property SLEW FAST [get_ports ${direction1Pins}_send]


        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[31]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[30]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[29]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[28]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[27]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[26]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[25]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[24]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[23]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[22]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[21]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[20]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[19]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[18]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[17]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[16]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[15]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[14]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[13]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[12]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[11]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[10]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[9]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[8]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[7]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[6]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[5]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[4]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[3]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[2]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[1]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_data[0]]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_send]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_clk]
        set_property OFFCHIP_TERM NONE [get_ports ${direction1Pins}_rst]

        # Aloe reset sent to FPGA
        set_property IOSTANDARD LVCMOS18 [get_ports ereset_n]
        set_property PACKAGE_PIN AF40    [get_ports ereset_n]

        #Put first level RX/TX flops in IOB
        set_property IOB TRUE [get_cells -of_objects [all_fanout -flat -endpoints_only [get_ports "chiplink_b2c_data*"]]]
        set_property IOB TRUE [get_cells -of_objects [all_fanout -flat -endpoints_only [get_ports "chiplink_b2c_send"]]]
        set_property IOB TRUE [get_cells -of_objects [all_fanin -flat -startpoints_only [get_ports "chiplink_c2b_data*"]]]
        set_property IOB TRUE [get_cells -of_objects [all_fanin -flat -startpoints_only [get_ports "chiplink_c2b_send"]]]
"""
    )
  }

  def connectChipLink(dut: { val chiplink: HeterogeneousBag[WideDataLayerPort] } , iofpga: Boolean = false): Unit = {
    constrainChipLink(iofpga)

    chiplink <> dut.chiplink(0)
    //dut.chiplink_xilinx_7series_phy.get.idelayctrl_refclk := sys_clock
  }
}

  

abstract class KU040Shell(implicit val p: Parameters) extends RawModule {

  //-----------------------------------------------------------------------
  // Interface
  //-----------------------------------------------------------------------
  
  // 200Mhz differential sysclk
  val sys_diff_clock_clk_n = IO(Input(Bool()))
  val sys_diff_clock_clk_p = IO(Input(Bool()))

  // active high reset
  val reset                = IO(Input(Bool()))

  // LED
  val led                  = IO(Vec(8, Output(Bool())))

  // UART
  val uart_tx              = IO(Output(Bool()))
  val uart_rx              = IO(Input(Bool()))
  val uart_rtsn            = IO(Output(Bool()))
  val uart_ctsn            = IO(Input(Bool()))

  // SDIO
  val sdio_clk             = IO(Output(Bool()))
  val sdio_cmd             = IO(Analog(1.W))
  val sdio_dat             = IO(Analog(4.W))

  //Buttons
  val btn_0                = IO(Analog(1.W))
  val btn_1                = IO(Analog(1.W))
  val btn_2                = IO(Analog(1.W))
  val btn_3                = IO(Analog(1.W))

  //Sliding switches
  val sw_0                 = IO(Analog(1.W))
  val sw_1                 = IO(Analog(1.W))
  val sw_2                 = IO(Analog(1.W))
  val sw_3                 = IO(Analog(1.W))
  val sw_4                 = IO(Analog(1.W))
  val sw_5                 = IO(Analog(1.W))
  val sw_6                 = IO(Analog(1.W))
  val sw_7                 = IO(Analog(1.W))


  //-----------------------------------------------------------------------
  // Wire declrations
  //-----------------------------------------------------------------------

  val sys_clock       = Wire(Clock())
  val sys_reset       = Wire(Bool())

  val dut_clock       = Wire(Clock())
  val dut_reset       = Wire(Bool())
  val dut_resetn      = Wire(Bool())

  val dut_ndreset     = Wire(Bool())

  val sd_spi_sck      = Wire(Bool())
  val sd_spi_cs       = Wire(Bool())
  val sd_spi_dq_i     = Wire(Vec(4, Bool()))
  val sd_spi_dq_o     = Wire(Vec(4, Bool()))

  val do_reset        = Wire(Bool())

  val mig_mmcm_locked = Wire(Bool())
  val mig_sys_reset   = Wire(Bool())

  val mig_clock       = Wire(Clock())
  val mig_reset       = Wire(Bool())
  val mig_resetn      = Wire(Bool())

  val pcie_dat_reset  = Wire(Bool())
  val pcie_dat_resetn = Wire(Bool())
  val pcie_cfg_reset  = Wire(Bool())
  val pcie_cfg_resetn = Wire(Bool())
  val pcie_dat_clock  = Wire(Clock())
  val pcie_cfg_clock  = Wire(Clock())
  val mmcm_lock_pcie  = Wire(Bool())

  //-----------------------------------------------------------------------
  // Differential clock
  //-----------------------------------------------------------------------

  val sys_clk_ibufds = Module(new IBUFDS)
  sys_clk_ibufds.io.I  := sys_diff_clock_clk_p
  sys_clk_ibufds.io.IB := sys_diff_clock_clk_n

  //-----------------------------------------------------------------------
  // System clock and reset
  //-----------------------------------------------------------------------

  // Clock that drives the clock generator and the MIG
  sys_clock := sys_clk_ibufds.io.O.asClock

  // Allow the debug module to reset everything. Resets the MIG
  sys_reset := reset | dut_ndreset

  //-----------------------------------------------------------------------
  // Clock Generator
  //-----------------------------------------------------------------------

  //25MHz and multiples
  val ku040_sys_clock_mmcm0 = Module(new ku040_sys_clock_mmcm2)
  ku040_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
  ku040_sys_clock_mmcm0.io.reset   := reset
  val clk12_5              = ku040_sys_clock_mmcm0.io.clk_out1
  val clk25                = ku040_sys_clock_mmcm0.io.clk_out2
  val clk37_5              = ku040_sys_clock_mmcm0.io.clk_out3
  val clk50                = ku040_sys_clock_mmcm0.io.clk_out4
  val clk100               = ku040_sys_clock_mmcm0.io.clk_out5
  val clk150               = ku040_sys_clock_mmcm0.io.clk_out6
  val clk75                = ku040_sys_clock_mmcm0.io.clk_out7
  val clk100_180           = ku040_sys_clock_mmcm0.io.clk_out7
  val ku040_sys_clock_mmcm0_locked = ku040_sys_clock_mmcm0.io.locked

  //65MHz and multiples
  val ku040_sys_clock_mmcm1 = Module(new ku040_sys_clock_mmcm1)
  ku040_sys_clock_mmcm1.io.clk_in1 := sys_clock.asUInt
  ku040_sys_clock_mmcm1.io.reset   := reset
  val clk32_5              = ku040_sys_clock_mmcm1.io.clk_out1
  val clk65                = ku040_sys_clock_mmcm1.io.clk_out2
  val ku040_sys_clock_mmcm1_locked = ku040_sys_clock_mmcm1.io.locked

  // DUT clock
  dut_clock := clk37_5

  //-----------------------------------------------------------------------
  // System reset
  //-----------------------------------------------------------------------

  do_reset             := !mig_mmcm_locked || !mmcm_lock_pcie || mig_sys_reset || !ku040_sys_clock_mmcm0_locked ||
                          !ku040_sys_clock_mmcm1_locked
  mig_resetn           := !mig_reset
  dut_resetn           := !dut_reset
  pcie_dat_resetn      := !pcie_dat_reset
  pcie_cfg_resetn      := !pcie_cfg_reset


  val safe_reset = Module(new ku040reset)

  safe_reset.io.areset := do_reset
  safe_reset.io.clock1 := mig_clock
  mig_reset            := safe_reset.io.reset1
  safe_reset.io.clock2 := pcie_dat_clock
  pcie_dat_reset       := safe_reset.io.reset2
  safe_reset.io.clock3 := pcie_cfg_clock
  pcie_cfg_reset       := safe_reset.io.reset3
  safe_reset.io.clock4 := dut_clock
  dut_reset            := safe_reset.io.reset4



  //-----------------------------------------------------------------------
  // UART
  //-----------------------------------------------------------------------

  uart_rtsn := false.B

  def connectUART(dut: HasPeripheryUARTModuleImp): Unit = {
    val uartParams = p(PeripheryUARTKey)
    if (!uartParams.isEmpty) {
      // uart connections
      dut.uart(0).rxd := SyncResetSynchronizerShiftReg(uart_rx, 2, init = Bool(true), name=Some("uart_rxd_sync"))
      uart_tx         := dut.uart(0).txd
    }
  }

  //-----------------------------------------------------------------------
  // SPI
  //-----------------------------------------------------------------------

  def connectSPI(dut: HasPeripherySPIModuleImp): Unit = {
    // SPI
    sd_spi_sck := dut.spi(0).sck
    sd_spi_cs  := dut.spi(0).cs(0)

    dut.spi(0).dq.zipWithIndex.foreach {
      case(pin, idx) =>
        sd_spi_dq_o(idx) := pin.o
        pin.i            := sd_spi_dq_i(idx)
    }

    //-------------------------------------------------------------------
    // SDIO <> SPI Bridge
    //-------------------------------------------------------------------

    val ip_sdio_spi = Module(new sdio_spi_bridge())

    ip_sdio_spi.io.clk   := dut_clock
    ip_sdio_spi.io.reset := dut_reset

    // SDIO
    attach(sdio_dat, ip_sdio_spi.io.sd_dat)
    attach(sdio_cmd, ip_sdio_spi.io.sd_cmd)
    sdio_clk := ip_sdio_spi.io.spi_sck

    // SPI
    ip_sdio_spi.io.spi_sck  := sd_spi_sck
    ip_sdio_spi.io.spi_cs   := sd_spi_cs
    sd_spi_dq_i             := ip_sdio_spi.io.spi_dq_i.toBools
    ip_sdio_spi.io.spi_dq_o := sd_spi_dq_o.asUInt
  }

}
