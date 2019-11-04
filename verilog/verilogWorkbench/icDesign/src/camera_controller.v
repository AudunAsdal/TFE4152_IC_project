module camera_controller(Init, Exp_increase, Exp_decrease, Clk, Reset, NRE_1, NRE_2, ADC, Expose, Erase);

    // Input to contoller
    input Init, Exp_increase, Exp_decrease, Clk, Reset;
    // output to controller
    output NRE_1, NRE_2, ADC, Expose, Erase;
    // Internal registers
    reg [4:0] EX_time;
    wire Start, Ovf5;

    FSM_ex_control FSM(     // the brains of the module, controls outputs
        .Init(Init), 
        .Reset(Reset), 
        .Clk(Clk), 
        .Ovf5(Ovf5), 
        .NRE_1(NRE_1),
        .NRE_2(NRE_2),
        .ADC(ADC),
        .Expose(Expose),
        .Erase(Erase),
        .Start(Start)
    );

    CTRL_ex_time CTRL(      // sets exposure time for the photo diodes
        .Exp_increase(Exp_increase), 
        .Exp_decrease(Exp_decrease), 
        .Clk(Clk),
        .EX_time(EX_time)
    );

    Timer_counter Timer(    // controls the exposure time based on CTRL_ex_time
        .EX_time(EX_time), 
        .Start(Start), 
        .Clk(Clk), 
        .Ovf5(Ovf5), 
        .Reset(Reset)
    );

endmodule