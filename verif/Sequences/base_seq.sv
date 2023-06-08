`ifndef ALU_BASE_SEQ_SV
 `define ALU_BASE_SEQ_SV

class alu_base_seq extends uvm_sequence#(alu_seq_item);

    `uvm_objects_utils(alu_base_seq)
    `uvm_declare_p_sequencer(alu_sequencer)


    function new(string name = "alu_base_seq");
        super.new(name);
    endfunction


    virtual task pre_body();
    uvm_phase phase = get_starting_phase();
    if (phase != null)
        phase.raise_objection(this, {"Running sequence '", get_full_name(), "'"});
    endtask : pre_body

    // objections are dropped in post_body
    virtual task post_body();
    uvm_phase phase = get_starting_phase();
    if (phase != null)
        phase.drop_objection(this, {"Completed sequence '", get_full_name(), "'"});
    endtask : post_body

endclass : alu_base_seq

`endif