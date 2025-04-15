module Receiver(Error, RxD_idle, RxD_data, RxD_data_ready, RxD, Clk);
  output reg Error, RxD_idle;
  output reg[7:0] RxD_data;
  input RxD_data_ready, RxD, Clk;
  
  reg parityBit;
  reg started;
  integer counter;
  
  always @(posedge Clk)
  begin
    if(RxD_data_ready == 1)
      begin
        started = 1;
        counter = 0;
        RxD_idle = 0;
        Error = 0;
      end
    else if(RxD_data_ready == 0)
      begin
      if(started)
        begin
          if(counter < 8)
            RxD_data[counter] = RxD;
          else if(counter == 8)
            begin
              parityBit = RxD;
              if(parityBit != ^ RxD_data)
                Error = 1;
            end
          else
            begin
              RxD_idle = 1;
              started = 0;
            end
          counter = counter + 1;
        end
      end
  end
endmodule
