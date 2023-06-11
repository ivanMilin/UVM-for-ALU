class alu_env extends uvm_env;

    `uvm_component_utils(alu_env)
    alu_config cfg;
    alu_agent agnt;
    alu_scoreboard scb;


    function new(string name = "alu_env", uvm_component parent);
    super.new(name, parent);
        `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
    endfunction: new


    function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH)
        
        
        agnt = alu_agent::type_id::create("agent", this);
        scb = alu_scoreboard::type_id::create("scb", this);
        
        if(!uvm_config_db#(alu_config)::get(this, "", "alu_config", cfg))
         `uvm_fatal("NOCONFIG",{"Config object must be set for: ",get_full_name(),".cfg"})
        uvm_config_db#(alu_config)::set(this, "agent", "alu_config", cfg);
        
        
    
        


    endfunction: build_phase


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)

        agnt.mon.monitor_port.connect(scb.scoreboard_port);

    endfunction: connect_phase
    

endclass: alu_env