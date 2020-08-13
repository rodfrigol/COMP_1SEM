library verilog;
use verilog.vl_types.all;
entity q42 is
    port(
        f               : out    vl_logic;
        a               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        b               : in     vl_logic
    );
end q42;
