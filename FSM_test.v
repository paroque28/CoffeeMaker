`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:47:40 09/15/2017
// Design Name:   FSM
// Module Name:   C:/Users/ravargas/CoffeeMaker/FSM_test.v
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

module FSM_test;

	// Inputs
	reg clk;
	reg comparador_de_precio_ok;
	reg [1:0] c_type;
	reg t_expired;

	// Outputs
	wire [2:0] ing_type;
	wire start_timer;
	wire [7:3] led;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.comparador_de_precio_ok(comparador_de_precio_ok), 
		.c_type(c_type), 
		.t_expired(t_expired), 
		.ing_type(ing_type), 
		.start_timer(start_timer), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		comparador_de_precio_ok = 0;
		c_type = 0;
		t_expired = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

