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
  output reg [4:0] widthMemPos,
  output reg [4:0] heightMemPos
);

  genvar i, j;
  generate
    for (i = WIDTH_MEM; i > 0; i=i-1) begin : fori
      always @ (*) begin
        if (widthVgaPos < (i)*WIDTH_BLOCK) widthMemPos = (i-1);
      end
    end
    for (j = HEIGHT_MEM; j > 0; j=j-1) begin : forj
      always @ (*) begin
        if (heightVgaPos < (j)*HEIGHT_BLOCK) heightMemPos = (j-1);
      end
    end
  endgenerate
//
//      always @ (*) begin 
//   widthMemPos = widthVgaPos < 40 ? 4'd0 : 
//                      widthVgaPos < 80 ? 4'd1: 
//                      widthVgaPos < 120 ? 4'd2: 
//                      widthVgaPos < 160 ? 4'd3: 
//                      widthVgaPos < 200 ? 4'd4: 
//                      widthVgaPos < 240 ? 4'd5: 
//                      widthVgaPos < 280 ? 4'd6: 
//                      widthVgaPos < 320 ? 4'd7: 
//                      widthVgaPos < 360 ? 4'd8: 
//                      widthVgaPos < 400 ? 4'd9: 
//                      widthVgaPos < 440 ? 4'd10: 
//                      widthVgaPos < 480 ? 4'd11: 
//                      widthVgaPos < 520 ? 4'd12: 
//                      widthVgaPos < 560 ? 4'd13: 
//                      widthVgaPos < 600 ? 4'd14: 
//                      widthVgaPos < 640 ? 5'd15: 0; 
// 
//  heightMemPos = heightVgaPos < 40 ? 4'd0 : 
//                      heightVgaPos < 80 ? 4'd1: 
//                      heightVgaPos < 120 ? 4'd2: 
//                      heightVgaPos < 160 ? 4'd3: 
//                      heightVgaPos < 200 ? 4'd4: 
//                      heightVgaPos < 240 ? 4'd5: 
//                      heightVgaPos < 280 ? 4'd6: 
//                      heightVgaPos < 320 ? 4'd7: 
//                      heightVgaPos < 360 ? 4'd8: 
//                      heightVgaPos < 400 ? 4'd9: 
//                      heightVgaPos < 440 ? 4'd10: 
//                      heightVgaPos < 480 ? 4'd11: 0; 
//      end 

endmodule
