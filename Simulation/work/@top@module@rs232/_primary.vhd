library verilog;
use verilog.vl_types.all;
entity TopModuleRs232 is
    port(
        Output          : out    vl_logic_vector(7 downto 0);
        Error           : out    vl_logic;
        RxD_idle        : out    vl_logic;
        bit             : out    vl_logic;
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Input           : in     vl_logic_vector(7 downto 0)
    );
end TopModuleRs232;
