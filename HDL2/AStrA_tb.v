// Adler Clarence E. Strebel - CSARCH1 S17
// Testbench for Odd Up-Down Binary Counter using T Flip-Flop

`timescale 1ns/1ns  

module AStrA_tb();
    reg t_Y;
    reg t_clk;
    reg t_rst;
    wire [3:0] t_Q;
    
    AStrA dut(t_Q, t_Y, t_clk, t_rst);
    
    initial 
    begin
        t_clk = 1'b0;
        forever #5 t_clk = ~t_clk;
    end
    
    initial 
    begin
        t_rst = 1'b0; 
        #10 t_rst = 1'b1;  
    end
    
    initial 
    begin
        t_Y = 1'b0;
        #100 t_Y = 1'b1;  
    end
    
    initial 
    begin
        $display("Program by Adler Clarence E. Strebel,  Behavioral Odd Up_Down BCD counter using T Flip Flop");
        $monitor("time=%3d, | clk:%b, | rst:%b, | Y:%b, | Q:%b (%0d)", $time, t_clk, t_rst, t_Y, t_Q, t_Q);
        $dumpfile("AStrA.vcd");
        $dumpvars();
    end
    initial #190 $finish;
endmodule