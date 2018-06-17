module serial2parallel(iReset, ClockTeclado, i1b, o8b);
  input ClockTeclado, i1b, iReset;
  output reg [7:0] o8b;
  reg [8:0] buffer_9b;
  reg [3:0] cont;
  reg reading, completed;
  //reg [4:0] Num;
    always @(negedge ClockTeclado or posedge iReset) begin
		if(iReset)begin
			reading<=1;
			completed<=0;
			cont<=0;
			//Num<=0;
		end
		 else begin
			if(i1b == 1'b0 && reading)begin
			  reading<=0;
			  completed<=0;
			  //Num<=0;		  
			end
			else if(reading==0) begin
				if(cont<9)begin
					completed <= 0;
					buffer_9b[8-cont] <= i1b;
					cont <= cont+1;
					/*if(i1b == 1)begin
						Num <= Num+1;
					end
					else begin
						Num <= Num;
					end*/
				end
				else begin 
					cont<=0;
					o8b<={buffer_9b[1], buffer_9b[2],buffer_9b[3],buffer_9b[4],buffer_9b[5],buffer_9b[6],buffer_9b[7],buffer_9b[8]};
					reading<=1;
					completed<=1;
				end
		    end
		end
	end
endmodule //serial2parallel
