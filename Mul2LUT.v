`timescale 1ns / 1ps
`include "LUT.v"

module Mul2LUT(B, A, C);	
input [15:0] A,B;
output [15:0] C;
wire [15:0] C1, C2, C3, C4, C5, C6, C7, C8;
LUT #(.i(0)) lut1(.b(B), .a(A), .c(C1));
LUT #(.i(2)) lut2(.b(B), .a(A), .c(C2));
LUT #(.i(4)) lut3(.b(B), .a(A), .c(C3));
LUT #(.i(7)) lut4(.b(B), .a(A), .c(C4));
LUT #(.i(8)) lut5(.b(B), .a(A), .c(C5));
LUT #(.i(10)) lut6(.b(B), .a(A), .c(C6));
LUT #(.i(12)) lut7(.b(B), .a(A), .c(C7));
LUT #(.i(14)) lut8(.b(B), .a(A), .c(C8));
assign C=C1+C2+C3+C4+C5+C6+C7+C8;
endmodule