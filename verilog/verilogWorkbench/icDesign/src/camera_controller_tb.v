`timescale 1ms/1ms
module camera_controller_tb;
    // Input to contoller
    reg Init, Exp_increase, Exp_decrease, Clk, Reset;
    // output to controller
    reg NRE_1, NRE_2, ADC, Expose, Erase;

	camera_controller DUT_Controller(
        .Init(Init), 
        .Exp_increase(Exp_increase), 
        .Exp_decrease(Exp_decrease), 
        .Clk(Clk), 
        .Reset(Reset), 
        .NRE_1(NRE_1), 
        .NRE_2(NRE_2), 
        .ADC(ADC), 
        .Expose(Expose), 
        .Erase(Erase)
    );
	
	always begin 
		#1 Clk = ~Clk;
	end

    always @(posedge Erase) begin
		#10
        Exp_decrease = 1;
        #1
        Exp_decrease = 0;
		#1
		Init = 1;
		#1
		Init = 0;
    end
				
	initial begin
        Clk = 0;
        Reset = 0;
        Exp_decrease = 0;
        Exp_increase = 0;
        Init = 0;
        #1
        Init = 1;
        #1
        Init = 0;
		#28
		Reset = 1;
		#1
		Reset = 0;
		#200
		$finish;
	end

endmodule