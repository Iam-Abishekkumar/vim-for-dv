module tb_fifo;
  logic clk = 0;
  logic rst_n;
  always #5 clk = ~clk;

  initial begin // TODO: remove this old comment
    $display("DEBUG: reset start");
    rst_n = 0;
    #20 rst_n = 1;
    $display("DEBUG: reset done");
    wait wait (dut.empty);
    $display("DEBUG: fifo empty");
    // old stimulus, replaced by the sequence
    // repeat (10) begin
    //   @(posedge clk) wr_en = 1;
    //   wdata = $random;
    // end
    $display("DEBUG: test end");
    $finish;
  end
endmodule
// scratch notes:
// try DEPTH = 32 next
// ask about almost_full
