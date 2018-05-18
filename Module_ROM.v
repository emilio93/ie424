`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd4
`define LOOP1 8'd12
`define LOOP2 8'd14
`define SUBRUTINA 8'd24
`define LOOP3 8'd27

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
  5: oInstruction = {`STO,`R3,16'd2};
  6: oInstruction = {`STO,`R4,16'd65000};
  7: oInstruction = {`STO,`R5,16'd65000};
  8: oInstruction = {`PUSH,16'b0,`R3};
  9: oInstruction = {`PUSH,16'b0,`R4};
  10: oInstruction = {`PUSH,16'b0,`R5};
  11: oInstruction = {`STO,`R7,16'd6623};
// LOOP1:
  12: oInstruction = {`STO,`R6,16'd0};
  13: oInstruction = {`MUL,`R2,`R2,`R3};
// LOOP2:
  14: oInstruction = {`LED,8'b0,`R6,8'b0};
  15: oInstruction = {`PUSH,16'b0,`R7};
  16: oInstruction = {`CALL,`SUBRUTINA,16'b0};
  17: oInstruction = {`POP,`R7,16'b0};
  18: oInstruction = {`ADD,`R6,`R6,`R1};
  19: oInstruction = {`BLE,`LOOP2,`R6,`R4};
  20: oInstruction = {`MUL,`R2,`R2,`R3};
  21: oInstruction = {`NOP,24'd0};
  22: oInstruction = {`BLE,`LOOP1,`R2,`R8};
  23: oInstruction = {`JMP,`INICIO,16'd0};
// SUBRUTINA:
  24: oInstruction = {`NOP,24'd0};
  25: oInstruction = {`STO,`R7,16'd0};
  26: oInstruction = {`NOP,24'd0};
// LOOP3:
  27: oInstruction = {`ADD,`R7,`R7,`R1};
  28: oInstruction = {`BLE,`LOOP3,`R7,`R5};
  29: oInstruction = {`NOP,24'd0};
  30: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
