`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:04 09/04/2017 
// Design Name: 
// Module Name:    clock_divisor 
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
module clock_divisor(
    input clk_100MHz,
    output reg clk_1Hz 
    );
	 

 reg[28:0] contador = 0; 

 always @(posedge clk_100MHz)
  begin
   contador = contador + 1; 
   if(contador == 100000000)
    begin
      contador = 0;
      clk_1Hz = ~clk_1Hz; 
    end
	end
endmodule
