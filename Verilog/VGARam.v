`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:37:54 05/30/2018 
// Design Name: 
// Module Name:    VGARam 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGARam # ( parameter DATA_WIDTH= 16, parameter ADDR_WIDTH=8, parameter MEM_SIZE=8 )
(
  input wire Clock,
  input wire iWriteEnable,
  input wire[ADDR_WIDTH-1:0] iReadAddress,
  input wire[ADDR_WIDTH-1:0] iWriteAddress,
  input wire[DATA_WIDTH-1:0] iDataIn,
  output reg [DATA_WIDTH-1:0] oDataOut
);
  reg [DATA_WIDTH-1:0] Ram [MEM_SIZE-1:0];
  always @(posedge Clock)
  begin
    if (iWriteEnable) Ram[iWriteAddress] <= iDataIn;
    oDataOut <= Ram[iReadAddress];
  end
endmodule