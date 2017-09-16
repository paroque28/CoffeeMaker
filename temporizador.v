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
	 output reg on	 
    );
wire divisor;
reg[1:0] counter = 0;
reg counting = 0;
reg add_one = 0;
reg add_one_last = 0;
reg reset = 0;
reg reset_last = 0;

clock_divisor clk_1Hz(
	.clk_100MHz(clk_100MHz),
	.clk_1Hz(divisor),
	.on(on)
 );


 
always @(posedge clk_100MHz)
begin

	if(start_timer)
	begin
		if(counting)
		begin
			
			if(add_one_last != add_one)
			begin
				counter = counter + 1;
				add_one_last = add_one ;
			end
			else
			begin
				counter = counter;
				add_one_last = add_one;
			end
			
			if(counter >= value)
			begin
				t_expired = 1;
				counting = 0;
				on = 0;
			end
			
			else
			begin
				//t_expired = 0;
			end
		end
		else
		begin
			counting = 1;
			on = 1;
			counter = 0;
		end
	end
	else
	begin
		
	end
	
	
	
	if(reset_last!=reset)
	begin
		t_expired = 0;
		on = 0;
		counting = 0;
		counter = 0;
		reset_last = reset;
	end
	else
	begin
		t_expired = t_expired;
		reset_last = reset;
	end
	
end


always @(posedge divisor)
begin
	if(start_timer)
	begin
		add_one = ~ add_one;
	end

end

always @(negedge start_timer)
begin
	reset = ~reset;
end

endmodule
