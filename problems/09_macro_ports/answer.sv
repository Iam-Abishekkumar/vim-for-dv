module fifo (
  input logic clk,
  input logic rst_n,
  input logic wr_en,
  input logic [7:0] wdata,
  input logic rd_en,
  output logic [7:0] rdata,
  output logic full,
  output logic empty
);
endmodule
