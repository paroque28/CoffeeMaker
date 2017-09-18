`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:46:56 09/15/2017 
// Design Name: 
// Module Name:    TimeSelector 
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
module TimeSelector(
    input [2:0] c_type,
    input [2:0] ing_type,
    output reg [1:0] t_value
    );
always @(*)
begin
		if (c_type == 3'b001)
			case(ing_type)
				3'b001: t_value = 2;
				3'b010: t_value = 3;
				3'b011: t_value = 0;
				3'b100: t_value = 0;
				3'b101: t_value = 1;
				default: t_value = 0;
			endcase
		else if (c_type == 3'b010)
			case(ing_type)
				3'b001: t_value = 2;
				3'b010: t_value = 2;
				3'b011: t_value = 1;
				3'b100: t_value = 0;
				3'b101: t_value = 1;
				default: t_value = 0;
			endcase
		else if (c_type == 3'b011)
			case(ing_type)
				3'b001: t_value = 2;
				3'b010: t_value = 1;
				3'b011: t_value = 2;
				3'b100: t_value = 0;
				3'b101: t_value = 1;
				default: t_value = 0;
			endcase
		else if (c_type == 3'b100)
			case(ing_type)
				3'b001: t_value = 1;
				3'b010: t_value = 1;
				3'b011: t_value = 1;
				3'b100: t_value = 2;
				3'b101: t_value = 1;
				default: t_value = 0;
			endcase
		else
			t_value = 0;	
end

endmodule
