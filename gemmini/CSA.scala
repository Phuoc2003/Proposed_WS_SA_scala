// package gemmini

// import chisel3._
// import chisel3.util._
// import chisel3.experimental._

// class CSA(
//     val width: Int = 4
//   ) extends RawModule {
//   val a = IO(Input(SInt(width.W)))
//   val b = IO(Input(SInt(width.W)))
//   val c = IO(Input(SInt(width.W)))
//   val cout = IO(Output(SInt((width+1).W)))
//   val s = IO(Output(SInt(width.W)))
//   // genvar i;
//   for(i <- 0 until width){
//     val fa = Module(new FullAdder)
//     fa.a := a(i)
//     fa.b := b(i)
//     fa.c := c(i)
//     cout(i+1) := fa.cout
//     s(i) := fa.sum
//   }
//   cout(0) := false.B
// }

package gemmini

import chisel3._
import chisel3.util._
import chisel3.experimental._

class CSA(width: Int = 4) extends RawModule {
  val a = IO(Input(SInt(width.W)))
  val b = IO(Input(SInt(width.W)))
  val c = IO(Input(SInt(width.W)))
  val cout = IO(Output(SInt((width + 1).W)))
  val s = IO(Output(SInt(width.W)))

  // Tạo wire cho carry out và sum
  val carry = Wire(Vec(width + 1, Bool()))
  val sum = Wire(Vec(width, Bool()))
  
  // Set bit 0 của carry out = 0
  carry(0) := false.B
  
  // Generate loop tương đương với Verilog
  for (i <- 0 until width) {
    val fa = Module(new FullAdder)
    fa.a := a(i)
    fa.b := b(i)
    fa.c := c(i)
    carry(i + 1) := fa.cout
    sum(i) := fa.sum
  }
  
  // Assign outputs
  cout := carry.asUInt.asSInt
  s := sum.asUInt.asSInt
}
