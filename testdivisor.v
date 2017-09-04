`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:38 09/04/2017 
// Design Name: 
// Module Name:    testdivisor 
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
module testdivisor(

    input clk,
    output [7:3] led
	 
    );

	clock_divisor div(
		.clk_100MHz(clk),
		.clk_1Hz(led[7])
	);

endmodule
