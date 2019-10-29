module FSM_ex_control(init, clk, RESET, NRE_1, NRE_2, ADC, Expose, Erase);

    input init, clk, RESET;
    output NRE_1, NRE_2, ADC, Expose, Erase;

    reg idle;


    always @(posedge clk) begin

    end


endmodule
