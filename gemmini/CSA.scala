package gemmini

import chisel3._
import chisel3.util._
import chisel3.experimental._

class CSA(
    val width: Int = 4
  ) extends RawModule {
  val a = IO(Input(SInt(width.W)))
  val b = IO(Input(SInt(width.W)))
  val c = IO(Input(SInt(width.W)))
  val cout = IO(Output(SInt((width+1).W)))
  val s = IO(Output(SInt(width.W)))
  // genvar i;
  for(i <- 0 until width){
    val fa = Module(new FullAdder)
    fa.a := a(i)
    fa.b := b(i)
    fa.c := c(i)
    cout(i+1) := fa.cout
    s(i) := fa.sum
  }
  cout(0) := false.B
}