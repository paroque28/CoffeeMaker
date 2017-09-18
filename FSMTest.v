`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:20:35 09/16/2017 
// Design Name: 
// Module Name:    FSMTest 
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
module FSMTest(
    input clk,
    input btnl,
	 input btnd,
	 input btnr,
	 input btnp,
	 input btnu,
	 input [3:0] speed,
    output [7:0] led,
	 output [6:0] seg,
	 output [3:0] an
    );
wire [3:0] bebida;
wire [3:0] total;
wire [3:0] cambio;
reg [3:0] display;
wire reset_wire;
wire cancel_wire; 
wire hundred_wire; 
wire five_hundred_wire;
wire ok;
wire [2:0] c_type;
wire [2:0] ing_type;
wire [1:0] t_value;
wire on_temp;
wire start_timer;


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
Debouncer expiredPB(
		.clk(clk),
		.signal(btnu),
		.signal_state(expired)
);
Debouncer reset(
		.clk(clk),
		.signal(btnp),
		.signal_state(reset_wire)
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
	.cambio(cambio),
	.ok(ok)
);

Contador monedero(
		.clk(clk),
		.one(hundred_wire),
		.five(five_hundred_wire),
		.reset(cancel_wire),
		.total(total)
);


clock_divisor clk_1Hz(
	.clk_100MHz(clk),
	.clk_1Hz(led[2]),
	.on(on_temp)
 );
 
TimeSelector time_select(
	.clk(clk),
	.ing_type(ing_type),
	.t_value(t_value)
 );
 
 temporizador temp(
	.clk_100MHz(clk),
	.value(t_value),
	.start_timer(start_timer),
	.t_expired(led[0]),	
	.on(on_temp)
);


assign led[1] = start_timer;
FSM fsm(
		.clk(clk),
		.ok(ok),
		.t_expired(reset_wire),
		.reset(expired),
		.ingredientes(led[7:3]),
		.start_timer(start_timer)
    );

always@(posedge clk)
begin
	if(cambio !=0)
		display = cambio;
	else
		display = total;
end


endmodule
