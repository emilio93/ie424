//`timescale 1ns/1ns

`define STATE_RST   0
`define STATE_PWV   1
`define STATE_BPV   2
`define STATE_PWH   3
`define STATE_BPH   4
`define STATE_DISPH 5
`define STATE_FPH   6
`define STATE_FPV   7

module VGA(
  input wire clk,
  input wire rst,
  input wire [2:0] data,
  output reg [18:0] oCtrH, oCtrV,
  output reg [2:0] colorChannels,
  output reg oHSync,
  output reg oVSync
);
  parameter SCREEN_HEIGHT = 478; // 480;
  parameter [18:0] tdisph = 18'd638, // 18'd640, 
                   tpwh = 18'd94,    // 18'd96, 
						 tfph = 18'd14,    // 18'd16, 
						 tbph = 18'd46,    // 18'd48,
                   tpwv = 18'd1598,  // 18'd1600, 
						 tfpv = 18'd7998,  // 18'd8000, 
						 tbpv = 18'd23198; // 18'd23200;
  reg rRed, rGreen, rBlue;
  reg [18:0] rCntV;

  reg [2:0] state, next;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      //state <= 5'b0;
      state <= `STATE_RST;
		oCtrH <= 0;
		oCtrV <= 0;
		rCntV <= 0;
	 end else begin
      state <= next;
		{rRed, rGreen, rBlue} <= data;
      if (state == `STATE_PWV | state == `STATE_BPV | state == `STATE_FPV) begin
        rCntV <= rCntV+1;
      end else if (state == `STATE_PWH |
              	    state == `STATE_BPH |
						 state == `STATE_FPH |
						 state == `STATE_DISPH) begin
		  oCtrH <= oCtrH+1;
		end
		
		if (state == `STATE_PWV) begin
		  oCtrV <= 0;
		end else if (state == `STATE_PWH & state != next) begin
		  if (oCtrV > SCREEN_HEIGHT) oCtrV <= 0;
		  else oCtrV <= oCtrV + 1;
		end
		
		if (state != next) begin 
		  rCntV <= 0;
		  oCtrH <= 0;
		end
	 end
  end

  always @(*) begin
    next = 0;
    drive_defaults;
    case (state)
       `STATE_RST: begin
       next = `STATE_PWV;
      end
      `STATE_PWV: begin
        if (rCntV>tpwv) next = `STATE_BPV;
        else next = `STATE_PWV;
		  oVSync = 1'b0;
      end
      `STATE_BPV: begin
		  if (rCntV>tbpv) next = `STATE_PWH;
        else next = `STATE_BPV;
      end
      `STATE_PWH: begin
		  if (oCtrH>tpwh) next = `STATE_BPH;
        else next = `STATE_PWH;
		  oHSync = 1'b0;
      end
      `STATE_BPH: begin
		  if (oCtrH>tbph) next = `STATE_DISPH;
        else next = `STATE_BPH;
      end
      `STATE_DISPH: begin
		  if (oCtrH>tdisph) next = `STATE_FPH;
        else next = `STATE_DISPH;
      end
      `STATE_FPH: begin
		  if (oCtrV>SCREEN_HEIGHT) next = `STATE_FPV;
		  else if (oCtrH>tfph) next = `STATE_PWH;
        else next = `STATE_FPH;
      end
      `STATE_FPV: begin
		  if (rCntV>tfpv) next = `STATE_PWV;
        else next = `STATE_FPV;
      end
	 endcase
  end

  task drive_defaults;
    begin
      colorChannels = {rRed, rGreen, rBlue};
      oHSync = 1'b1;
      oVSync = 1'b1;
    end
  endtask
endmodule // LCD
