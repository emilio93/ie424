`timescale 1ns / 1ps
`include "Defintions.v"


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
  3: oInstruction = {`STO,`R10,`H};
  4: oInstruction = {`LCD,8'b0,`R10,8'b0};
  5: oInstruction = {`NOP,24'b0};

  default:
    oInstruction = {`LED,24'b10101010}; // NOP
  endcase	
end

endmodule
