`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:32 09/14/2017 
// Design Name: 
// Module Name:    ComparadorTest 
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
module ComparadorTest(
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
	 

	wire [3:0] bebida;
	wire [3:0] total;
	wire [3:0] cambio;
	reg [3:0] display;
	wire cancel_wire; 
	wire hundred_wire; 
	wire five_hundred_wire;
	wire [2:0] c_type;
	
	
	Debouncer coffee(
		.clk(clk),
		.signal(speed[0]),
		.signal_state(bebida[0])
	);
	Debouncer coffee_milk(
		.clk(clk),
		.signal(speed[1]),
		.signal_state(bebida[1])
	);
	Debouncer cappuc(
		.clk(clk),
		.signal(speed[2]),
		.signal_state(bebida[2])
	);
	Debouncer mocca(
		.clk(clk),
		.signal(speed[3]),
		.signal_state(bebida[3])
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
	
	
	
	SelectBebida selector(
		.clk(clk),
		.switches(bebida),
		.c_type(c_type)
	);
	seven_segment seven_seg(
			.clk(clk),
			.in(display),
			.seg(seg),
			.an(an)
	);
	Comparador comparador (
		.clk(clk),
		.dinero(total),
		.c_type(c_type),
		.cambio(cambio)
	);
	
	Contador monedero(
			.clk(clk),
			.one(hundred_wire),
			.five(five_hundred_wire),
			.reset(cancel_wire),
			.total(total)
	);
	assign led [7] = c_type[0];
	assign led [6] = c_type[1];
	assign led [5] = c_type[2];
	
	

always@(posedge clk)
begin
	if(cambio !=0)
		display = cambio;
	else
		display = total;
end


endmodule
