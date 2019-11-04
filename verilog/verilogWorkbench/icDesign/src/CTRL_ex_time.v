module CTRL_ex_time(Exp_increase, Exp_decrease, Clk, EX_time);

    input Exp_increase, Exp_decrease, Clk;
    output EX_time;

    reg[4:0] EX_time;       // output end time register

    initial begin
        EX_time = 10;       // initialize to 10 (why not...)
    end
    
    always @ (posedge Exp_increase)begin    // increase EX_time
        if (EX_time < 30) begin
            EX_time++;        
        end
    end

    always @ (posedge Exp_decrease)begin    // decrease EX_time
        if (EX_time > 2) begin
            EX_time--;
        end
    end

endmodule