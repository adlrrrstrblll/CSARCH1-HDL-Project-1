// Francesca Anne Denise C. Catolico - CSARCH1 XX22
// Behavioral Odd Up-Down Counter using JK Flip-Flops

module OddUpDownCounter(
    input clk,
    input reset,
    input Y,
    output reg [3:0] out
);

// State transitions
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        out <= 4'b0001; // Reset condition
    end
    else begin
        if (Y) begin
            // Upstream transition (0001 → 0011 → ... → 1111 → 0001)
            case(out)
                4'b0001: out <= 4'b0011;
                4'b0011: out <= 4'b0101;
                4'b0101: out <= 4'b0111;
                4'b0111: out <= 4'b1001;
                4'b1001: out <= 4'b1011;
                4'b1011: out <= 4'b1101;
                4'b1101: out <= 4'b1111;
                4'b1111: out <= 4'b0001;
                default: out <= 4'b0001;
            endcase
        end
        else begin
            // Downstream transition (1111 → 1101 → ... → 0001 → 1111)
            case(out)
                4'b1111: out <= 4'b1101;
                4'b1101: out <= 4'b1011;
                4'b1011: out <= 4'b1001;
                4'b1001: out <= 4'b0111;
                4'b0111: out <= 4'b0101;
                4'b0101: out <= 4'b0011;
                4'b0011: out <= 4'b0001;
                4'b0001: out <= 4'b1111;
                default: out <= 4'b1111;
            endcase
        end
    end
end

endmodule