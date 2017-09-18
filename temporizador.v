`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:12 09/11/2017 
// Design Name: 
// Module Name:    temporizador 
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
module temporizador(
	 input clk_100MHz,
    input[1:0]    value,
	 input   start_timer,
    output reg  t_expired, 
	 output reg reset
    );
	 

reg[1:0] counter = 0;
reg counting = 0;
reg add_one = 0;
reg add_one_last = 0;


initial
begin
	counter = 0;
	counting = 0;
	add_one = 0;
	add_one_last = 0;
end

clock_divisor clk_dev(
	.clk_100MHz(clk_100MHz),
	.clk_1Hz(clk_1Hz),
	.reset(reset)
 );


 
always @(posedge clk_100MHz)
begin
	
	if(counting)
	begin
	
		if(add_one_last != add_one)
		begin
			add_one_last = add_one;
			counter = counter + 1;
		end
		else
		begin
			counter = counter;
		end
		
		if(counter >= value)
		begin
			t_expired = 1;
			counting = 0;
			reset = 0;
			add_one_last = add_one;
		end
		else
		begin
			reset = 1;
			counting = 1;
			t_expired = 0;
		end
	
	end
	else
	begin
		add_one_last = add_one;
		t_expired = 0;
		if(start_timer)
		begin
			counting = 1;
			reset = 1;
			counter = 0;
		end
		else
		begin
			counting =0;
			reset = 0;
			counter = 0;	
		end
	end	
end


always @(posedge clk_1Hz)
begin
		add_one = ~ add_one;
		
end


endmodule
