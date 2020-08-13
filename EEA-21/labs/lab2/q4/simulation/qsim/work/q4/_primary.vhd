library verilog;
use verilog.vl_types.all;
entity q4 is
    port(
        A               : out    vl_logic;
        X0              : in     vl_logic;
        X2              : in     vl_logic;
        X3              : in     vl_logic;
        X1              : in     vl_logic;
        Y0              : out    vl_logic;
        Y1              : out    vl_logic
    );
end q4;
