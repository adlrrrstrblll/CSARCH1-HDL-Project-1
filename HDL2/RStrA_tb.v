// Name: [Your Name]
// Section: [Your Section]
`timescale 1ns/1ns  

module FF_T_tb();
    reg t_Y;
    reg t_clk;
    reg t_rst;
    wire [3:0] t_Q;
    
    FF_T dut(t_Q, t_Y, t_clk, t_rst);
    
    initial begin
        t_clk = 1'b0;
        forever #5 t_clk = ~t_clk;
    end
    
    initial begin
        t_rst = 1'b0; 
        #10 t_rst = 1'b1;  
    end
    
    initial begin
        t_Y = 1'b0;
        #100 t_Y = 1'b1;  
    end
    
    initial begin
        $display("Program by [Your Name], T FF with Odd Up-Down Counter");
        $monitor("time=%d, clk:%b, rst:%b, Y:%b, Q:%b (%d)", $time, t_clk, t_rst, t_Y, t_Q, t_Q);
        $dumpfile("FF_T.vcd");
        $dumpvars();
    end
    initial #190 $finish;
endmodule