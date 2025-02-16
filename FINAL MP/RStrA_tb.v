// Adler Clarence E. Strebel - S17

`timescale 1ns / 1ps

module HDL_1_tb();
    reg [3:0] t_input;
    wire t_Output;
    integer i;

    HDL_1_dataflow dut(t_Output, t_input[3], t_input[2], t_input[1], t_input[0]);

    initial begin
        t_input = 4'b0000;
        for (i = 1; i <= 16; i = i + 1) 
        begin
            #10 t_input = i; 
        end
    end

    initial begin
        $display("Name & Section: Adler Clarence E. Strebel | CSARCH1 S17");
        $display("Boolean Function: F(W,X,Y,Z)=W'X'Y'Z'+W'X'Y'Z+WX'Y'Z'+WX'Y'Z+WX'YZ'+WX'YZ+WXY'Z'+WXYZ'+WXYZ");
        $display("Sum of Minterm: F(W,X,Y,Z) = m(0,1,8,9,10,11,12,14,15)");
        $display("Verilog Model: Dataflow");
    end

    initial begin
        $monitor("time = %0d \t A= %b, B= %b, C= %b, D= %b \t F (Output)= %b", 
                 $time, t_input[3], t_input[2], t_input[1], t_input[0], t_Output);
        $dumpfile("RStrA");  
        $dumpvars(0, HDL_1_tb); 
    end
endmodule
