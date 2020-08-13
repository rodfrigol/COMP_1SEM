library verilog;
use verilog.vl_types.all;
entity q5 is
    port(
        A               : out    vl_logic;
        A2              : in     vl_logic;
        A1              : in     vl_logic;
        Y2              : out    vl_logic;
        Y1              : out    vl_logic;
        Y12             : in     vl_logic;
        Y11             : in     vl_logic;
        Y0              : out    vl_logic;
        Y02             : in     vl_logic;
        Y01             : in     vl_logic
    );
end q5;
