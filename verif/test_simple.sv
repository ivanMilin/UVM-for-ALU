`ifndef ALU_TEST_SIMPLE_SV
 `define ALU_TEST_SIMPLE_SV

class alu_test_simple extends alu_test_base;

    alu_simple_seq test_seq;
    `uvm_component_utils(alu_test_simple)

    function new(string name = "test_simple", uvm_component parent = null);
	    super.new(name,parent);
	    test_seq = alu_simple_seq::type_id::create("test_seq");
    endfunction : new

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)

        phase.raise_objection(this);

        repeat(100) begin
            //test_seq
            test_seq.start(env.agnt.seqr);
            #10;
        end

        phase.drop_objection(this);

    endtask: run_phase
endclass :alu_test_simple
`endif