module test;
  TopModuleRs232 rs232(Output, Error, Clk, Reset, Input);
  wire[7:0] Output;
  wire Error;
  reg Clk, Reset;
  reg[7:0] Input;
  
  initial
  begin
    Clk = 0;
    Reset = 1;
    #10 Res
  end
  
  always
  begin
    #10 Clk = !Clk;
  end
endmodule;
