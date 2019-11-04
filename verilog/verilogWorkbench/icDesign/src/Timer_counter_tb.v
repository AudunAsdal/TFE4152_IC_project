`timescale 1ms/1ms
module Timer_counter_tb;
    reg [4:0] EX_time; 
    reg Start, Clk, Reset;
	reg Ovf5;
	Timer_counter DUT(
        .EX_time(EX_time), 
        .Start(Start), 
        .Clk(Clk), 
        .Ovf5(Ovf5), 
        .Reset(Reset)
    );
	
	always begin 
		#1 Clk = ~Clk;
	end

    always @(posedge Ovf5) begin
        #30
        Start = 1;
        #1
        Start = 0;
    end
	
	initial begin
        Clk = 0;
        Reset = 0;
        EX_time = 10;
        Start = 0;
        #1
        Start = 1;
        #1
        Start = 0;
        #120
		$finish;
	end

endmodule