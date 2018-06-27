`timescale 1ns / 1ps

// El adaptador es una interfaz entre la memoria de video y el controlador vga
// para la memoria de video actua como un lector de widthMemPos x heightMemPos,
// para el controlador funciona como una memoria de widthVgaPos x heightVgaPos,
module VGAAdapter # (
  parameter WIDTH_VGA=640,
  parameter HEIGHT_VGA=480,
  parameter WIDTH_MEM=16,
  parameter HEIGHT_MEM=12,
  parameter WIDTH_BLOCK=40, // 640 / 16
  parameter HEIGHT_BLOCK=40 // 480 / 12
) (
  input wire [9:0] widthVgaPos,
  input wire [9:0] heightVgaPos,
  output reg [3:0] widthMemPos,
  output reg [3:0] heightMemPos
);

  genvar i, j;
  generate
    for (i = 0; i < WIDTH_MEM; i=i+1) begin : fori
      always @ (*) begin
        if (widthVgaPos < i*WIDTH_BLOCK) widthMemPos = i;
      end
    end
    for (j = 0; j < HEIGHT_MEM; j=j+1) begin : forj
      always @ (*) begin
        if (heightVgaPos < j*HEIGHT_BLOCK) heightMemPos = j;
      end
    end
  endgenerate

endmodule
