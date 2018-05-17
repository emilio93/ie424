`timescale 1ns / 1ps
`include "Defintions.v"

`define INICIO 8'd6
`define LOOP1 8'd7
`define LOOP2 8'd9
`define LOOPINFINITO 8'd14

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
  3: oInstruction = {`STO,`R14,16'd100};
  4: oInstruction = {`STO,`R15,16'd100};
  5: oInstruction = {`STO,`R10,`H};
// INICIO:
  6: oInstruction = {`STO,`R13,16'b0};
// LOOP1:
  7: oInstruction = {`STO,`R12,16'b0};
  8: oInstruction = {`NOP,24'd0};
// LOOP2:
  9: oInstruction = {`ADD,`R12,`R12,`R1};
  10: oInstruction = {`BLE,`LOOP2,`R12,`R15};
  11: oInstruction = {`ADD,`R13,`R13,`R1};
  12: oInstruction = {`BLE,`LOOP1,`R13,`R14};
  13: oInstruction = {`LCD,8'b0,`R10,8'b0};
// LOOPINFINITO:
  14: oInstruction = {`BLE,`LOOPINFINITO,`R0,`R1};
  15: oInstruction = {`NOP,24'd0};
  16: oInstruction = {`JMP,`INICIO,16'd0};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
