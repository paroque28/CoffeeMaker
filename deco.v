`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:54 09/11/2017 
// Design Name: 
// Module Name:    deco 
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
module deco(
	 input clk,
    input [1:0] in,
    output reg [3:0] out
    );

always@(posedge clk)
begin
	case (in)
	  2'b00 : out <= 4'b1110;
	  2'b01 : out <= 4'b1101;
	  2'b10 : out <= 4'b1011;
	  2'b11 : out <= 4'b0111;
	  default : out <= 0;
	endcase
end
endmodule
