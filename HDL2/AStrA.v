// Adler Clarence E. Strebel - CSARCH1 S17
// Behavioral Model Odd Up-Down Binary Counter using T Flip-Flop

module AStrA(Q, Y, clk, rst);
    output reg [3:0] Q;
    input Y, clk, rst;
    
    parameter S0 = 4'b0001;  // 1
    parameter S1 = 4'b0011;  // 3
    parameter S2 = 4'b0101;  // 5
    parameter S3 = 4'b0111;  // 7
    parameter S4 = 4'b1001;  // 9
    parameter S5 = 4'b1011;  // 11
    parameter S6 = 4'b1101;  // 13
    parameter S7 = 4'b1111;  // 15
    
    reg [3:0] next_state;
    
    always @(posedge clk, negedge rst) 
    begin
        if (rst == 0) 
            Q <= S0;  //0001 | 1
        else 
            Q <= next_state;
    end
    
    always @(Q, Y) 
    begin
        case(Q)
            S0: if(Y == 1) next_state = S1; else next_state = S7;  // 1->3 or 1->15
            S1: if(Y == 1) next_state = S2; else next_state = S0;  // 3->5 or 3->1
            S2: if(Y == 1) next_state = S3; else next_state = S1;  // 5->7 or 5->3
            S3: if(Y == 1) next_state = S4; else next_state = S2;  // 7->9 or 7->5
            S4: if(Y == 1) next_state = S5; else next_state = S3;  // 9->11 or 9->7
            S5: if(Y == 1) next_state = S6; else next_state = S4;  // 11->13 or 11->9
            S6: if(Y == 1) next_state = S7; else next_state = S5;  // 13->15 or 13->11
            S7: if(Y == 1) next_state = S0; else next_state = S6;  // 15->1 or 15->13
        endcase
    end
endmodule