`timescale 1ns / 1ps

// El adaptador es una interfaz entre la memoria de video y el controlador vga
// para la memoria de video actua como un lector de widthMemPos x heightMemPos,
// para el controlador funciona como una memoria de widthVgaPos x heightVgaPos,
module VGAAdapter # (
  parameter WIDTH_VGA=640,
  parameter HEIGHT_VGA=480,
  parameter WIDTH_MEM=40,
  parameter HEIGHT_MEM=30,
  parameter WIDTH_BLOCK=16,
  parameter HEIGHT_BLOCK=16
) (
  input wire [9:0] widthVgaPos,
  input wire [9:0] heightVgaPos,
  output reg [5:0] widthMemPos,
  output reg [5:0] heightMemPos
);

  always @ (*) begin
    widthMemPos = widthVgaPos/WIDTH_BLOCK;

    heightMemPos = heightVgaPos/HEIGHT_BLOCK;
  end


endmodule
