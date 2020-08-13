library verilog;
use verilog.vl_types.all;
entity q53_vlg_sample_tst is
    port(
        Ai              : in     vl_logic;
        Bi              : in     vl_logic;
        Eimenos1        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q53_vlg_sample_tst;
