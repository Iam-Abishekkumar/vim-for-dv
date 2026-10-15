module counter (
  input wire clk,
  input wire rst_n,
  input wire en,
  output reg [3:0] count,
  output wire wrap
);
  reg [3:0] next_count;
  wire at_max;

  assign at_max = (count == 4'hF);
  assign next_count = at_max ? 4'h0 : count + 4'h1;

  // wire up the outputs
  assign wrap = en && at_max;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) count <= 4'h0;
    else if (en) count <= next_count;
endmodule
