`timescale 1ns / 1ps

module Stack # ( parameter DATA_WIDTH= 16, parameter ADDR_WIDTH=10, parameter MEM_SIZE=64 )
(
  input wire                        Clock,
  input wire                        Reset,
  input wire                        write,
  input wire                        read,
  input wire                        setSP,
  input wire [5:0] stackPointerIn,
  input wire[DATA_WIDTH-1:0]        iDataIn,
  output reg [DATA_WIDTH-1:0]       oDataOut,
  output reg [5:0] stackPointer
);

  // memoria
  reg [DATA_WIDTH-1:0] stack [MEM_SIZE-1:0];

  always @ (stackPointer) begin
    if (stackPointer == 0) oDataOut = stack[0];
    else oDataOut = stack[stackPointer-1];
  end

  always @(posedge Clock or posedge Reset) begin
    if (Reset) begin
      stackPointer <= 0;
    end else begin
      if (write) begin
        stack[stackPointer] <= iDataIn;
        if (stackPointer < MEM_SIZE-1) stackPointer <= stackPointer + 1;
      end else if (read) begin
        if (stackPointer > 0) stackPointer <= stackPointer - 1;
      end else if (setSP) begin
        stackPointer <= stackPointerIn;
      end
    end
  end

endmodule
