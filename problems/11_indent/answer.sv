module pulse_gen (
  input  logic clk,
  input  logic rst_n,
  input  logic trig,
  output logic pulse
);
  logic trig_q;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      trig_q <= 1'b0;
    end else begin
      trig_q <= trig;
    end
  end

  assign pulse = trig && !trig_q;

endmodule
