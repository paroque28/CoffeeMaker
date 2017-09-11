`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:42 09/11/2017
// Design Name:   temporizador
// Module Name:   C:/Users/ravargas/CoffeeMaker/temporizador_test.v
// Project Name:  CoffeeMaker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: temporizador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module temporizador_test;

	// Inputs
	reg clk_100MHz;
	reg value;
	reg start_timer;

	// Outputs
	wire t_expired;

	// Instantiate the Unit Under Test (UUT)
	temporizador uut (
		.clk_100MHz(clk_100MHz), 
		.value(value), 
		.texpired(texpired), 
		.start_timer(start_timer)
	);

	initial begin
		// Initialize Inputs
		clk_100MHz = 0;
		value = 0;
		start_timer = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 start_timer=1 ;
		#10 value=1 ;
		
		end
	always
      #1  clk_100MHz =  ! clk_100MHz; 
	
      
endmodule

