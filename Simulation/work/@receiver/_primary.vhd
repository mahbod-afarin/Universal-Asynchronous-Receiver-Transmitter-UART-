library verilog;
use verilog.vl_types.all;
entity Receiver is
    port(
        Error           : out    vl_logic;
        RxD_idle        : out    vl_logic;
        RxD_data        : out    vl_logic_vector(7 downto 0);
        RxD_data_ready  : in     vl_logic;
        RxD             : in     vl_logic;
        Clk             : in     vl_logic
    );
end Receiver;
