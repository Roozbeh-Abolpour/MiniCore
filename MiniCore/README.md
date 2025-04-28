
This project presents a modular CPU design built entirely in Verilog.
It demonstrates key processor concepts such as instruction decoding, ALU operations, memory interfacing, and control signal generation.

Project Structure
MiniCore/
├── src/        (Source Verilog files: CPU modules)
├── tests/      (Testbench for simulation)
├── instr_mem.hex   (Instruction memory contents)
├── data_mem.hex     (Data memory contents)
└── README.md   (This file)
Main Components
Main.v — Top module integrating the CPU components.

ALU.v — Performs arithmetic and logic operations.

Registers.v — Implements the register file.

Mux.v — Multiplexer modules for selecting inputs.

InstructionMem.v — Stores the program instructions.

DataMem.v — Stores and retrieves data during program execution.

ControlUnit.v — Decodes instructions and generates control signals.

PC.v, ShiftLeft.v, SignExtender.v — Supporting logic modules.

Testing and Simulation
The project includes a simple testbench located in the tests/ folder:

testbench.v generates the clock and reset signals.

The CPU is simulated over several cycles.

instr_mem.hex and data_mem.hex provide initial contents for instruction and data memory respectively.

The simulation can be performed using standard Verilog simulation tools such as ModelSim, Xilinx Vivado, or Xilinx ISE.

How to Run
Load all source files from the src/ directory into your Verilog project.

Load the testbench.v from the tests/ folder.

Ensure instr_mem.hex and data_mem.hex are available for memory initialization.

Run the simulation and observe the CPU behavior.

Skills Demonstrated
Modular hardware design

Digital logic and processor architecture

Verilog HDL

Writing and running testbenches

Simulation and debugging techniques

License
MIT License © Roozbeh Abolpour