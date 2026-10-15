package fifo_regs_pkg;
  localparam logic [7:0] CTRL_ADDR = 8'h00; // RW
  localparam logic [7:0] STATUS_ADDR = 8'h04; // RO
  localparam logic [7:0] INT_EN_ADDR = 8'h08; // RW
  localparam logic [7:0] INT_STATUS_ADDR = 8'h0C; // W1C
  localparam logic [7:0] FIFO_LEVEL_ADDR = 8'h10; // RO
endpackage
