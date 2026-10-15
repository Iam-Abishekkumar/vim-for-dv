module tb_fifo;
  logic clk = 0;
  always #5 clk = ~clk;

  logic       rst_n;
  logic       wr_en;
  logic [7:0] wdata;
  logic       rd_en;
  logic [7:0] rdata;
  logic       full;
  logic       empty;

  fifo dut (.*);
endmodule
