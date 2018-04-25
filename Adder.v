`timescale 1ns / 1ps

module Adder (A, B, R, Ci, Co);
   input A, B, Ci;
   output R, Co;

   assign {Co, R} = A + B + Ci;
 endmodule
