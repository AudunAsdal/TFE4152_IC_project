
module Timer_counter(Initial, Start, Clk, Reset, Ovf5);
    input(Initial, Start, Clk, Reset);
    output(Ovf5);

    reg[4:0] Current_time;

    always @(posedge Start)begin 
        Current_time = 0;
    end

    always @(posedge Reset)begin
        Current_time <= 31;
        Ovf5 <= 0;
    end
    
    always @(posedge Clk)begin
        if (Current_time < Initial)begin
            Current_time++;
        end
        else if (Current_time == Initial)begin
            Ovf5 = 1;
            Current_time = 31;
        end
        else begin
            Ovf5 = 0;
        end
    end

endmodule