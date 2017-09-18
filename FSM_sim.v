`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:12 09/16/2017
// Design Name:   FSM
// Module Name:   C:/Xilinx/CoffeeMaker/FSM_sim.v
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

module FSM_sim;

	// Inputs
	reg clk;
	reg ok;
	reg [1:0] c_type;
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
		.c_type(c_type), 
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
		c_type = 0;
		t_expired = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 c_type = 2;
		#10 ok = 1;
		#10 t_expired = 1;
		#10 t_expired = 0;
		#10 t_expired = 1;
		#10 t_expired = 0;
		#10 t_expired = 1;
		#10 t_expired = 0;
		#10 t_expired = 1;
		#10 t_expired = 0;
		#10 t_expired = 1;
		#10 t_expired = 0;
		
	end
	
	always 
		#5  clk =  ! clk; 
endmodule

