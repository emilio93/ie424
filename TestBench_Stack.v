`timescale 20ns / 10ns

module TestBench_Stack;

  reg        Clock;
  reg        Reset;
  reg        write;
  reg        read;
  reg        setSP;
  reg[6:0]   stackPointerIn;
	reg[15:0]  iDataIn;
	wire [15:0] oDataOut;

	// Instantiate the Unit Under Test (UUT)
  Stack stack (
    .Clock(Clock),
    .Reset(Reset),
    .write(write),
    .read(read),
    .setSP(setSP),
    .stackPointerIn(stackPointerIn),
    .iDataIn(iDataIn),
    .oDataOut(oDataOut)
  );
	
	always
	begin
		#1  Clock =  ! Clock;
	end

	initial begin
		// Initialize Inputs
		Clock = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
    @ (posedge Clock);
		Reset <= 1;
    
    iDataIn <= 15'b0;
    write <= 1'b0;
    read <= 1'b0;
    setSP <= 1'b0;
    stackPointerIn <= 6'b0;
    
    #50 
    @ (posedge Clock);
		Reset <= 0;
    
    // Test error write
    #100
    @ (posedge Clock);
    setStackPointer(6'b111110);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    idle();
    #10
    @ (posedge Clock);
    Reset <= 1;
    #10
    @ (posedge Clock);
    Reset <= 0;
    
    #20
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    
    @ (posedge Clock);
    idle();
    #120
    
    @ (posedge Clock);
    pop();
    @ (posedge Clock);
    pop();
    @ (posedge Clock);
    pop();
    @ (posedge Clock);
    pop();
    @ (posedge Clock);
    pop();
    @ (posedge Clock);
    pop();
    
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    
    @ (posedge Clock);
    idle();
    #120
    
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    idle();
    
    #100
    @ (posedge Clock);
    setStackPointer(6'b100000);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    idle();
    
    #100
    @ (posedge Clock);
    setStackPointer(6'b111100);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    push($random%63);
    @ (posedge Clock);
    pop();
    #100
    @ (posedge Clock);
    idle();
    
    
	end
  
  
  task push;
    input [15:0] data;
    begin
      setSP<=0;
      read<=0;
      write<=1;
      iDataIn<=data;
    end 
  endtask
  
  task pop;
    begin
      setSP<=0;
      write<=0;
      read<=1;
    end 
  endtask
  
  task idle;
    begin
      setSP<=0;
      write<=0;
      read<=0;
    end 
  endtask
  
  task setStackPointer;
    input [6:0] sp;
    begin
      setSP<=1;
      write<=0;
      read<=0;
      stackPointerIn<=sp;
    end 
  endtask

endmodule
