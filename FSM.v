`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:57 09/14/2017 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
    input wire clk,
    input wire ok,
    input wire [1:0]  c_type,
    input wire t_expired,
	 input wire reset,
    output reg [2:0]ing_type,
	 output reg start_timer,
	 output reg[7:3] ingredientes
    );

	
  //-------------Internal Constants--------------------------
  parameter SIZE = 4;
  parameter INICIO  = 4'b0000,AGUA = 4'b0010,CAFE = 4'b0100, MILK  = 4'b0111,CHOCO = 4'b1001,AZUC = 4'b1011 ;
  parameter LAGUA = 4'b0001,LCAFE = 4'b0011, LMILK  = 4'b0101,LCHOCO = 4'b1000,LAZUC = 4'b1010 ;
  //-------------Internal Variables---------------------------
  reg   [SIZE-1:0]          state        ;// Seq part of the FSM
  wire  [SIZE-1:0]          next_state   ;// combo part of FSM
  //----------Code startes Here------------------------
  assign next_state = fsm_function(state,c_type,ok,reset);
  //----------Function for Combo Logic-----------------
  function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0]  state ;	
  input    c_type ;
  input ok;
  input reset;
  
	  case(state)
		  INICIO : if (ok == 1'b1)
						  begin
						  fsm_function = LAGUA;
						  end 
					  else 
						  begin
						  fsm_function = INICIO;
						  end
						  
		  LAGUA : fsm_function = AGUA;
		  AGUA : fsm_function = LCAFE;
						
		  LCAFE: fsm_function = CAFE;
		  CAFE :if (c_type == 2'b00)
						  begin
						  fsm_function = LAZUC;
						  end 
					  else 
						  begin
						  fsm_function = LMILK;
						  end
						  
		  LMILK: fsm_function = MILK;			  
		  MILK :if (c_type == 2'b11)
						  begin
						  fsm_function = LCHOCO;
						  end 
					  else 
						  begin
						  fsm_function = LAZUC;
						  end
						  
		  LCHOCO : fsm_function = CHOCO;
		  CHOCO : fsm_function = LAZUC;
				
		  LAZUC: fsm_function = AZUC;
		  AZUC : fsm_function = INICIO;
		  
		  default : fsm_function = INICIO;
		 endcase
  endfunction
//----------Seq Logic-----------------------------
always @ (posedge clk)
begin  
if(reset == 1'b1)
begin
	state <=  INICIO;
end
else begin	
	state <=   next_state;
 end
end
  
  //----------Output Logic-----------------------------
  always @ (posedge clk)
	if(reset == 1'b1)
	begin
		 ing_type <=  4'b0000;
		 start_timer <=  1'b0;
		 ingredientes <=  5'b00000;
		end
	else
	begin
    case(state)
      INICIO : begin         
					ingredientes <=  5'b00000;
               end
		LAGUA : begin
             ing_type <=  3'b000;
	          start_timer <=  1'b0;
	          ingredientes <=  5'b10000;
             end
      AGUA : begin
             ing_type <=  3'b000;
	          start_timer <=  1'b1;
	          ingredientes <=  5'b10000;
             end
		LCAFE : begin
             ing_type <=  3'b001;
	          start_timer <=  1'b0;
	          ingredientes <=  5'b01000;
             end
      CAFE : begin
             ing_type <=  3'b001;
	          start_timer <=  1'b1;
	          ingredientes <=  5'b01000;
             end
		LMILK: begin
             ing_type <=  3'b010;
	          start_timer <=  1'b0;
	          ingredientes <=  5'b00100;
             end		 
	   MILK: begin
             ing_type <=  3'b010;
	          start_timer <=  1'b1;
	          ingredientes <=  5'b00100;
             end
		LCHOCO : begin
				ing_type <=  3'b011;
				start_timer <=  1'b0;
				ingredientes <=  5'b00010;
				end
      CHOCO : begin
				ing_type <=  3'b011;
				start_timer <=  1'b1;
				ingredientes <=  5'b00010;
				end
		LAZUC : begin
			ing_type <=  3'b100;
			start_timer<=  1'b0;
			ingredientes<=  5'b00001;
			end
      AZUC : begin
			ing_type <=  3'b100;
			start_timer<=  1'b1;
			ingredientes<=  5'b00001;
			end
	  
     default : begin
					ing_type <=  3'b000;
					start_timer<=  1'b0;
               ingredientes <=  5'b00000;
               end
    endcase
   end
 endmodule // End of Module arbiter