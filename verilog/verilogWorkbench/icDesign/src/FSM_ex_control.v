//-----------------------------------------------------------------------------
//
// Title       : FSM_ex_control
// Design      : icDesign
// Author      : olesaa
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\Ole Sivert\OneDrive - NTNU\IC\TFE4152_IC_project\verilog\verilogWorkbench\icDesign\src\FSM_ex_control.v
// Generated   : Tue Oct 22 10:53:03 2019
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {FSM_ex_control}}
module FSM_ex_control ( init ,clk ,RESET ,NRE_1 ,NRE_2 ,ADC ,Expose ,Erase );

output NRE_1 ;
wire NRE_1 ;
output NRE_2 ;
wire NRE_2 ;
output ADC ;
wire ADC ;
output Expose ;
wire Expose ;
output Erase ;
wire Erase ;

input init ;
wire init ;
input clk ;
wire clk ;
input RESET ;
wire RESET ;

//}} End of automatically maintained section

// -- Enter your statements here -- //	   

reg idle;

always @(posedge clk)
 assign NRE_1 <= ~clk;

endmodule
