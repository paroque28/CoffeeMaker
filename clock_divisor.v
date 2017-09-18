`timescale 10s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:04 09/04/2017 
// Design Name: 
// Module Name:    clock_divisor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divisor(
    input clk_100MHz,
	 input reset,
    output reg clk_1Hz 
    );
	 

reg[25:0] contador = 0;
reg reset_last = 0;
initial clk_1Hz = 0 ;

always @(posedge clk_100MHz)
begin
	if (reset && reset != reset_last)
	begin
		contador = 0;
		clk_1Hz = 0;
		reset_last = reset;
	end
	else
	begin
		if(contador != 50000000)	
		begin
			contador = contador + 1 ; 
		end
		else
		begin
			contador = 0;
			clk_1Hz = ~clk_1Hz; 
		end
		reset_last = reset;
	end
end
endmodule
