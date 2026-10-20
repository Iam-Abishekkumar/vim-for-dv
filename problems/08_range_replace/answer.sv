// Two versions of the same synchronizer.
// Only the NEW one moves to SystemVerilog types.

module sync_old (
  input wire clk,
  input wire d,
  output wire q
);
  reg meta, sync;
  always @(posedge clk) begin
    meta <= d;
    sync <= meta;
  end
  assign q = sync;
endmodule

module sync_new (
  input logic clk,
  input logic d,
  output logic q
);
  logic meta, sync;
  always_ff @(posedge clk) begin
    meta <= d;
    sync <= meta;
  end
  assign q = sync;
endmodule
