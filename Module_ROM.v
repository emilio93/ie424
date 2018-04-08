`timescale 1ns / 1ps
`include "Defintions.v"

`define LOOP1 8'd9
`define LOOP2 8'd6
module ROM
(
	input  wire[15:0]  		iAddress,
	output reg [27:0] 		oInstruction
);	
always @ ( iAddress )
begin
	case (iAddress)

	0: oInstruction = { `NOP ,24'd4000    };
	1: oInstruction = { `STO ,`R7,16'b000000000010 };
	2: oInstruction = { `STO ,`R3,16'b000000001001}; 
	3: oInstruction = { `STO ,`R6,16'b000000000010}; 
	4: oInstruction = { `STO, `R4,16'd100 };
	5: oInstruction = { `STO, `R5,16'd0     };  //j
//LOOP2:
	6: oInstruction = { `LED ,8'b0,`R7,8'b0 };
	7: oInstruction = { `STO ,`R1,16'h0     }; 	
	8: oInstruction = { `STO ,`R2,16'd65 };
//LOOP1:	
	9: oInstruction = { `ADD ,`R1,`R1,`R6    }; 
	10: oInstruction = { `BLE ,`LOOP1,`R1,`R2 }; 
	
	11: oInstruction = { `ADD ,`R5,`R5,`R6    };
	12: oInstruction = { `BLE ,`LOOP2,`R5,`R4 };	
	13: oInstruction = { `NOP ,24'd4000       }; 
	14: oInstruction = { `MUL2 ,`R7,`R7,`R3    };
	15: oInstruction = { `NOP ,24'd4000       };
	16: oInstruction = { `JMP ,  8'd2,16'b0   };
	default:
		oInstruction = { `LED ,  24'b10101010 };		//NOP
	endcase	
end
	
endmodule
