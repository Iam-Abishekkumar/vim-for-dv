// fifo.sv - synchronous FIFO - reviewed
module fifo #(
  parameter int DEPTH = 16,
  parameter int WIDTH = 8
) (
  input  logic             clk,
  input  logic             rst_n,
  input  logic             wr_en,
  input  logic [WIDTH-1:0] wdata,
  input  logic             rd_en,
  output logic [WIDTH-1:0] rdata,
  output logic             full, // set when count == DEPTH
  output logic             empty
); // port list

  logic [WIDTH-1:0] mem [DEPTH];
  logic [$clog2(DEPTH):0] count;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) count <= '0;
    else if (wr_en && !full) count <= count + 1;
    else if (rd_en && !empty) count <= count - 1;
  end

  assign full  = (count == DEPTH);
  assign empty = (count == 0);

endmodule
// end of file
