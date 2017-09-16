`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:57 09/14/2017 
// Design Name: 
// Module Name:    FSM 
// Project Name: 
// Tar**get Devices: 
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
module FSM(
		input clk,
		input [2:0] c_type,
		input ok,
		input t_expired,
		output reg [2:0] ing_type,
		output reg [1:0] length_time,
		output reg start_timer,
		output reg [3:0] ingredients
    );
	 
reg [2:0] c_type_saved = 0;

always@(clk)
begin
	if(ok && |c_type && ~|c_type_saved)
		c_type_saved = c_type;
	else
		c_type_saved = c_type_saved;
	
	if (ok && |c_type_saved)
	begin
		if (|timeLeft)
		begin
			start_time = 1;
			
		end
	end
end

endmodule
