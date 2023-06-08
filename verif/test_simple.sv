`ifndef ALU_TEST_SIMPLE_SV
 `define ALU_TEST_SIMPLE_SV

class alu_test_simple extends alu_test_base;

    `uvm_component_utils(alu_test_simple)

    function new(string name = "test_simple", uvm_component parent = null);
	    super.new(name,parent);
    endfunction : new

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)

        phase.raise_objection(this);

        //reset_seq
        reset_seq = alu_base_sequence::type_id::create("reset_seq");
        reset_seq.start(env.agnt.seqr);
        #10;

        repeat(100) begin
            //test_seq
            test_seq = alu_test_sequence::type_id::create("test_seq");
            test_seq.start(env.agnt.seqr);
            #10;
        end

        phase.drop_objection(this);

    endtask: run_phase