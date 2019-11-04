
module Timer_counter(EX_time, Start, Clk, Reset, Ovf5);
    input EX_time, Start, Clk, Reset;
	output Ovf5;
    reg Ovf5;               // set high when count finished

    reg[4:0] EX_time;       // end time (input)
    reg[4:0] Current_time;  // counter 

     initial begin          // initialize
        Ovf5 <= 0;
        Current_time = 31;
    end

    always @(posedge Start)begin    // set counter to 0
        Current_time = 0;
    end

    always @(posedge Reset)begin    // set timer to standby and Ovf5 low
        Current_time <= 31;
        Ovf5 <= 0;
    end
    
    always @(posedge Clk)begin      // count up until end value, and set Ovf5 high
        if (Current_time < EX_time)begin
            Current_time++;
        end
        else if (Current_time == EX_time)begin
            Ovf5 = 1;
            Current_time = 31;
        end
        else if (Ovf5)begin
            Ovf5 = 0;               // set Ovf5 low again
        end
    end

endmodule