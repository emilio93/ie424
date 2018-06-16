module VGA(
  input wire clk,
  input wire rst,
  input wire [2:0] rgb,
  output reg [9:0] oCtrH, oCtrV,
  output reg RED, GREEN, BLUE, HS, VS
);
  // parameter SCREEN_HEIGHT = 478; // 480;

  /*        lineas   pixeles/linea   pixeles @ 25MHz
    bp vert 10     * 800           = 8000            = 320us
	 pw vert 2      * 800           = 1600            = 64us
    fp vert 29     * 800           = 23200           = 1056us
	 disp    480    * 800           = 384000          = 1536us
	 ------- 521    * 800           = 416800          =


	         pixeles @ 25MHz
    bp hori 16
	 pw hori 96
    fp hori 48
	 disp    640
	 ------- 800


	  bp     pw         fp         disp      bp
	 |--|------------|------|------...------|--|--...
	 ___              _________________________
 SYNC  \____________/                         \______


	          _______     _______     _______
	 vert ___/       \___/       \___/       \___
	        _   _   _   _   _   _   _   _   _   _
	 hori _/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_
  */
  parameter [18:0] tdisph = 19'd640, // 18'd640,
                   tpwh = 19'd96,    // 18'd96,
						 tfph = 19'd16,    // 18'd16,
						 tbph = 19'd48,    // 18'd48,
                   tpwv = 19'd1600,  // 18'd1600,
						 tfpv = 19'd8000,  // 18'd8000,
						 tbpv = 19'd23200, // 18'd23200;
						 tdispv = 19'd384000; // 18'd384000,
  parameter [10:0] screen_height = 11'd480,
                   screen_height_max = 11'd521;


  reg [18:0] rCtrV;
  reg [9:0] rCtrH;
  reg [9:0] rVerticalCount;

  // logica de salida para contadores en formato 640x480
  always @ (*) begin
    if (rVerticalCount>30 & rVerticalCount < 510 & rCtrH > tbph & rCtrH < tbph+tdisph+1) begin
	   {RED, GREEN, BLUE} = rgb;
	 end else begin
	   {RED, GREEN, BLUE} = 3'b0;
	 end
    //if (HS & VS) {RED, GREEN, BLUE} = rgb;
	 //else {RED, GREEN, BLUE} = 3'b000;

	 if (rCtrH > tbph & rCtrH < (tbph+tdisph)) begin
	   oCtrH = rCtrH-tbph;
	 end else begin
	   oCtrH = 0;
	 end

	 if (rVerticalCount > 30 & rVerticalCount < 510) begin
	   oCtrV = rVerticalCount-30;
	 end else begin
	   oCtrV = 0;
	 end
  end

  always @ (posedge clk) begin
	 if (rCtrH < (tbph+tdisph+tfph)) begin
		HS <= 1'b1;
		rCtrH <= rCtrH + 1;
	 end else if (rCtrH < (tbph+tdisph+tfph+tpwh)-1) begin
		HS <= 1'b0;
		rCtrH <= rCtrH + 1;
	 end else begin
		rCtrH <= 0;
	 end

	if (rCtrV < ((tbpv+tdispv+tfpv))) begin
		VS <= 1'b1;
		rCtrV <= rCtrV + 1;
	 end else if (rCtrV < (tbpv+tdispv+tfpv+tpwv)-1) begin
		VS <= 1'b0;
		rCtrV <= rCtrV + 1;
	 end else begin
		rCtrV <= 1'b0;
	 end
  end

  always @ (posedge HS or negedge VS) begin
    if(~VS) rVerticalCount <= 0;
    else rVerticalCount <= rVerticalCount+1;
  end

endmodule // LCD
