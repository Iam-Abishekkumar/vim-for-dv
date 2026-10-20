module fifo_ctrl (input logic clk, rst_n, output logic busy);
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n) busy <= 1'b0;
    else        busy <= ~busy;
endmodule
