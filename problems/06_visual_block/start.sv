module fifo_sva (input logic clk, rst_n, full, empty, wr_en, rd_en);

  // Checks that are ready
  assert property (@(posedge clk) disable iff (!rst_n) !(full && empty))
  assert property (@(posedge clk) disable iff (!rst_n) full |-> !wr_en)
  assert property (@(posedge clk) disable iff (!rst_n) empty |-> !rd_en)

  // Checks still being debugged - turn them OFF
  assert property (@(posedge clk) wr_en |=> !empty);
  assert property (@(posedge clk) rd_en |=> !full);

  // Fixed covers - turn them back ON
  // cover property (@(posedge clk) full);
  // cover property (@(posedge clk) empty);
  // cover property (@(posedge clk) wr_en && rd_en);

endmodule
