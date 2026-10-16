class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)

  fifo_agent      wr_agent;
  fifo_agent      rd_agent;
  fifo_scoreboard sb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wr_agent = fifo_agent::type_id::create("wr_agent", this);
    rd_agent = fifo_agent::type_id::create("rd_agent", this);
    sb = fifo_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    wr_agent.mon.ap.connect(sb.wr_export);
    rd_agent.mon.ap.connect(sb.rd_export);
  endfunction
endclass
