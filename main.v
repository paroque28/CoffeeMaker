`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:24 09/15/2017 
// Design Name: 
// Module Name:    main 
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
module main(
    input clk,
    input btnl,
	 input btnd,
	 input btnr,
	 input btnp,
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
wire reset_contador_wire;
wire cobrar_wire;
wire cancel_wire; 
wire hundred_wire; 
wire five_hundred_wire;
wire [2:0] c_type;
wire [2:0] c_type_saved;
wire t_expired;
wire [2:0] ing_type;
wire [1:0] t_value;
wire on_temp;
wire start_timer;

// BUTTONS
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
Debouncer reset(
		.clk(clk),
		.signal(btnp),
		.signal_state(reset_wire)
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


//LOGIC
SelectBebida selector(
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
assign reset_contador_wire = cancel_wire||cobrar_wire;
Contador monedero(
		.clk(clk),
		.one(hundred_wire),
		.five(five_hundred_wire),
		.reset(reset_contador_wire),
		.total(total)
);


temporizador temp(
	.clk_100MHz(clk),
	.value(t_value),
	.start_timer(start_timer),
	.t_expired(t_expired),	
	.reset(on_temp)
);


clock_divisor clk_1Hz(
	.clk_100MHz(clk),
	.clk_1Hz(led[2]),
	.reset(on_temp)
 );
 
TimeSelector time_select(
	.c_type(c_type_saved),
	.ing_type(ing_type),
	.t_value(t_value)
 );

FSM fsm(
		.clk(clk),
		.ok(ok),
		.c_type(c_type),
		.t_expired(t_expired),
		.reset(reset_wire),
		.ing_type(ing_type),
		.start_timer(start_timer),
		.ingredientes(led[7:3]),
		.cobrar(cobrar_wire),
		.c_type_saved(c_type_saved)
    );
	

always@(posedge clk)
begin
	if(cambio !=0)
		display = cambio;
	else
		display = total;
end


endmodule
