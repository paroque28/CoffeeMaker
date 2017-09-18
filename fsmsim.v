`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:19:08 09/17/2017
// Design Name:   FSM
// Module Name:   C:/Xilinx/CoffeeMaker/fsmsim.v
// Project Name:  CoffeeMaker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsmsim;

	// Inputs
	reg clk;
	reg ok;
	reg t_expired;
	reg reset;

	// Outputs
	wire [2:0] ing_type;
	wire start_timer;
	wire [7:3] ingredientes;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.ok(ok), 
		.t_expired(t_expired), 
		.reset(reset), 
		.ing_type(ing_type), 
		.start_timer(start_timer), 
		.ingredientes(ingredientes)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ok = 0;
		t_expired = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 ok = 1;
		#10 ok = 0;
		#100 t_expired = 1;
		#1 t_expired = 0;
		#100 t_expired = 1;
		#1 t_expired = 0;
	end
   always 
	  #1  clk =  ! clk;
	  
endmodule

