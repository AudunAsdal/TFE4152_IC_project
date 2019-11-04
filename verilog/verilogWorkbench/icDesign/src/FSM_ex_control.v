
module FSM_ex_control (Init, Clk ,Reset ,NRE_1 ,NRE_2 ,ADC ,Expose ,Erase, Start, Ovf5);

    input Init, Clk, Reset, Ovf5;
    output NRE_1, NRE_2, ADC, Expose, Erase, Start;

    reg [3:0] timing;

    reg Start, Erase, Expose, NRE_1, NRE_2, ADC;

    initial begin
        NRE_1   <= 0;
        NRE_2   <= 0;
        ADC     <= 0;
        Expose  <= 0;
        Erase   <= 0;
        Start   <= 0;
    end

    always @(posedge Init) begin    // start exposure and timer
        if (Start == 0)begin
            Start = 1;
            Erase <= 0;
            Expose <= 1;
        end
    end

    always @(posedge Ovf5 , posedge Reset)begin // exposure time over
        Expose <= 0;
        timing <= 0;
        if (Reset) begin
            Start <= 0;
            Erase <= 1;
        end
    end

    always @(posedge Clk)begin
        if (Start == 1 && Expose == 0)begin
            timing++;
        end
        if (Start && ~Expose) begin        // readout pixels
            case (timing)
                1: NRE_1    <= 1;
                2: ADC      <= 1;  
                3: ADC      <= 0;
                4: NRE_1    <= 0;
                5: NRE_2    <= 1;
                6: ADC      <= 1;
                7: ADC      <= 0;
                8: NRE_2    <= 0;
                9: begin
                    Erase   <= 0;
                    Start    = 0;
                end
            endcase
        end
    end

endmodule


