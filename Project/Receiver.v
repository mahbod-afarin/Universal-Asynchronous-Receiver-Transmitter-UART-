module Receiver (
    output reg Error,             // Indicates parity error
    output reg RxD_idle,          // High when receiver is idle
    output reg [7:0] RxD_data,    // Received byte
    input wire RxD_data_ready,    // Start signal for receiving data
    input wire RxD,               // Serial data bit input
    input wire Clk                // Clock signal
);

  reg parityBit;
  reg started;
  integer counter;

  always @(posedge Clk) begin
    if (RxD_data_ready) begin
      // Begin receiving a new data frame
      started   <= 1'b1;
      counter   <= 0;
      RxD_idle  <= 1'b0;
      Error     <= 1'b0;
    end else if (started) begin
      // Continue data reception
      if (counter < 8) begin
        RxD_data[counter] <= RxD;  // Capture data bit
      end else if (counter == 8) begin
        // Parity bit
        parityBit <= RxD;
        if (RxD ^ (^RxD_data)) begin
          Error <= 1'b1;           // Parity mismatch
        end
      end else begin
        // Data and parity done
        RxD_idle <= 1'b1;
        started  <= 1'b0;
      end
      counter <= counter + 1;
    end
  end

endmodule
