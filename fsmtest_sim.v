`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:28 09/16/2017
// Design Name:   FSMTest
// Module Name:   C:/Xilinx/CoffeeMaker/fsmtest_sim.v
// Project Name:  CoffeeMaker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSMTest
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsmtest_sim;

	// Inputs
	reg clk;
	reg btnl;
	reg btnd;
	reg btnr;
	reg btnp;
	reg btnu;
	reg [3:0] speed;

	// Outputs
	wire [7:2] led;
	wire [6:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	FSMTest uut (
		.clk(clk), 
		.btnl(btnl), 
		.btnd(btnd), 
		.btnr(btnr), 
		.btnp(btnp), 
		.btnu(btnu), 
		.speed(speed), 
		.led(led), 
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btnl = 0;
		btnd = 0;
		btnr = 0;
		btnp = 0;
		btnu = 0;
		speed = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 speed = 4'b0001;
		#10 btnr = 1;
		#1 btnr = 0;
		#10 t_expired = 1;speed = 4'b0001;
		#10 t_expired = 0;speed = 4'b0001;
		#10 t_expired = 1;speed = 4'b0001;
		#10 t_expired = 0;speed = 4'b0001;
		#10 t_expired = 1;speed = 4'b0001;
		#10 t_expired = 0;
	end
   always 
		#1  clk =  ! clk;
endmodule

