class alu_test_base extends uvm_test;
    `uvm_component_utils(alu_test_base)

    alu_env env;
    alu_simple_seq reset_seq;
    alu_config cfg;

    //alu_test_sequence test_seq;


    //--------------------------------------------------------
    //Constructor
    //--------------------------------------------------------
    function new(string name = "alu_test", uvm_component parent);
        super.new(name, parent);
        `uvm_info("TEST_CLASS", "Inside Constructor!", UVM_HIGH)
    endfunction: new


    //--------------------------------------------------------
    //Build Phase
    //--------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)

        env = alu_env::type_id::create("env", this);
        cfg = alu_config::type_id::create("cfg");      
	    uvm_config_db#(alu_config)::set(this, "env", "alu_config", cfg);  

    endfunction: build_phase


    //--------------------------------------------------------
    //Connect Phase
    //--------------------------------------------------------
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH)

    endfunction: connect_phase


    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

endclass: alu_test_base