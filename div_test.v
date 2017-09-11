`timescale 10s / 1ms

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:59 09/04/2017
// Design Name:   testdivisor
// Module Name:   C:/Users/ravargas/CoffeeMaker/div_test.v
// Project Name:  CoffeeMaker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: testdivisor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module div_test;

	// Inputs
	reg clk;

	// Outputs
	wire [7:3] led;

	// Instantiate the Unit Under Test (UUT)
	testdivisor uut (
		.clk(clk), 
		.led(led)
	);
	initial 
	begin 
       
		#100;
		clk = 0;
	end 
	
   always
       #1  clk =  ! clk; 
      
endmodule

