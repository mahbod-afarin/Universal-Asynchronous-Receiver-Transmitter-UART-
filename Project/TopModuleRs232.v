module TopModuleRs232 (
    output wire [7:0] Output,    // Received data output
    output wire Error,           // Parity error flag
    output wire RxD_idle,        // Receiver idle flag
    output wire bit,             // Transmitted bit (TxD_bit)
    input wire Clk,              // System clock
    input wire Reset,            // System reset
    input wire [7:0] Input       // Data to be transmitted
);

  // Internal signals
  wire TxD_bit;                  // Output bit from transmitter
  wire TxD_busy;                 // Indicates transmitter is busy
  reg reseted;                   // Internal reset for receiver
  assign bit = TxD_bit;          // Expose TxD_bit on top-level output

  // Instantiate Transmitter
  Transmitter t (
      .TxD(TxD_bit),
      .TxD_busy(TxD_busy),
      .Clk(Clk),
      .Reset(Reset),
      .Data(Input)
  );

  // Instantiate Receiver
  Receiver r (
      .Error(Error),
      .RxD_idle(RxD_idle),
      .RxD_data(Output),
      .RxD_data_ready(reseted),
      .RxD(TxD_bit),
      .Clk(Clk)
  );

  // Generate receiver reset pulse
  always @(posedge Clk) begin
    if (Reset)
      reseted <= 1'b1;
    else
      reseted <= 1'b0;
  end

endmodule
