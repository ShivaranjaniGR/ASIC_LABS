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
