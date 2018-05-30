`timescale 1ns / 1ps

module VGAAdapter # (parameter DATA_WIDTH=3, parameter widthOut=640, parameter heightOut=480, parameter widthIn=16, parameter heightIn=12) (
  input wire Clock,
  input wire [$clog2(widthOut*heightOut)-1:0] widthPos,
  input wire [$clog2(widthOut*heightOut)-1:0] heightPos,
  input wire writeEnable,
  input wire [DATA_WIDTH-1:0] dataIn,
  output reg [DATA_WIDTH-1:0] dataOut
);

  wire [$clog2(widthIn*heightIn)-1:0] setAddress;

  assign setAddress = heightPos*widthIn+widthPos;
  
  VGARam # (DATA_WIDTH, $clog2(widthIn*heightIn), widthIn*heightIn) VideoMemory
  (
    .Clock( Clock ),
    .iWriteEnable( writeEnable ),
    .iReadAddress( setAddress ),
    .iWriteAddress( setAddress ),
    .iDataIn( dataIn ),
    .oDataOut( dataOut )
  );

endmodule
