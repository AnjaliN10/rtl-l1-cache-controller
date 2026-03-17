# Direct-Mapped L1 Cache Controller (Verilog)

##  Overview
This project implements a Direct-Mapped L1 Cache Controller using Verilog.  
It demonstrates cache hit/miss detection, tag comparison, and valid-bit logic.

##  Features
- Direct-mapped cache architecture
- Tag array and data array implementation
- Valid bit for cache line validation
- Cache hit/miss detection
- RTL design using Verilog
- Functional verification using testbench

##  Tools Used
- Verilog HDL
- Xilinx Vivado (Simulation)

##  Architecture
- Address Decoder
- Tag Array
- Data Array
- Comparator
- Cache Controller

##  Simulation Result

The waveform demonstrates:
- First access → Cache MISS  
- Second access → Cache HIT  
- New address → Cache MISS  


##  How to Run
1. Open project in Vivado
2. Add RTL and testbench files
3. Run behavioral simulation
4. Observe waveform

##  Concepts Covered
- Cache memory design
- Computer architecture basics
- RTL design
- Simulation and verification
