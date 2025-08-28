## Physical Design of a full adder on Cadence Innovus
### Introduction
Physical design is the backend process of converting a synthesizable netlist into a manufacturable GDSII layout. It's carried out in Cadence Innovus through an automated flow, starting with floorplanning and power planning to define the chip's physical structure. This is followed by placement and clock tree synthesis (CTS) to arrange and time the digital logic. The final stages involve routing to connect all nets, culminating in physical verification checks (DRC/LVS) to ensure the design is ready for tapeout.

### Inputs ->
- Post Synthesis Netlist
- Post Synthesis Constraints file
- Library files (slow.lib, fast.lib)
- LEF File

### Outputs ->
A GDSII (Graphic Data System II) file is the final output of the IC physical design process. It's a binary file format that serves as the de facto industry standard for transferring the complete layout of an integrated circuit to the fabrication foundry.  The file contains all the geometric shapes, layers, and hierarchical information required to manufacture the chip, essentially acting as the blueprint for creating the physical masks used in lithography.

### Procedure ->
