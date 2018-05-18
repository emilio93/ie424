`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd3
`define LOOPINFINITO 8'd18
`define ESCRIBIRLCD 8'd21

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
  3: oInstruction = {`STO,`R10,`H};
  4: oInstruction = {`STO,`R11,`O};
  5: oInstruction = {`STO,`R12,`L};
  6: oInstruction = {`STO,`R13,`A};
  7: oInstruction = {`CALL,`ESCRIBIRLCD,16'b0};
  8: oInstruction = {`STO,`R10,`ESPACIO};
  9: oInstruction = {`STO,`R11,`M};
  10: oInstruction = {`STO,`R12,`U};
  11: oInstruction = {`STO,`R13,`N};
  12: oInstruction = {`CALL,`ESCRIBIRLCD,16'b0};
  13: oInstruction = {`STO,`R10,`ESPACIO};
  14: oInstruction = {`STO,`R11,`D};
  15: oInstruction = {`STO,`R12,`O};
  16: oInstruction = {`STO,`R13,`ESPACIO};
  17: oInstruction = {`CALL,`ESCRIBIRLCD,16'b0};
// LOOPINFINITO:
  18: oInstruction = {`BLE,`LOOPINFINITO,`R0,`R1};
  19: oInstruction = {`NOP,24'd0};
  20: oInstruction = {`JMP,`INICIO,16'd0};
// ESCRIBIRLCD:
  21: oInstruction = {`NOP,24'b0};
  22: oInstruction = {`LCD,8'b0,`R10,8'b0};
  23: oInstruction = {`NOP,24'b0};
  24: oInstruction = {`LCD,8'b0,`R11,8'b0};
  25: oInstruction = {`NOP,24'b0};
  26: oInstruction = {`LCD,8'b0,`R12,8'b0};
  27: oInstruction = {`NOP,24'b0};
  28: oInstruction = {`LCD,8'b0,`R13,8'b0};
  29: oInstruction = {`NOP,24'b0};
  30: oInstruction = {`RET,16'b0,`RA};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
