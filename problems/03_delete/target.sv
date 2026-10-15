module tb_fifo;
  logic clk = 0;
  logic rst_n;
  always #5 clk = ~clk;

  initial begin
    rst_n = 0;
    #20 rst_n = 1;
    wait (dut.empty);
    $finish;
  end
endmodule
