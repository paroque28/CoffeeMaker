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
    input wire comparador_de_precio_ok,
    input wire [1:0]  c_type,
    input wire t_expired,
    output reg [2:0]ing_type,
	 output reg star_timer,
	 output reg[7:3] led
    );

	
  //-------------Internal Constants--------------------------
  parameter SIZE = 6           ;
  parameter INICIO  = 3'b001,AGUA = 3'b010,CAFE = 3'b011, LECHE  = 3'b100,CHOCOLATE = 3'b101,AZUCAR = 3'b110 ;
  //-------------Internal Variables---------------------------
  reg   [SIZE-1:0]          state        ;// Seq part of the FSM
  wire  [SIZE-1:0]          next_state   ;// combo part of FSM
  //----------Code startes Here------------------------
  assign next_state = fsm_function(state,c_type,comparador_de_precio_ok );
  //----------Function for Combo Logic-----------------
  function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0]  state ;	
  input    c_type ;
  input comparador_de_precio_ok;
  
  case(state)
     INICIO : if (comparador_de_precio_ok == 1'b1)
             	  begin
                 fsm_function = AGUA;
                 end 
				  else 
					  begin
                 fsm_function = INICIO;
                 end
     AGUA : fsm_function = CAFE;
               
     CAFE :if (c_type == 2'b00)
             	  begin
                 fsm_function = AZUCAR;
                 end 
				  else 
					  begin
                 fsm_function = LECHE;
                 end
	  LECHE :if (c_type == 2'b11)
             	  begin
                 fsm_function = CHOCOLATE;
                 end 
				  else 
					  begin
                 fsm_function = AZUCAR;
                 end
     CHOCOLATE : fsm_function = AZUCAR;
            
	  AZUCAR : fsm_function = INICIO;
     
	  default : fsm_function = INICIO;
    endcase
 
  endfunction
//----------Seq Logic-----------------------------
  always @ (posedge clk)
  begin  
    if (t_expired == 1'b1) 
	 begin
   //  star_timer <= 1'b0;
    end 
	 else begin
    state <=  #1 next_state;
    end
  end
  
  //----------Output Logic-----------------------------
  always @ (posedge clk)
 
    case(state)
      INICIO : begin         
					led <=5'b00000;
               end
      AGUA : begin
             ing_type <= 3'b000;
	          star_timer <= 1'b1;
	          led <= 5'b10000;
				 star_timer <= 1'b0;
             end
      CAFE : begin
             ing_type <= 3'b001;
	          star_timer <= 1'b1;
	          led <= 5'b01000;
				 star_timer <= 1'b0;
             end
	   LECHE: begin
             ing_type <= 3'b010;
	          star_timer <= 1'b1;
	          led <=5'b00100;
				 star_timer <= 1'b0;
             end
      CHOCOLATE : begin
                  ing_type <=3'b011;
						star_timer <= 1'b1;
						led <= 5'b0010;
						star_timer <= 1'b0;
						end
      AZUCAR : begin
               ing_type <= 3'b100;
				   star_timer<= 1'b1;
					led<= 5'b0001;
					star_timer <= 1'b0;
					end
	  
     default : begin
               led <= 5'b0001;
               end
    endcase

 endmodule // End of Module arbiter