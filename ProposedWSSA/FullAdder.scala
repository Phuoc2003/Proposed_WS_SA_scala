package ProposedWSSA

import chisel3._

class FullAdder() extends RawModule {
  val a = IO(Input(Bool()))
  val b = IO(Input(Bool()))
  val c = IO(Input(Bool()))
  val cout = IO(Output(Bool()))
  val sum = IO(Output(Bool()))
  sum := (a^b)^c
  cout := ((a&b)|(a&c))|(b&c)
}