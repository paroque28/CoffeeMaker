`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:33:37 09/11/2017 
// Design Name: 
// Module Name:    ContadorTest 
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
module ContadorTest(
	 input clk,
    input btnl,
	 input btnd,
	 input btnr,
    output [7:3] led,
	 output [6:0] seg,
	 output [3:0] an
    );
	 
	wire [3:0] total;
	wire test;
	wire cancel_wire; 
	wire hundred_wire; 
	wire five_hundred_wire;
	
	
	
	
	seven_segment seven_seg(
			.clk(clk),
			.in(total),
			.seg(seg),
			.an(an)
	);
	Contador monedero(
			.clk(clk),
			.one(hundred_wire),
			.five(five_hundred_wire),
			.reset(cancel_wire),
			.total(total)
	);
	Debouncer cancel(
			.clk(clk),
			.signal(btnd),
			.signal_state(cancel_wire)
	);
	Debouncer hundred_coin(
			.clk(clk),
			.signal(btnl),
			.signal_up(hundred_wire)
	);
	Debouncer five_hundred_coin(
			.clk(clk),
			.signal(btnr),
			.signal_up(five_hundred_wire)
	);
	

endmodule