`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:12 09/04/2017 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(
    input clk,
    input signal,  // "signal" is the glitchy, asynchronous to clk, active low push-button signal

    // from which we make three outputs, all synchronous to the clock
    output reg signal_state,  // 1 as long as the push-button is active (down)
    output signal_down,  // 1 for one clock cycle when the push-button goes down (i.e. just pushed)
    output signal_up   // 1 for one clock cycle when the push-button goes up (i.e. just released)
);

// First use two flip-flops to synchronize the signal signal the "clk" clock domain
reg signal_sync_0;  always @(posedge clk) signal_sync_0 <= signal;
reg signal_sync_1;  always @(posedge clk) signal_sync_1 <= signal_sync_0;

// Next declare a 18-bits counter
reg [18:0] signal_cnt;

// When the push-button is pushed or released, we increment the counter
// The counter has to be maxed out before we decide that the push-button state has changed

wire signal_idle = (signal_state==signal_sync_1);
wire signal_cnt_max = &signal_cnt;	// true when all bits of signal_cnt are 1's

always @(posedge clk)
if(signal_idle)
    signal_cnt <= 0;  // nothing's going on
else
begin
    signal_cnt <= signal_cnt + 16'd1;  // something's going on, increment the counter
    if(signal_cnt_max) signal_state <= ~signal_state;  // if the counter is maxed out, signal changed!
end

assign signal_down = ~signal_idle & signal_cnt_max & ~signal_state;
assign signal_up   = ~signal_idle & signal_cnt_max &  signal_state;
endmodule