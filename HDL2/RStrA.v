module FF_T(Q, Y, clk, rst);
    output reg [3:0] Q;
    input Y, clk, rst;
    
    always @(posedge clk or negedge rst) 
    begin
        if (rst == 0) Q <= 4'b0001; 
        else 
            begin
                if (Y == 1) 
                    begin
                        if (Q == 4'b1111) Q <= 4'b0001;  
                        else Q <= Q + 4'b0010; 
                    end 
                else 
                    begin
                        if (Q == 4'b0001) Q <= 4'b1111; 
                        else Q <= Q - 4'b0010;
                    end
            end
    end
endmodule

