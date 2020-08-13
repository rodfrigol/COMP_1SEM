library verilog;
use verilog.vl_types.all;
entity q53_vlg_sample_tst is
    port(
        Ai              : in     vl_logic;
        Bi              : in     vl_logic;
        Cin             : in     vl_logic;
        M               : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q53_vlg_sample_tst;
