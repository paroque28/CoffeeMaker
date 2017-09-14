`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:41 09/14/2017 
// Design Name: 
// Module Name:    Comparador 
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
module Comparador(
	 input clk,
    input [3:0] dinero,
    input [2:0] c_type,
    output reg ok,
    output reg [3:0] cambio
    );
	 
reg [3:0] precio;
	 
always @ (posedge clk)

begin
	case(c_type)
		3'b001: precio = 3;
		3'b010: precio = 4;
		3'b011: precio = 5;
		3'b100: precio = 7;
		default: precio = 0;	
	endcase
	if (precio !=0)
	begin
		if(dinero >= precio)
		begin
			ok = 1;
			cambio  = dinero - precio;
		end
      else
		begin
			ok = 0;
			cambio = 0;
		end
	end
	else
	begin
		ok = 0;
		cambio = 0;
	end

end

endmodule
