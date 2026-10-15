module tb_fifo;
  logic clk = 0;
  always #5 clk = ~clk;

  // TODO: paste the 7 signal declarations from fifo_if.sv here

  fifo dut (.*);
endmodule
