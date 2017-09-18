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
    input clk,
    input ok,
    input t_expired,
	 input reset,
	 input [2:0] c_type,
    output reg [2:0]ing_type,
	 output reg start_timer,
	 output reg[7:3] ingredientes,
	 output reg expired,
	 output reg cobrar,
	 output reg [2:0] c_type_saved
    );

	
  //-------------Internal Constants--------------------------
  parameter INICIO  = 4'b0000,AGUA = 4'b0010,CAFE = 4'b0100, MILK  = 4'b0110,CHOCO = 4'b1000,AZUC = 4'b1010, COBRAR_WAIT = 4'b1111;
  parameter LAGUA = 4'b0001,LCAFE = 4'b0011, LMILK  = 4'b0101,LCHOCO = 4'b0111,LAZUC = 4'b1001, COBRAR = 4'b1011;
  //-------------Internal Variables---------------------------
  reg   [3:0] state = 0;
  reg expired_last = 0;
  //----------Code startes Here-----------------------
  //---------------------Initial-----------------------
  initial begin
	ingredientes = 5'b00000;
	start_timer = 0;
	ing_type = 0;
	expired = 0;
	cobrar = 0;
	c_type_saved = 0;
  end
//----------Seq Logic-----------------------------
always @ (posedge clk or posedge reset)
begin  
if(reset == 1'b1)
begin
	state =  INICIO;
end
else begin	
	case(state)
		  INICIO : if (ok == 1'b1)
					  begin
						  state = LAGUA;
						  c_type_saved = c_type;
					  end
					  else 
						  state = INICIO;
						  
		  LAGUA : state = AGUA;
		  AGUA : if (t_expired) begin
						  state = LCAFE; end
					  else 
						  state = AGUA;
						
		  LCAFE: state = CAFE;
		  CAFE :if (t_expired)begin

						  state = LMILK; end
					  else 
						  state = CAFE;
						  
		  LMILK: state = MILK;			  
		  MILK :if (t_expired) begin
						  state = LCHOCO; end
					  else 
						  state = MILK;
						  
		  LCHOCO : state = CHOCO;
		  CHOCO : if (t_expired) begin
						  state = LAZUC; end
					  else 
						  state = CHOCO;
				
		  LAZUC: state = AZUC;
		  AZUC : if (t_expired) begin
						  
						  state = COBRAR; end
					  else 
						  state = AZUC;
		  COBRAR: begin
					c_type_saved = 0;
					state = COBRAR_WAIT;
					end
		  COBRAR_WAIT: begin
					c_type_saved = 0;
					state = INICIO;
					end
		  
		  default : state = INICIO;
		 endcase
 end
end
  
  //----------Output Logic-----------------------------
always @(state) 
     begin
	  case(state)
      INICIO : begin
			ing_type =  3'b000;
			start_timer =  1'b0;
			ingredientes =  5'b00000;
			cobrar = 0;
               end
		LAGUA : begin
			 ing_type =  3'b001;
			 start_timer =  1'b0;
			 ingredientes =  5'b10000;
			 cobrar = 0;
             end
      AGUA : begin
			 ing_type =  3'b001;
			 start_timer =  1'b1;
			 ingredientes =  5'b10000;
			 cobrar = 0;
             end
		LCAFE : begin
             ing_type =  3'b010;
	          start_timer =  1'b0;
	          ingredientes =  5'b01000;
		       cobrar = 0;
             end
      CAFE : begin
             ing_type =  3'b010;
	          start_timer =  1'b1;
	          ingredientes =  5'b01000;
			    cobrar = 0;
             end
		LMILK: begin
             ing_type =  3'b011;
	          start_timer =  1'b0;
	          ingredientes =  5'b00100;
			    cobrar = 0;
             end		 
	   MILK: begin
             ing_type =  3'b011;
	          start_timer =  1'b1;
	          ingredientes =  5'b00100;
			    cobrar = 0;
             end
		LCHOCO : begin
				ing_type =  3'b100;
				start_timer =  1'b0;
				ingredientes =  5'b00010;
			   cobrar = 0;
				end
      CHOCO : begin
				ing_type =  3'b100;
				start_timer =  1'b1;
				ingredientes =  5'b00010;
			   cobrar = 0;
				end
		LAZUC : begin
			ing_type =  3'b101;
			start_timer=  1'b0;
			ingredientes=  5'b00001;
			cobrar = 0;
			end
      AZUC : begin
			ing_type =  3'b101;
			start_timer=  1'b1;
			ingredientes=  5'b00001;
			cobrar = 0;
			end
		COBRAR : begin
			ing_type =  3'b000;
			start_timer=  1'b0;
			ingredientes=  5'b00000;
			cobrar = 1;
			end
		COBRAR_WAIT : begin
			ing_type =  3'b000;
			start_timer=  1'b0;
			ingredientes=  5'b00000;
			cobrar = 0;
			end
	  
	  
     default : begin
					ing_type =  3'b000;
					start_timer=  1'b0;
               ingredientes =  5'b00000;
					cobrar = 0;
               end
    endcase
   end
 
 always@(posedge t_expired)
 begin
		expired = ~expired;
		
 end
 
 endmodule // End of Module arbiter