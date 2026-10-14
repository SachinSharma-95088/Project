# Mini CPU — Instruction Encoding (V1)

## 1. Overview

- Architecture: 8-bit accumulator-based CPU
- Instruction width: 8-bit base instruction word
- Opcode width: 4 bits
- General-purpose registers: A, B, C (8-bit each)
- Register ID width: 2 bits
- Instruction memory: 256 byte-addressable locations
- Data memory: 256 byte-addressable locations

## 2. Opcode Table

| Opcode | Instruction | Description |
|---|---|---|
| 0x0 | MVI | Load immediate data into a register |
| 0x1 | MOV | Copy data between registers |
| 0x2 | LDA | Load data from memory |
| 0x3 | STA | Store data to memory |
| 0x4 | ADD | Add a register value to A |
| 0x5 | SUB | Subtract a register value from A |
| 0x6 | INR | Increment a register |
| 0x7 | DCR | Decrement a register |
| 0x8 | ANA | Bitwise AND with A |
| 0x9 | ORA | Bitwise OR with A |
| 0xA | XRA | Bitwise XOR with A |
| 0xB | JMP | Unconditional jump |
| 0xC | JNZ | Jump if zero flag is clear |
| 0xD | JZ | Jump if zero flag is set |
| 0xE | NOP | No operation |
| 0xF | HLT | Halt execution |

## 3. Register IDs

| Register | ID |
|---|---|
| A | 00 |
| B | 01 |
| C | 10 |
| Reserved | 11 |

## 4. Instruction Lengths

| Instruction type | Length |
|---|---|
| Register-register operations | 1 byte |
| Register-only operations | 1 byte |
| Immediate-data operations | 2 bytes |
| Memory-address operations | 2 bytes |
| Jump operations | 2 bytes |
| NOP and HLT | 1 byte |

## 5. Encoding Status

The opcode assignments and register IDs are defined for V1. Exact bit positions, reserved-bit rules, and instruction byte layouts must be finalized before RTL implementation.

## 6. Implementation Notes

- The PC addresses instruction bytes.
- Single-byte instructions advance the PC by one.
- Two-byte instructions advance the PC by two when execution continues sequentially.
- Jump instructions load the target address into the PC.
- The instruction decoder and FSM must support the defined instruction lengths.
