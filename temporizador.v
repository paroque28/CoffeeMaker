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
    output reg  texpired, 
	 input   start_timer
    );
wire divisor;
clock_divisor clk_1Hz(
	.clk_100MHz(clk_100MHz),
	.clk_1Hz(divisor)
 );
 reg[1:0] contador = 0; 
 
always @(posedge divisor)
begin
  if(start_timer)
  begin
		contador = contador + 1; 
		if(contador == value)
		begin
			contador = 0;
			texpired<=1;
		end
	end
	else
	begin
	texpired <=0;
	end
end
endmodule
