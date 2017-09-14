`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:13 09/11/2017 
// Design Name: 
// Module Name:    seven_segment 
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
module seven_segment(
	 input clk,
    input [3:0] in,
    output [6:0] seg,
    output [3:0] an
    );

reg [16:0] contador = 0; 
reg [1:0] an_select = 0;
reg [3:0] x;
reg [3:0] unidades;
reg [1:0] decenas;

binto7seg toseg (
		.clk(clk),
		.binary(x),
		.seg(seg)
);

deco deco (
		.clk(clk),
		.in(an_select),
		.out(an)
);
	 

always @(posedge clk)
begin
contador <= contador + 1; 
if(contador == 131071)
 begin
	if (in > 9)
	begin
		decenas <= 1;
		unidades <= in - 10;
	end
	else
	begin
		decenas <= 0;
		unidades <= in;
	end
	contador <= 0;
	an_select <= an_select + 1;
	case (an_select)
			2'b01 : x <= unidades;
			2'b10 : x <= decenas;
			2'b11 : x <= 0;
			2'b00 : x <= 0;
			default : x <= 0;
	endcase
 end
end

endmodule


