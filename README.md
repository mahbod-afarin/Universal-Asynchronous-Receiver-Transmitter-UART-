# Universal-Asynchronous-Receiver-Transmitter-UART

The goal of this experiment is to design a **Universal Asynchronous Receiver/Transmitter (UART)** consisting of both a transmitter and a receiver module.

## Transmitter Module

The transmitter sends a **7-bit ASCII code** serially. Each transmission includes:

1. **Start Bit (1 bit)** – Indicates the beginning of transmission.
2. **Parity Bit (1 bit)** – Used for error detection.
3. **Data Bits (7 bits)** – The actual ASCII data.
4. **Stop Bit(s) (≥1 bit)** – Marks the end of the transmission.

>  Total transmitted bits: **10**

## Receiver Module

The receiver performs the reverse operation:

- It waits for a **Start Bit**.
- Then, it serially receives:
  - **7 bits of ASCII data**
  - **1 Parity bit**
- The combined **8-bit value** is stored in a register.

## System Integration

To verify the correctness of the UART design:

- Connect **two UART modules** together.
- One acts as the transmitter and the other as the receiver.
- Send data from one UART module to the other.
- Verify that the data exchange is successful and matches expected behavior.

## Expected Outcome

Your UART implementation should successfully:

- Serialize and transmit the correct 10-bit frame.
- Receive, decode, and store data in a register on the other end.
- Demonstrate accurate and complete data communication.



