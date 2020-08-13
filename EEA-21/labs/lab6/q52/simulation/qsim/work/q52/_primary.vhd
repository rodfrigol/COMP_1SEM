library verilog;
use verilog.vl_types.all;
entity q52 is
    port(
        Q1              : out    vl_logic;
        R               : in     vl_logic;
        dser            : in     vl_logic;
        d4              : in     vl_logic;
        Ep              : in     vl_logic;
        CLK             : in     vl_logic;
        d3              : in     vl_logic;
        d2              : in     vl_logic;
        d1              : in     vl_logic;
        Q2              : out    vl_logic;
        Q3              : out    vl_logic;
        Q4              : out    vl_logic
    );
end q52;
