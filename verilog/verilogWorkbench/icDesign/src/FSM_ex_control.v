
module FSM_ex_control (Init, Clk ,Reset ,NRE_1 ,NRE_2 ,ADC ,Expose ,Erase, Start, Ovf5);

    input(Init, Clk, Reset, Ovf5);
    output(NRE_1, NRE_2, ADC, Expose, Erase, Start)



    reg idle;

    always @(posedge Init) begin
        if (idle == 0)begin
            Start = 1;
            idle = 1;
            Erase = 0;
            Expose = 1;
        end
    end

    always @(posedge Ovf5)begin
        

    end

endmodule
