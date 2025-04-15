module TopModuleRs232(Output, Error, RxD_idle, bit, Clk, Reset, Input);
  output[7:0] Output;
  output Error, RxD_idle, bit;
  input Clk, Reset;
  input[7:0] Input;
  
  wire TxD_bit, TxD, TxD_busy;
  assign bit = TxD_bit;
  reg reseted;
  Transmitter t(TxD_bit, TxD_busy, Clk, Reset, Input);
  Receiver r(Error, RxD_idle, Output, reseted, TxD_bit, Clk);
  
  always @(posedge Clk)
  begin
    if(Reset == 1)
      reseted <= 1;
    else
      reseted <= 0;
  end
  
endmodule
