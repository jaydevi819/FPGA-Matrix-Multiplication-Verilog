# FPGA-Based Matrix Multiplication Accelerator | Verilog HDL

## Overview

This project implements a parameterized **N × N Matrix Multiplication Accelerator** using **Verilog HDL**. The design utilizes a parallel **Multiply-Accumulate (MAC)** architecture to perform efficient matrix multiplication. The output matrix elements are displayed sequentially on seven-segment displays. The design was synthesized using **Intel Quartus Prime** and functionally verified using **ModelSim**.

---
## Project Demonstration

### RTL Viewer

<img width="1668" height="924" alt="{1D0E6B07-280A-404D-86B2-630DC05AB7AA}" src="https://github.com/user-attachments/assets/6a8c4406-ae1c-4d6c-a549-d28e44b4478b" />

### Technology Map

<img width="1883" height="407" alt="{0FEF9C95-96D9-404B-BE4C-CE8FE2C90FBC}" src="https://github.com/user-attachments/assets/fbbc23af-8cd9-41e3-824f-2e6a23720604" />


### Simulation Waveform

<img width="1697" height="771" alt="{4998EB2D-25BC-446B-988E-108080D02E8B}" src="https://github.com/user-attachments/assets/cd783595-3608-402c-bb48-73291ae83308" />


### Block Diagram

<img width="1362" height="713" alt="image" src="https://github.com/user-attachments/assets/c5550dff-7621-4f34-9831-f921f02740b4" />

---

## Features

- Parameterized N × N matrix multiplication
- Parallel Multiply-Accumulate (MAC) architecture
- Verilog HDL implementation
- Functional simulation using ModelSim
- Synthesized using Intel Quartus Prime
- Seven-segment display interface

---

## Tools Used

- Verilog HDL
- Intel Quartus Prime
- ModelSim
- Intel Cyclone II FPGA

---

## Repository Structure

```
FPGA-Matrix-Multiplication-Verilog
│
├── mac1.v/          # Verilog source files
├── RTL,TTL,WaveForms/       # RTL viewer, waveforms
├── fpgareport.pdf/       # Project report
└── README.md
```

---

## Working Principle

The accelerator computes matrix multiplication using a parallel MAC architecture generated through Verilog `generate` blocks. The multiplication results are accumulated to obtain each element of the output matrix, which is then displayed sequentially using seven-segment displays.

---

## Results

- Successfully synthesized using Intel Quartus Prime.
- Functionality verified through ModelSim simulation.
- Matrix multiplication results displayed on seven-segment displays.

---

## Applications

- FPGA-Based Computing
- Digital Signal Processing (DSP)
- Hardware Acceleration
- Embedded Systems

---

## Future Improvements

- Develop a dedicated Verilog testbench for automated verification.
- Extend the design to support larger matrix dimensions.
- Optimize the architecture using pipelining for higher performance.

---

## Author

**Jaydeviba Jadeja**

B.Tech, Electronics & Communication Engineering

Nirma University
