`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:37 09/04/2017 
// Design Name: 
// Module Name:    DebouncerTest 
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
module DebouncerTest(
	 input clk,
    input btnp,
    output [7:3] led
    );
	 
	wire out;
	assign led[7] = out;
	assign led[6] = out;
	assign led[5] = btnp;
	Debouncer reset(
			.clk(clk),
			.signal(btnp),
			.signal_state(out),
			.signal_down(led[4]),
			.signal_up(led[3])
	);
	
	

endmodule
