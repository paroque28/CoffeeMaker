`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:25:39 09/11/2017 
// Design Name: 
// Module Name:    Contador 
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
module Contador(
	 input clk,
    input one,
    input five,
    input reset,
    output reg [3:0] total
    );
	 
	always @(posedge clk)
		if (reset) total <= 0 ;
		else 
		begin
			if (one) total <= total + 1;
			if (five) total <= total + 5;
		end

endmodule
