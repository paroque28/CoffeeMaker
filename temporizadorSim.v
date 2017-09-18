`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:48:30 09/16/2017
// Design Name:   temporizador
// Module Name:   C:/Xilinx/CoffeeMaker/temporizadorSim.v
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

module temporizadorSim;

	// Inputs
	reg clk_100MHz;
	reg [1:0] value;
	reg start_timer;

	// Outputs
	wire t_expired;
	wire on;
	wire counting;
	wire [1:0] counter;
	wire clk_1Hz;
	wire add_one;
	wire add_one_last;

	// Instantiate the Unit Under Test (UUT)
	temporizador uut (
		.clk_100MHz(clk_100MHz), 
		.value(value), 
		.start_timer(start_timer), 
		.t_expired(t_expired), 
		.on(on),
		.counting(counting),
		.counter(counter),
		.clk_1Hz(clk_1Hz),
		.add_one(add_one),
		.add_one_last(add_one_last)
	);

	initial begin
		// Initialize Inputs
		clk_100MHz = 0;
		value = 0;
		start_timer = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 value = 1;
		
		#10 start_timer = 1;
		#10 start_timer = 0;
	end
	
	always 
	#1  clk_100MHz =  ! clk_100MHz;
      
endmodule

