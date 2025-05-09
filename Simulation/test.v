module test;
  wire[7:0] Output;
  wire Error, idle, bit;
  reg Clk, Reset;
  reg[7:0] Input;
  TopModuleRs232 rs232(Output, Error, idle, bit, Clk, Reset, Input);
  
  initial
  begin
    Clk = 0;
    Reset = 1;
    #10 Reset = 0;
    Input = 8'b10010110;
    #140 $stop;
  end
  
  always
  begin
    #5 Clk = !Clk;
  end
endmodule                                                                                                                                                                                                                                                                                                                        