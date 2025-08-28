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
1. Invoke the tool
2. Import the design. Add the Post Synthesis netlist and LEF file.
3. Specify Power nets & Ground nets
4. Customise MMMC objects and analysis views in analysis configurations.
5. Open the Innovus GUI
6. Specify the floor plan
7. Do power planning
8. Do special routing for gnd and power network
9. Enable I/O pins in placement mode
10. Place the standard cells
11. view post Standard cell placement
12. extract pre CTS timing reports
13. Write a CTS Script file (.spec) file
14. source the file to do CTS.
15. Save the current state of the physical design to a binary file using the "saveDesign" command.
16. Do nano routing for global and Detailed Routing with optimised via and wires.
17. Place the filler cells.
18. Extract delays (rc) and save the netlist.
19. Save the innovus design as .enc file.
20. Create a GDS/OASIS file.

    

   
