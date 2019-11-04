`timescale 1ms/1ms
module CTRL_ex_time_tb;
	reg Exp_increase, Exp_decrease, Clk;
    reg[4:0] EX_time;
	CTRL_ex_time DUT(
        .Exp_increase(Exp_increase), 
        .Exp_decrease(Exp_decrease), 
        .Clk(Clk),
        .EX_time(EX_time)
    );
	
	always begin 
		#1 Clk = ~Clk;
	end
	
	initial begin  
		Clk = 0;
		Exp_decrease = 0;
        Exp_increase = 1;
        #2
        Exp_increase = 0;
        #2
        Exp_increase = 1;
        #2
        Exp_increase = 0;
        #2
        Exp_increase = 1;
        #2
        Exp_increase = 0;
        #2
        Exp_increase = 1;
        #2
        Exp_increase = 0;
        #2
        Exp_decrease = 1;
        #2
        Exp_decrease = 0;
        #2
        Exp_decrease = 1;
        #2
        Exp_decrease = 0;
        #2
        Exp_decrease = 1;
        #2
        Exp_decrease = 0;
		$finish;
	end
	
endmodule