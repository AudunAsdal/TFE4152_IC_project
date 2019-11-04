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
		Init = 1;
        #1
        Init = 0;
        #120
		$finish;
	end
	
endmodule