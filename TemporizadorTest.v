`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:58 09/15/2017 
// Design Name: 
// Module Name:    TemporizadorTest 
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
module TemporizadorTest(
	 input clk,
    input btnl,
	 input btnd,
	 input btnr,
	 input btnp,
	 input [3:0] speed,
    output [7:3] led,
	 output [6:0] seg,
	 output [3:0] an
    );
wire out;
wire on;
Debouncer started(
			.clk(clk),
			.signal(btnp),
			.signal_state(out)
	);

temporizador temp(
	.clk_100MHz(clk),
	.value(speed[1:0]),
	.start_timer(out),
	.t_expired(led[7]),	
	.on(on)
);


clock_divisor clk_1Hz(
	.clk_100MHz(clk),
	.clk_1Hz(led[6]),
	.on(on)
 );


endmodule
