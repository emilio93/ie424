`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd4
`define LOOP1 8'd8
`define LOOP2 8'd9
`define LOOP3 8'd11

module ROM
(
  input  wire[15:0] iAddress,
  output reg [27:0] oInstruction
);
always @ (iAddress)
begin
  case (iAddress)
  0: oInstruction = {`NOP,24'd4000};
  1: oInstruction = {`STO,`R0,16'b0};
  2: oInstruction = {`STO,`R1,16'b1};
  3: oInstruction = {`STO,`R8,16'b11111111};
// INICIO:
  4: oInstruction = {`STO,`R2,16'b1};
  5: oInstruction = {`STO,`R3,16'd5};
  6: oInstruction = {`STO,`R4,16'd10};
  7: oInstruction = {`STO,`R5,16'd25};
// LOOP1:
  8: oInstruction = {`STO,`R6,16'd0};
// LOOP2:
  9: oInstruction = {`STO,`R7,16'd0};
  10: oInstruction = {`LED,8'b0,`R2,8'b0};
// LOOP3:
  11: oInstruction = {`ADD,`R7,`R7,`R1};
  12: oInstruction = {`BLE,`LOOP3,`R7,`R5};
  13: oInstruction = {`ADD,`R6,`R6,`R1};
  14: oInstruction = {`BLE,`LOOP2,`R6,`R4};
  15: oInstruction = {`MUL16BITS,`R2,`R2,`R3};
  16: oInstruction = {`NOP,24'd0};
  17: oInstruction = {`BLE,`LOOP1,`R2,`R8};
  18: oInstruction = {`JMP,`INICIO,16'd0};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
