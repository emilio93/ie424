`timescale 1ns / 1ps

// El adaptador es una interfaz entre la memoria de video y el controlador vga
// para la memoria de video actua como un lector de widthIn x heightIn,
// para el controlador funciona como una memoria de widthOut x heightOut,
//
//
module VGAAdapter # (
  parameter DATA_WIDTH=3,
  parameter widthOut=640,
  parameter heightOut=480,
  parameter widthIn=16,
  parameter heightIn=12
) (
  input wire [9:0] widthPos,
  input wire [9:0] heightPos,
  output reg [15:0] widthMin,
  output reg [12:0] heightMin
);

always @ (*) begin
   widthMin = widthPos < 16 ? 4'd0 :
                      widthPos >= 40 & widthPos < 80 ? 4'd1:
                      widthPos >= 80 & widthPos < 120 ? 4'd2:
                      widthPos >= 120 & widthPos < 160 ? 4'd3:
                      widthPos >= 160 & widthPos < 160 ? 4'd4:
                      widthPos >= 200 & widthPos < 240 ? 4'd5:
                      widthPos >= 240 & widthPos < 280 ? 4'd6:
                      widthPos >= 280 & widthPos < 320 ? 4'd7:
                      widthPos >= 320 & widthPos < 360 ? 4'd8:
                      widthPos >= 360 & widthPos < 400 ? 4'd9:
                      widthPos >= 400 & widthPos < 440 ? 4'd10:
                      widthPos >= 440 & widthPos < 480 ? 4'd11:
                      widthPos >= 480 & widthPos < 520 ? 4'd12:
                      widthPos >= 520 & widthPos < 560 ? 4'd13:
                      widthPos >= 560 & widthPos < 600 ? 4'd14:
                      widthPos >= 600 & widthPos < 640 ? 5'd15: 0;

  heightMin = heightPos < 16 ? 4'd0 :
                      heightPos >= 40  & heightPos < 80 ? 4'd1:
                      heightPos >= 80  & heightPos < 120 ? 4'd2:
                      heightPos >= 120 & heightPos < 160 ? 4'd3:
                      heightPos >= 160 & heightPos < 160 ? 4'd4:
                      heightPos >= 200 & heightPos < 240 ? 4'd5:
                      heightPos >= 240 & heightPos < 280 ? 4'd6:
                      heightPos >= 280 & heightPos < 320 ? 4'd7:
                      heightPos >= 320 & heightPos < 360 ? 4'd8:
                      heightPos >= 360 & heightPos < 400 ? 4'd9:
                      heightPos >= 400 & heightPos < 440 ? 4'd10:
                      heightPos >= 440 & heightPos < 480 ? 4'd11: 0;

end
//  genvar i, j;
//  generate
//    for (i=0; i<countH; i=i+1) begin : for_no_i
//		  if (widthPos >= i*countH & widthPos < (i+1)*countH) begin
//		    widthMin = i;
//		  end
//	 end
//	for (j=0; j<countV; j=j+1) begin : for_no_j
//		  if (heightPos >= $j*countV & heightPos < ($j+1)*countV) begin
//          heightMin = $j;
//		end
//	end
//  endgenerate

endmodule
