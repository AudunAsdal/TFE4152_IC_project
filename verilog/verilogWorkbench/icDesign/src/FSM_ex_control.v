
module FSM_ex_control (Init, Clk ,Reset ,NRE_1 ,NRE_2 ,ADC ,Expose ,Erase, Start, Ovf5);

    input(Init, Clk, Reset, Ovf5);
    output(NRE_1, NRE_2, ADC, Expose, Erase, Start)

    reg [3:0] timing;

    reg idle;

    always @(posedge Init) begin    // start exposure and timer
        if (idle == 0)begin
            Start = 1;
            idle = 1;
            Erase = 0;
            Expose = 1;
        end
    end

    always @(posedge Ovf5)begin // exposure time over
        Expose = 0;
        timing = 0;
    end

    always @(posedge Clk)begin
        if (idle == 1 && Expose == 0)begin
            
        end
    end

endmodule
