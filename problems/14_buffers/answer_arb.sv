module arbiter (input logic clk, rst_n, req0, req1, output logic gnt0, gnt1);
  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n) gnt0 <= 1'b0;
    else        gnt0 <= req0;

  always_ff @(posedge clk or negedge rst_n)
    if (!rst_n) gnt1 <= 1'b0;
    else        gnt1 <= req1 && !req0;
endmodule
