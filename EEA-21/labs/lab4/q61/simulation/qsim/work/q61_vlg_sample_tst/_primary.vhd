library verilog;
use verilog.vl_types.all;
entity q61_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C0              : in     vl_logic;
        M               : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q61_vlg_sample_tst;
