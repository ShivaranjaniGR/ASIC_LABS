## Design and Synthesis of a Complex Multiplier

# Aim: 

Develop a datapath to perform a complex multiplication of two complex numbers. The operands and product are all in Cartesian form.
The real and imaginary parts of the operands are represented as signed fixedpoint numbers with 4 pre-binary-point and 12 post-binary-point bits. The real
and imaginary parts of the product are similarly represented, but with 8 prebinary-point and 24 post-binary-point bits. The complex multiplier is subject to
constraints that strongly limit the circuit area.

-------

# Background check in pen and paper:

<img width="872" height="766" alt="image" src="https://github.com/user-attachments/assets/8973ef38-aa7b-4acc-b2a5-573d86144df9" />

----------


# Architecture of Choice :

Since we need to limit area, We use a single multiplier and a single adder. We appropriately use Multipliexers and Clocked registers to sequentially pipeline and reuse the Multiplier and adder.


<img width="1432" height="485" alt="image" src="https://github.com/user-attachments/assets/08e11b78-e691-4572-9062-966049d2e139" />


---------

# RTL :

 - behavioral modeling for sequential logic
 - dataflow modeling for combinational logic.
