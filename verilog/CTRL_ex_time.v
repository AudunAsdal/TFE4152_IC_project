module CTRL_ex_time(Exp_increase, Exp_decrease, Clk, Reset, EX_time);

    input Exp_increase, Exp_decrease, Clk, Reset;
    output Clk, Reset, EX_time;

    reg[0:5] EX_time;

    initial begin
        EX_time = 10;
    end
    always @ posedge(Exp_increase)begin
        if EX_time < 30 begin
            EX_time++;        
        end
    end
    always @ posedge(Exp_decrease)begin
        if EX_time > 2 begin
            Ex_time--;
        end
    end

endmodule