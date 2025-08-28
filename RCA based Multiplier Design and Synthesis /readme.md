
ARCHITECHTURE - 


- rca3 is a 3-bit ripple-carry adder, and it's used to sum the first two rows of partial products in the multiplier.

- rca2 is a 2-bit ripple-carry adder, and it's used to sum the third row of partial products with the intermediate sums from the first stage.

- The different-sized adders are necessary because the 3x3 array multiplier architecture has a staggered carry propagation, meaning the number of bits to be added in each stage is different.

- This approach is more efficient than using individual full adders for every sum.

- Using a combination of specialized adder modules ensures the design is correct and easy to manage.
