library verilog;
use verilog.vl_types.all;
entity q4_vlg_check_tst is
    port(
        A               : in     vl_logic;
        Y0              : in     vl_logic;
        Y1              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end q4_vlg_check_tst;
