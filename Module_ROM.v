`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPVERTICAL 8'd10
`define LOOPHORIZONTAL 8'd11
`define REGRESOLOOPHORIZONTAL 8'd19
`define REGRESOLOOPVERTICAL 8'd23
`define FIN 8'd26
`define DISPLAY 8'd27

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
// INICIO:
  3: oInstruction = {`STO,`R11,16'b0};
  4: oInstruction = {`STO,`R12,16'b0};
  5: oInstruction = {`STO,`R13,16'd16};
  6: oInstruction = {`STO,`R14,16'd12};
  7: oInstruction = {`STO,`R3,16'd2};
  8: oInstruction = {`STO,`R4,16'd5};
  9: oInstruction = {`STO,`R5,16'd8};
// LOOPVERTICAL:
  10: oInstruction = {`STO,`R11,16'b0};
// LOOPHORIZONTAL:
  11: oInstruction = {`STO,`R10,8'b0,`COLOR_GREEN};
  12: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL,`R12,`R3};
  13: oInstruction = {`STO,`R10,8'b0,`COLOR_RED};
  14: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL,`R12,`R4};
  15: oInstruction = {`STO,`R10,8'b0,`COLOR_MAGENTA};
  16: oInstruction = {`BLE,`REGRESOLOOPHORIZONTAL,`R12,`R5};
  17: oInstruction = {`STO,`R10,8'b0,`COLOR_BLUE};
  18: oInstruction = {`JMP,`REGRESOLOOPHORIZONTAL,16'b0};
// REGRESOLOOPHORIZONTAL:
  19: oInstruction = {`BLE,`REGRESOLOOPVERTICAL,`R13,`R11};
  20: oInstruction = {`CALL,`DISPLAY,16'b0};
  21: oInstruction = {`ADD,`R11,`R11,`R1};
  22: oInstruction = {`JMP,`LOOPHORIZONTAL,16'b0};
// REGRESOLOOPVERTICAL:
  23: oInstruction = {`BLE,`FIN,`R14,`R12};
  24: oInstruction = {`ADD,`R12,`R12,`R1};
  25: oInstruction = {`JMP,`LOOPVERTICAL,16'b0};
// FIN:
  26: oInstruction = {`JMP,`FIN,16'b0};
// DISPLAY:
  27: oInstruction = {`NOP,24'b0};
  28: oInstruction = {`PUSH,16'b0,`RA};
  29: oInstruction = {`PUSH,16'b0,`R2};
  30: oInstruction = {`NOP,24'b0};
  31: oInstruction = {`MUL,`R2,`R12,`R13};
  32: oInstruction = {`NOP,24'b0};
  33: oInstruction = {`ADD,`R2,`R2,`R11};
  34: oInstruction = {`NOP,24'b0};
  35: oInstruction = {`VGA,8'b0,`R10,`R2};
  36: oInstruction = {`POP,`R2,16'b0};
  37: oInstruction = {`POP,`RA,16'b0};
  38: oInstruction = {`NOP,24'b0};
  39: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
