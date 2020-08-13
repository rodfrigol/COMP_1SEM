library verilog;
use verilog.vl_types.all;
entity q52_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        d1              : in     vl_logic;
        d2              : in     vl_logic;
        d3              : in     vl_logic;
        d4              : in     vl_logic;
        dser            : in     vl_logic;
        Ep              : in     vl_logic;
        R               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end q52_vlg_sample_tst;
