library verilog;
use verilog.vl_types.all;
entity q52_vlg_sample_tst is
    port(
        Ai              : in     vl_logic;
        Bi              : in     vl_logic;
        Y1i             : in     vl_logic;
        Y3i             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q52_vlg_sample_tst;
