`ifndef ALU_SIMPLE_SEQ_SV
 `define ALU_SIMPLE_SEQ_SV

class alu_simple_seq extends alu_base_seq;

    `uvm_object_utils(alu_simple_seq)

    function new(string name = "alu_simple_seq");
      super.new(name);
   endfunction

    virtual task body();
      for(int i = 0;i<100;i++) begin
        `uvm_do_with(item,{item.reset = 0 || item.reset == 1; });
      
      end  
    endtask : body


endclass : alu_simple_seq
`endif