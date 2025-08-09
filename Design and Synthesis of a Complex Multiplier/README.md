## Complex Multiplier : Design, Synthesis and Post Synthesis Simulation.

# Aim: 

- Develop a datapath to perform a complex multiplication of two complex numbers. The operands are 4 bit unsigned numbers. The real and imaginary parts of the multiplication are represented as 8 bit signed numbers (subtraction for real part of the product). We intend to minimise the area of the design.
- Develop a Control Module with an FSM to generate the control signals to feed to the Data path for correct excecution.
- Integrate the Data path and Control module in a Top Module, and verify its functionality.

-------

# Architecture of Choice :

Since we need to limit area, We use a single multiplier and a single adder. We appropriately use Multipliexers and Clocked registers to sequentially pipeline and reuse the Multiplier and adder.


<img width="1432" height="485" alt="image" src="https://github.com/user-attachments/assets/08e11b78-e691-4572-9062-966049d2e139" />


---------

## Functional Verification
Test case 1: (3 + 2i) * (1 + 4i) = -5 + 14i

Test case 2: (2 + 6i) * (4 + 1i) =  2 + 26i

Test case 3: (2 + 2i) * (2 + 2i) =  0 + 8i

Test case 4: (4 + 5i) * (3 + 4i) = -8 + 31i

Test case 5: (2 + 1i) * (1 + 7i) = -5 + 15i

<img width="1005" height="416" alt="image" src="https://github.com/user-attachments/assets/b49cc78f-f420-4567-8179-90b0f7e48c43" />

----------
## Synthesis

### Generated Netlist -

<img width="838" height="476" alt="image" src="https://github.com/user-attachments/assets/7fd4c09c-22d3-4cd4-a91c-c40b23150188" />

---


### Area Report - 

<img width="811" height="272" alt="image" src="https://github.com/user-attachments/assets/fe1b95b9-f723-4bfa-8b03-030fa0a0374a" />

---



### Power Report -

<img width="726" height="326" alt="image" src="https://github.com/user-attachments/assets/1637bef7-a62f-4e0a-84e5-605d166bd62c" />

---

### Timing Report -

<img width="786" height="759" alt="image" src="https://github.com/user-attachments/assets/88b7675f-357b-49ae-b1a3-cc679d5143fd" />

---


### Schematic -
<img width="1916" height="952" alt="image" src="https://github.com/user-attachments/assets/2d1620ea-46ea-499c-8612-c5b9082fcfce" />

------------
## Post Synthesis Simulation

Post-synthesis simulation is a verification step in the digital design process. It simulates the design using the gate-level netlist, which is a logical representation of the circuit after it has been optimized and mapped to a specific technology library. This simulation includes a more accurate representation of the timing delays of the logic gates and interconnections. Its primary purpose is to verify that the design's functionality and timing meet the requirements after the synthesis process, bridging the gap between a high-level RTL simulation and the final physical implementation.

Procedure :
1. Place the generated netlist from synthesis in the working directory.
2. Place the slow.v file from the library in the working directory.
3. Ensure the design testbench is present in the working directory.
4. Invoke the NCLAUNCH tool.
5. Compile the library before compiling the netlist.v and the testbench.
6. Elaborate the design, and then simulate the design.

Observations :
- On the first run, The post-synthesis simulation for the complex multiplier yields incorrect results because the signed outputs are misinterpreted. This occurs because the signed keyword, a behavioral Verilog construct, is lost during synthesis.
- The resulting gate-level netlist contains only wires, which simulators default to interpreting as unsigned values. Consequently, negative numbers are displayed as large positive integers, causing a discrepancy.


  <img width="1007" height="306" alt="image" src="https://github.com/user-attachments/assets/c8f12cc3-9fed-496a-ba6f-95652ed571dc" />


- Therefore, the responsibility for interpreting the two's complement bit pattern as a signed integer lies with the testbench, which must explicitly declare the corresponding wires connected to the netlist's outputs as signed.
