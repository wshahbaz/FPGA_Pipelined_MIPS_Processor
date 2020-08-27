# FPGA_Pipelined_MIPS_Processor
32-bit, 5-stage pipelined MIPS processor using DE10-Lite FPGA development board

## Architecture
We follow a standard single-cycle MIPS processor architecture, followed by implementing pipelining with pipelined registers and data hazard solutions including a Forwarding Unit, Stall Control Unit, and Flush Control Unit.
![Pipelined 32-bit MIPS Processor Block Diagram](https://github.com/wshahbaz/FPGA_Pipelined_MIPS_Processor/blob/master/block_diagram.png)

## Specifications
### Instruction Set
1. ADD rd, rs, rt: Reg[rd] = Reg[rs] + Reg[rt].
2. BNE rs, rt, imm16: if (Reg[rs] != Reg[rt]) PC = PC + 4 + Sign_ext(Imm16)<<2 else PC = PC + 4.
3. J target: PC = { PC[31:28], target, 00 }.
4. JR rs: PC = Reg[rs].
5. LW rt, imm16(rs): Reg[rt] = Mem[Reg[rs] + Sign_ext(Imm16)].
6. SLT rd, rs, rt: If (Reg[rs] < Reg[rt]) Reg[rd] = 00000001 else Reg[rd] = 00000000.
7. SUB rd, rs, rt: Reg[rd] = Reg[rs] – Reg[rt].
8. SW rt, imm16(rs): Mem[Reg[rs] + Sign_ext(Imm16)] = Reg[rt].
9. XORI rt, rs, imm16: Reg[rt] = Reg[rs] XOR Zero_ext(Imm16

### Executing code
Populate the file "instr.txt" with binary instructions (in MIPS), following control signals defined by the Control Unit. 
Run a simulation on Modelsim to verify processing.
