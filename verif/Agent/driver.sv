`ifndef ALU_DRIVER_SV
 `define ALU_DRIVER_SV

class alu_driver extends uvm_driver#(alu_seq_item);
    
    `uvm_component_utils(alu_driver)
    alu_seq_item item;
    virtual alu_interface vif;

    function new(string name = "alu_driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("DRIVER_CLASS", "Build Phase!", UVM_HIGH)
    
        if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
            `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
        end
    endfunction: build_phase

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("DRIVER_CLASS", "Inside Run Phase!", UVM_HIGH)
    
        forever begin
            
            seq_item_port.get_next_item(item);
            drive(item);
            seq_item_port.item_done();
        end
    endtask: run_phase

    task drive(alu_seq_item item);
        @(posedge vif.clock);
        vif.reset <= item.reset;
        vif.a <= item.a;
        vif.b <= item.b;
        vif.op_code <= item.op_code;
    endtask: drive
endclass : alu_driver

`endif 