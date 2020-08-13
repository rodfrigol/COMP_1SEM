library verilog;
use verilog.vl_types.all;
entity Block2_vlg_sample_tst is
    port(
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        X0              : in     vl_logic;
        X1              : in     vl_logic;
        X2              : in     vl_logic;
        X3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Block2_vlg_sample_tst;
