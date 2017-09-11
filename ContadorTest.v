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
	 input btnp,
    output [7:3] led
    );
	 
	wire [3:0] out;
	wire test;
	assign led[7] = out[0];
	assign led[6] = out[1];
	assign led[5] = out[2];
	assign led[4] = out[3];
	assign led[3] = test;
	wire cancel_wire; 
	wire hundred_wire; 
	wire five_hundred_wire;
	
	Contador monedero(
			.clk(clk),
			.one(hundred_wire),
			.five(five_hundred_wire),
			.reset(cancel_wire),
			.total(out)
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
	Debouncer reset(
			.clk(clk),
			.signal(btnp),
			.signal_state(test)
	);
	

endmodule