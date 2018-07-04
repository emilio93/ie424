`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPVERTICAL 8'd9
`define LOOPHORIZONTAL 8'd11
`define CUADROBLANCO 8'd17
`define CUADRONEGRO 8'd19
`define LOOPREGRESOHORIZONTAL 8'd21
`define FIN 8'd27
`define DISPLAY 8'd28

module ROM
(
  input  wire[15:0] iAddress,
  output reg [29:0] oInstruction
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
  5: oInstruction = {`STO,`R13,16'd40};
  6: oInstruction = {`STO,`R14,16'd30};
  7: oInstruction = {`STO,`R2,16'b0};
  8: oInstruction = {`NOP,24'b0};
// LOOPVERTICAL:
  9: oInstruction = {`STO,`R11,16'b0};
  10: oInstruction = {`NOP,24'b0};
// LOOPHORIZONTAL:
  11: oInstruction = {`ADD,`T1,`R11,`R12};
  12: oInstruction = {`NOP,24'b0};
  13: oInstruction = {`AND,`T1,`R1,`T1};
  14: oInstruction = {`NOP,24'b0};
  15: oInstruction = {`BEQ,`CUADROBLANCO,`T1,`R0};
  16: oInstruction = {`JMP,`CUADRONEGRO,16'b0};
// CUADROBLANCO:
  17: oInstruction = {`STO,`R10,8'b0,`COLOR_WHITE};
  18: oInstruction = {`JMP,`LOOPREGRESOHORIZONTAL,16'b0};
// CUADRONEGRO:
  19: oInstruction = {`STO,`R10,8'b0,`COLOR_BLACK};
  20: oInstruction = {`JMP,`LOOPREGRESOHORIZONTAL,16'b0};
// LOOPREGRESOHORIZONTAL:
  21: oInstruction = {`CALL,`DISPLAY,16'b0};
  22: oInstruction = {`ADD,`R11,`R11,`R1};
  23: oInstruction = {`BLE,`LOOPHORIZONTAL,`R11,`R13};
  24: oInstruction = {`ADD,`R12,`R12,`R1};
  25: oInstruction = {`BLE,`LOOPVERTICAL,`R12,`R14};
  26: oInstruction = {`JMP,`FIN,16'b0};
// FIN:
  27: oInstruction = {`JMP,`FIN,16'b0};
// DISPLAY:
  28: oInstruction = {`NOP,24'b0};
  29: oInstruction = {`PUSH,16'b0,`RA};
  30: oInstruction = {`PUSH,16'b0,`R2};
  31: oInstruction = {`NOP,24'b0};
  32: oInstruction = {`MUL,`R2,`R12,`R13};
  33: oInstruction = {`NOP,24'b0};
  34: oInstruction = {`ADD,`R2,`R2,`R11};
  35: oInstruction = {`NOP,24'b0};
  36: oInstruction = {`VGA,8'b0,`R10,`R2};
  37: oInstruction = {`POP,`R2,16'b0};
  38: oInstruction = {`POP,`RA,16'b0};
  39: oInstruction = {`NOP,24'b0};
  40: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase
end

endmodule
