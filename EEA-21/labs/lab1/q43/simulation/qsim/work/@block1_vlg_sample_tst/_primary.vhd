library verilog;
use verilog.vl_types.all;
entity Block1_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Block1_vlg_sample_tst;
