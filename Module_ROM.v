`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPINFINITO 8'd4
`define ESCRIBIRLCD 8'd7
`define ESCRIBIR4LETRAS 8'd35

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
  3: oInstruction = {`CALL,`ESCRIBIRLCD,16'b0};
// LOOPINFINITO:
  4: oInstruction = {`BLE,`LOOPINFINITO,`R0,`R1};
  5: oInstruction = {`NOP,24'd0};
  6: oInstruction = {`JMP,`INICIO,16'd0};
// ESCRIBIRLCD:
  7: oInstruction = {`NOP,24'b0};
  8: oInstruction = {`PUSH,16'b0,`RA};
  9: oInstruction = {`PUSH,16'b0,`R10};
  10: oInstruction = {`PUSH,16'b0,`R11};
  11: oInstruction = {`PUSH,16'b0,`R12};
  12: oInstruction = {`PUSH,16'b0,`R13};
  13: oInstruction = {`STO,`R10,`H};
  14: oInstruction = {`STO,`R11,`O};
  15: oInstruction = {`STO,`R12,`L};
  16: oInstruction = {`STO,`R13,`A};
  17: oInstruction = {`CALL,`ESCRIBIR4LETRAS,16'b0};
  18: oInstruction = {`STO,`R10,`ESPACIO};
  19: oInstruction = {`STO,`R11,`M};
  20: oInstruction = {`STO,`R12,`U};
  21: oInstruction = {`STO,`R13,`N};
  22: oInstruction = {`CALL,`ESCRIBIR4LETRAS,16'b0};
  23: oInstruction = {`STO,`R10,`ESPACIO};
  24: oInstruction = {`STO,`R11,`D};
  25: oInstruction = {`STO,`R12,`O};
  26: oInstruction = {`STO,`R13,`ESPACIO};
  27: oInstruction = {`CALL,`ESCRIBIR4LETRAS,16'b0};
  28: oInstruction = {`POP,`R13,16'b0};
  29: oInstruction = {`POP,`R12,16'b0};
  30: oInstruction = {`POP,`R11,16'b0};
  31: oInstruction = {`POP,`R10,16'b0};
  32: oInstruction = {`POP,`RA,16'b0};
  33: oInstruction = {`NOP,24'b0};
  34: oInstruction = {`RET,16'b0,`RA};
// ESCRIBIR4LETRAS:
  35: oInstruction = {`NOP,24'b0};
  36: oInstruction = {`LCD,8'b0,`R10,8'b0};
  37: oInstruction = {`NOP,24'b0};
  38: oInstruction = {`LCD,8'b0,`R11,8'b0};
  39: oInstruction = {`NOP,24'b0};
  40: oInstruction = {`LCD,8'b0,`R12,8'b0};
  41: oInstruction = {`NOP,24'b0};
  42: oInstruction = {`LCD,8'b0,`R13,8'b0};
  43: oInstruction = {`NOP,24'b0};
  44: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
