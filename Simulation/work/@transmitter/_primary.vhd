library verilog;
use verilog.vl_types.all;
entity Transmitter is
    port(
        TxD             : out    vl_logic;
        TxD_busy        : out    vl_logic;
        Clk             : in     vl_logic;
        TxD_start       : in     vl_logic;
        TxD_data        : in     vl_logic_vector(7 downto 0)
    );
end Transmitter;
