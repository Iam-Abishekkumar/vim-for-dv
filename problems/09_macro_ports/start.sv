module fifo (
in clk
in rst_n
in wr_en
in [7:0] wdata
in rd_en
out [7:0] rdata
out full
out empty
);
endmodule
