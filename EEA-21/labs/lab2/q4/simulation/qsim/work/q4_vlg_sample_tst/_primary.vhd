library verilog;
use verilog.vl_types.all;
entity q4_vlg_sample_tst is
    port(
        X0              : in     vl_logic;
        X1              : in     vl_logic;
        X2              : in     vl_logic;
        X3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q4_vlg_sample_tst;
