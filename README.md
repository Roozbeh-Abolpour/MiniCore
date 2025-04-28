# MiniCore – A Modular Verilog CPU Design

**MiniCore** is a modular CPU design built in Verilog, demonstrating key concepts in processor architecture. It includes modules for instruction decoding, arithmetic and logic unit (ALU) operations, memory interfacing, and control logic. The project is aimed at showcasing fundamental digital design principles and is easily extendable for educational purposes and further development.


## Main Components

- **Main.v** — Top-level module integrating the CPU components.
- **ALU.v** — Arithmetic and logic operations performed here.
- **Registers.v** — Implements the general-purpose register file.
- **Mux.v** — Multiplexers for selecting input signals in the data path.
- **InstructionMem.v** — Stores program instructions for execution.
- **DataMem.v** — Stores and retrieves data during program execution.
- **ControlUnit.v** — Decodes instructions and generates control signals.
- **PC.v, ShiftLeft.v, SignExtender.v** — Supporting modules for address calculation and data processing.

## Testing and Simulation

This project includes a simple **testbench** located in the `tests/` folder:

- **testbench.v**: Generates the clock and reset signals for the CPU.
- The **`InstructionMem.v`** and **`DataMem.v`** modules can be initialized manually within the Verilog code or modified to read memory content from a file using `$readmemh()` if necessary.

### How to Run

1. Load all the source files from the `src/` directory into your Verilog simulation tool.
2. Load the **`testbench.v`** file from the `tests/` folder.
3. If using memory initialization files:
   - You can modify the `InstructionMem.v` and `DataMem.v` modules to read memory contents from a file like `instr_mem.hex` or `data_mem.hex` using `$readmemh()` if you choose to add those files.
4. Run the simulation to observe the CPU behavior.

## Skills Demonstrated

- Modular hardware design using Verilog
- Processor architecture and control logic
- Instruction set design and memory management
- Testbench development and simulation techniques

