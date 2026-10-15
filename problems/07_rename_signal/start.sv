// Data path for the FIFO write side.
// Note: data_valid qualifies data; rdata is not touched here.
module fifo_wr (
  input logic clk,
  input logic data_valid,
  input logic [7:0] data,
  output logic [7:0] mem_data
);
  logic [7:0] data_q;
  always_ff @(posedge clk)
    if (data_valid) data_q <= data;
  assign mem_data = data_q;
endmodule
