library verilog;
use verilog.vl_types.all;
entity q5_vlg_sample_tst is
    port(
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        Y01             : in     vl_logic;
        Y02             : in     vl_logic;
        Y11             : in     vl_logic;
        Y12             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q5_vlg_sample_tst;
