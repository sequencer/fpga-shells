// See LICENSE for license details.
package sifive.fpgashells.devices.xilinx.xilinxku040mig

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem.BaseSubsystem
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp, AddressRange}

case object MemoryXilinxDDRKey extends Field[XilinxKU040MIGParams]

trait HasMemoryXilinxKU040MIG { this: BaseSubsystem =>
  val module: HasMemoryXilinxKU040MIGModuleImp

  val xilinxku040mig = LazyModule(new XilinxKU040MIG(p(MemoryXilinxDDRKey)))

  require(nMemoryChannels == 1, "Core complex must have 1 master memory port")
  xilinxku040mig.node := memBuses.head.toDRAMController(Some("xilinxku040mig"))()
}

trait HasMemoryXilinxKU040MIGBundle {
  val xilinxku040mig: XilinxKU040MIGIO
  def connectXilinxKU040MIGToPads(pads: XilinxKU040MIGPads) {
    pads <> xilinxku040mig
  }
}

trait HasMemoryXilinxKU040MIGModuleImp extends LazyModuleImp
    with HasMemoryXilinxKU040MIGBundle {
  val outer: HasMemoryXilinxKU040MIG
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size
  val xilinxku040mig = IO(new XilinxKU040MIGIO(depth))

  xilinxku040mig <> outer.xilinxku040mig.module.io.port
}
