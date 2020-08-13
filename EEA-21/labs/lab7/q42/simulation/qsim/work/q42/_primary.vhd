library verilog;
use verilog.vl_types.all;
entity q42 is
    port(
        Z               : out    vl_logic;
        TEMP            : in     vl_logic;
        CLK             : in     vl_logic
    );
end q42;
