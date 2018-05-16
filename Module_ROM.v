`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd6
`define LOOP1 8'd7
`define LOOP2 8'd8
`define LOOPINFINITO 8'd13

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
  3: oInstruction = {`STO,`R13,16'b0};
  4: oInstruction = {`STO,`R14,14'D1000};
  5: oInstruction = {`STO,`R15,15'D1000};
// INICIO:
  6: oInstruction = {`STO,`R2,`H};
// LOOP1:
  7: oInstruction = {`STO,`R12,16'b0};
// LOOP2:
  8: oInstruction = {`ADD,`R12,`R12,`R1};
  9: oInstruction = {`BLE,`LOOP2,`R15,`R12};
  10: oInstruction = {`ADD,`R13,`R13,`R1};
  11: oInstruction = {`BLE,`LOOP1,`R14,`R13};
  12: oInstruction = {`LCD,8'b0,`R2,8'b0};
// LOOPINFINITO:
  13: oInstruction = {`NOP,24'd0};
  14: oInstruction = {`BLE,`LOOPINFINITO,`R1,`R0};
  15: oInstruction = {`NOP,24'd0};
  16: oInstruction = {`JMP,`INICIO,16'd0};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
