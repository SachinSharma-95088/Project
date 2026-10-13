# Mini CPU — Version 1 Instruction Set

## Overview

- Architecture: Custom 8-bit accumulator-based CPU
- Registers: A, B, C (8 bits each)
- Program Counter: 8 bits
- Flags: Zero flag (Z)
- Control: FSM-based, multi-cycle execution
- Memory: Separate instruction memory and data RAM
- Instruction count: 16 proposed instructions

## Instruction Table

| # | Group | Instruction | Bytes | Operation | Flags |
|---|---|---|---:|---|---|
| 1 | Data Transfer | MVI r, data | TBD | r <- data | Unchanged |
| 2 | Data Transfer | MOV r1, r2 | TBD | r1 <- r2 | Unchanged |
| 3 | Data Transfer | LDA addr | TBD | A <- RAM[addr] | Unchanged |
| 4 | Data Transfer | STA addr | TBD | RAM[addr] <- A | Unchanged |
| 5 | Arithmetic | ADD r | TBD | A <- A + r | Z updated |
| 6 | Arithmetic | SUB r | TBD | A <- A - r | Z updated |
| 7 | Arithmetic | INR r | TBD | r <- r + 1 | Z updated |
| 8 | Arithmetic | DCR r | TBD | r <- r - 1 | Z updated |
| 9 | Logic | ANA r | TBD | A <- A AND r | Z updated |
| 10 | Logic | ORA r | TBD | A <- A OR r | Z updated |
| 11 | Logic | XRA r | TBD | A <- A XOR r | Z updated |
| 12 | Branch | JMP addr | TBD | PC <- addr | Unchanged |
| 13 | Branch | JNZ addr | TBD | If Z=0, PC <- addr | Reads Z |
| 14 | Branch | JZ addr | TBD | If Z=1, PC <- addr | Reads Z |
| 15 | Control | NOP | TBD | No operation | Unchanged |
| 16 | Control | HLT | TBD | Stop execution | Unchanged |

