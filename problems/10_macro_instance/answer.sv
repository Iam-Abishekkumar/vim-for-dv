module tb;
  // ... signal declarations ...
  fifo u_fifo (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .wdata(wdata),
    .rd_en(rd_en),
    .rdata(rdata),
    .full(full),
    .empty(empty)
  );
endmodule
