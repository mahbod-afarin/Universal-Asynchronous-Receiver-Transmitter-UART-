module Transmitter (
    output reg TxD,           // Serial output bit
    output reg TxD_busy,      // Indicates transmission in progress
    input wire Clk,           // Clock signal
    input wire TxD_start,     // Start transmission signal
    input wire [7:0] TxD_data // Byte to transmit
);

  reg [3:0] counter;          // 4-bit counter for 8 bits + 1 parity + 1 stop
  reg [7:0] data_reg;         // Register to hold data during transmission
  reg parity_bit;

  always @(posedge Clk) begin
    if (TxD_start) begin
      // Start transmission
      counter     <= 0;
      TxD_busy    <= 1;
      data_reg    <= TxD_data;
      parity_bit  <= ^TxD_data;  // Calculate parity once at the start
    end else if (TxD_busy) begin
      // Transmit data bit by bit
      if (counter < 8) begin
        TxD <= data_reg[counter]; // Send data bits
      end else if (counter == 8) begin
        TxD <= parity_bit;        // Send parity bit
      end else begin
        TxD <= 1'b1;              // Idle state / stop bit
        TxD_busy <= 0;            // Transmission complete
      end
      counter <= counter + 1;
    end else begin
      TxD <= 1'b1;                // Idle level
    end
  end

endmodule
