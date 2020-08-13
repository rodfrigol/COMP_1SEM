library verilog;
use verilog.vl_types.all;
entity q42_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        TEMP            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q42_vlg_sample_tst;
