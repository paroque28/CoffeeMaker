`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:15 09/14/2017 
// Design Name: 
// Module Name:    SelectBebida 
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
module SelectBebida(
	 input clk,
    input [3:0] switches,
    output reg [2:0] c_type
    );

always @(posedge clk)
begin
	case (switches)
			4'b0000 : c_type = 3'b000;
			4'b0001 : c_type = 3'b001;
			4'b0010 : c_type = 3'b010;
			4'b0100 : c_type = 3'b011;
			4'b1000 : c_type = 3'b100;
			default : c_type = 3'b000;
	endcase
end
endmodule
