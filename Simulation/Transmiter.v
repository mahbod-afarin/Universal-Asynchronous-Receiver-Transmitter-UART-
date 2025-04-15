module Transmitter(TxD, TxD_busy, Clk, TxD_start, TxD_data);
  output reg TxD, TxD_busy;
  input Clk, TxD_start;
  input[7:0] TxD_data;
  
  wire parityBit;
  assign parityBit = ^ TxD_data;
  integer counter;
  
  always @(posedge Clk)
  begin
    if(TxD_start == 1)
      begin
        counter = 0;
        TxD_busy = 1;
      end
  else
    begin
      if(counter < 8)
        TxD = TxD_data[counter];
      else if(counter == 8)
        TxD = parityBit;
      else
        TxD_busy = 0;
      if(TxD_busy == 1)
        counter = counter + 1;
    end
  end
endmodule
