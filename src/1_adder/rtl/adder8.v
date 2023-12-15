module adder8 (
    input clk,
    input [7:0] a_i,
    input [7:0] b_i,
    output reg [8:0] c_o
);
  always @(posedge clk) begin
    c_o <= a_i + b_i;
  end
endmodule
