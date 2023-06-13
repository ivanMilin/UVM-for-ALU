`ifndef ALU_MONITOR_SV
 `define ALU_MONITOR_SV

class alu_monitor extends uvm_monitor;

    `uvm_component_utils(alu_monitor)
    
    virtual alu_interface vif;
    alu_seq_item item;

    uvm_analysis_port#(alu_seq_item) monitor_port;

    covergroup command_check;
        option.per_instance = 1;

        cmd: coverpoint vif.op_code{
            bins add = {4'b0000};
            bins sub = {4'b0001};
            bins multiply = {4'b0010};
            bins divide = {4'b0011};
        }
    endgroup

    function new(string name = "alu_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH)
    
        monitor_port = new("monitor_port", this);
    
        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
            `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
        end
    endfunction: build_phase

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("MONITOR_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    forever begin
        item = alu_seq_item::type_id::create("item");
        
        wait(!vif.reset);
        
        //sample inputs
        @(posedge vif.clock);
            item.a = vif.a;
            item.b = vif.b;
            item.op_code = vif.op_code;
        
            //sample output
            @(posedge vif.clock);
            item.result = vif.result;
        
        // send item to scoreboard
        monitor_port.write(item);
    end
        
  endtask: run_phase
  
  
endclass: alu_monitor
`endif