module basic_test_model();
    
    wire [0:3] pixels;

    initial begin
        

        $finish; // Done simulating
    end

endmodule


module FSM_ex_control(init, clk, RESET, NRE_1, NRE_2, ADC, Expose, Erase);

    input init, clk, RESET;
    output NRE_1, NRE_2, ADC, Expose, Erase;

    reg idle;
    

    always_ff @(posedge clk) begin
        
    end


endmodule