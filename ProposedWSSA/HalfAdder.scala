package ProposedWSSA

import chisel3._

class HalfAdder() extends RawModule {
  val a = IO(Input(Bool()))
  val b = IO(Input(Bool()))
  val sum = IO(Output(Bool()))
  val cout = IO(Output(Bool()))
  sum := a^b
  cout := a&b
}