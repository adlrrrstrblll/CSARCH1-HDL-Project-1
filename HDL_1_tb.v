`timescale 1ns / 1ps

module HDL_1_tb();
    reg [3:0] t_input;
    wire t_E;
    integer i;

    HDL_1 dut(.A(t_input[3]),.B(t_input[2]),
                .C(t_input[1]), .D(t_input[0]),.F(t_Output));

    initial begin
        t_input = 4'b0000;
        for (i = 0; i < 16; i = i + 1) 
        begin
            #10 t_input = i; 
        end
    end

    initial begin
        $monitor("time = %0d, \t A= %b, B= %b, C= %b, D= %b, \t E (Output)= %b", 
                 $time, t_input[3], t_input[2], t_input[1], t_input[0], t_Output);
        $dumpfile("HDL_1.vcd");  
        $dumpvars(0, HDL_1_tb);  
    end
endmodule
