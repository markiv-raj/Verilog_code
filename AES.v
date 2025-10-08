module aes_core (
    input clk,
    input rst,
    input [127:0] key,
    input [127:0] data_in,
    output reg [127:0] data_out,
    output reg done
);

    reg [127:0] state;
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            state <= data_in;
            done <= 0;
            i <= 0;
        end else if (i < 10) begin
            state <= state ^ key; // Simplified - actual AES requires S-box, ShiftRows, MixColumns, etc.
            i <= i + 1;
        end else begin
            data_out <= state;
            done <= 1;
        end
    end
endmodule
