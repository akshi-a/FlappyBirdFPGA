module LFSR6(
    input clk,
    input reset,
    output reg [3:0] outLFSR
);

    reg [5:0] ps;
    wire feedback;

    assign feedback = ps[5] ^ ps[4];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ps <= 6'b100001;
        end else begin
            ps <= {feedback, ps[5:1]};
        end
    end

    assign outLFSR = ps[3:0];

endmodule
