module decoder (input logic clk, rst_n, input logic [1:0] sel, output logic [3:0] onehot);
  // rst_n is active low, so the reset edge is the falling edge
  always_ff @(posedge clk or posedge rst_n)
    if (!rst_n) onehot <= '0;
    else        onehot <= 4'b0001 << sel;
endmodule
