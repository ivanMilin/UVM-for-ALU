class alu_agent extends uvm_agent;

    `uvm_component_utils(alu_agent)
  
    alu_config cfg;
    alu_driver drv;
    alu_monitor mon;
    alu_sequencer seqr;

    function new(string name = "alu_agent", uvm_component parent);
        
        super.new(name, parent);
        `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
    
    endfunction: new

    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)
    
        mon = alu_monitor::type_id::create("mon", this);

        if(cfg.is_active == UVM_ACTIVE) begin    
            drv = alu_driver::type_id::create("drv", this);
            seqr = alu_sequencer::type_id::create("seqr", this);
        end
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        
        super.connect_phase(phase);
        `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
        
        drv.seq_item_port.connect(seqr.seq_item_export);
    
    endfunction: connect_phase

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase

endclass : alu_agent