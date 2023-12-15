// TB_SEED is random seed
`ifndef TB_SEED
`define TB_SEED 0
`endif
module adder8_tb ();
  wire [8:0] result;
  reg [7:0] input_0;
  reg [7:0] input_1;
  reg clk;
  // clk2 is delay of clk, is used to verify result
  wire #5 clk2;
  assign clk2 = clk;
  initial begin
    $fsdbDumpfile("adder8.fsdb");
    $fsdbDumpvars();
    $display("TB_SEED is %d", `TB_SEED);
    clk = 0;
    input_0 = 8'd0;
    input_1 = 8'd0;
    #10000 $display("All test PASS!");
    $finish;
  end
  // system clk is 50MHz
  always begin
    #10 clk = ~clk;
  end
  //generate random input
  always @(negedge clk) begin
    input_0 = $random() % 256;
    input_1 = $random() % 256;
  end
  //get verified output
  always @(posedge clk2) begin
    if ((input_0 + input_1) != result) begin
      $display("Test failed for %x + %x = %x", input_0, input_1, result);
      $finish;
    end else begin
      $display("%x + %x = %x", input_0, input_1, result);
    end
  end
  //instantiate adder8
  adder8 dut (
      .clk(clk),
      .a_i(input_0),
      .b_i(input_1),
      .c_o(result)
  );
endmodule
