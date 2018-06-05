// See LICENSE for license details.
package sifive.fpgashells.shell.xilinx.ku040shell

import Chisel._
import chisel3.core.{Input, Output}
import chisel3.experimental.{Analog, RawModule}
import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.util.SyncResetSynchronizerShiftReg
import sifive.blocks.devices.pinctrl.BasePin
import sifive.blocks.devices.spi.{HasPeripherySPIFlashModuleImp, PeripherySPIFlashKey, SPIPins, SPIPinsFromPort}
import sifive.blocks.devices.uart._
import sifive.fpgashells.devices.xilinx.xilinxku040mig._
import sifive.fpgashells.ip.xilinx._

//-------------------------------------------------------------------------
// KU040Shell
//-------------------------------------------------------------------------

trait HasDDR4 { this: KU040Shell =>

  require(!p.lift(MemoryXilinxDDRKey).isEmpty)
  val ddr = IO(new XilinxKU040MIGPads(p(MemoryXilinxDDRKey)))

  def connectMIG(dut: HasMemoryXilinxKU040MIGModuleImp): Unit = {
    // Clock & Reset
    dut.xilinxku040mig.c0_sys_clk_i := sys_clock.asUInt
    mig_clock                    := dut.xilinxku040mig.c0_ddr4_ui_clk
    mig_sys_reset                := dut.xilinxku040mig.c0_ddr4_ui_clk_sync_rst
    dut.xilinxku040mig.c0_ddr4_aresetn   := mig_resetn
    dut.xilinxku040mig.sys_rst   := sys_reset

    ddr <> dut.xilinxku040mig
  }
}

abstract class KU040Shell(implicit val p: Parameters) extends RawModule {

  //-----------------------------------------------------------------------
  // Interface
  //-----------------------------------------------------------------------

  // 250Mhz differential sysclk
  val sys_diff_clock_clk_n = IO(Input(Bool()))
  val sys_diff_clock_clk_p = IO(Input(Bool()))

  // active high reset
  val reset                = IO(Input(Bool()))

  // LED
  //val led                  = IO(Vec(8, Output(Bool())))

  // UART
  val uart_tx              = IO(Output(Bool()))
  val uart_rx              = IO(Input(Bool()))
  //val uart_rtsn            = IO(Output(Bool()))
  //val uart_ctsn            = IO(Input(Bool()))

  // SDIO
//  val sdio_clk             = IO(Output(Bool()))
//  val sdio_cmd             = IO(Analog(1.W))
//  val sdio_dat             = IO(Analog(4.W))

  // JTAG
  val jtag_TCK             = IO(Input(Clock()))
  val jtag_TMS             = IO(Input(Bool()))
  val jtag_TDI             = IO(Input(Bool()))
  val jtag_TDO             = IO(Output(Bool()))

  // QSPI
  val qspi_cs              = IO(Analog(1.W))
  val qspi_sck             = IO(Analog(1.W))
  val qspi_dq              = IO(Vec(4, Analog(1.W)))


  //-----------------------------------------------------------------------
  // Wire declrations
  //-----------------------------------------------------------------------

  val sys_clock       = Wire(Clock())
  val sys_reset       = Wire(Bool())

  val dut_clock       = Wire(Clock())
  val dut_reset       = Wire(Bool())
  val dut_resetn      = Wire(Bool())

  val dut_ndreset     = Wire(Bool())

  val do_reset        = Wire(Bool())

  val mig_mmcm_locked = Wire(Bool())
  val mig_sys_reset   = Wire(Bool())

  val mig_clock       = Wire(Clock())
  val mig_reset       = Wire(Bool())
  val mig_resetn      = Wire(Bool())

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
  val ku040_sys_clock_mmcm0 = Module(new ku040_sys_clock_mmcm0)
  ku040_sys_clock_mmcm0.io.clk_in1 := sys_clock.asUInt
  ku040_sys_clock_mmcm0.io.reset   := reset
  val clk12_5              = ku040_sys_clock_mmcm0.io.clk_out1
  val clk25                = ku040_sys_clock_mmcm0.io.clk_out2
  val clk37_5              = ku040_sys_clock_mmcm0.io.clk_out3
  val clk50                = ku040_sys_clock_mmcm0.io.clk_out4
  val clk100               = ku040_sys_clock_mmcm0.io.clk_out5
  val clk150               = ku040_sys_clock_mmcm0.io.clk_out6
  val clk75                = ku040_sys_clock_mmcm0.io.clk_out7
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

  do_reset             := !mig_mmcm_locked || mig_sys_reset || !ku040_sys_clock_mmcm0_locked ||
                          !ku040_sys_clock_mmcm1_locked
  mig_resetn           := !mig_reset
  dut_resetn           := !dut_reset


  val safe_reset = Module(new ku040reset)

  safe_reset.io.areset := do_reset
  safe_reset.io.clock1 := mig_clock
  mig_reset            := safe_reset.io.reset1
  safe_reset.io.clock4 := dut_clock
  dut_reset            := safe_reset.io.reset4

  //overrided in connectMIG and connect PCIe
  //provide defaults to allow above reset sequencing logic to work without both
  mig_clock            := dut_clock
  mig_mmcm_locked      := UInt("b1")

  //---------------------------------------------------------------------
  // Debug JTAG
  //---------------------------------------------------------------------

  def connectDebugJTAG(dut: HasPeripheryDebugModuleImp): SystemJTAGIO = {
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

  //-----------------------------------------------------------------------
  // UART
  //-----------------------------------------------------------------------


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

  def connectSPIFlash(dut: HasPeripherySPIFlashModuleImp): Unit = {
    val qspiParams = p(PeripherySPIFlashKey)
    if (!qspiParams.isEmpty) {
      val qspi_params = qspiParams(0)
      val qspi_pins = Wire(new SPIPins(() => {new BasePin()}, qspi_params))

      SPIPinsFromPort(qspi_pins,
        dut.qspi(0),
        dut.clock,
        dut.reset,
        syncStages = qspi_params.sampleDelay
      )

      IOBUF(qspi_sck, dut.qspi(0).sck)
      IOBUF(qspi_cs,  dut.qspi(0).cs(0))

      (qspi_dq zip qspi_pins.dq).foreach {
        case(a, b) => IOBUF(a,b)
      }
    }
}
