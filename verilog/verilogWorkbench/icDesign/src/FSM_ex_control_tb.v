`timescale 1ms/1ms
module FSM_ex_control_tb;
	reg Init, Clk, Reset, Ovf5;
    reg NRE_1, NRE_2, ADC, Expose, Erase, Start;
	FSM_ex_control DUT(
        .Init(Init), 
        .Reset(Reset), 
        .Clk(Clk), 
        .Ovf5(Ovf5), 
        .NRE_1(NRE_1),
        .NRE_2(NRE_2),
        .ADC(ADC),
        .Expose(Expose),
        .Erase(Erase),
        .Start(Start)
    );
	
	always begin 
		#1 Clk = ~Clk;
	end

    always @(posedge Start) begin
        #30
        Ovf5 = 1;
        #1
        Ovf5 = 0;
    end
	
	initial begin
		Clk = 0;
		Reset = 0;
		Ovf5 = 0;
		Init = 0;
        #1
        Init = 1;
		#1
		Init = 0;
        #80
		Init = 1;
		#1
		Init = 0;
		#35
		Init = 1;
		#1
		Init = 0;
		#2
		Reset = 1;
		#1
		Reset = 0;
		#30
		Init = 1;
		#1
		Init = 0;
		#50
		$finish;
	end
	
endmodule