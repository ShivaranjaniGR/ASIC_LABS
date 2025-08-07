# SWITCHING ACTIVITY ANALYSIS IN SYNTHESIS 
## Introduction :

In digital design synthesis, power activity estimation plays a crucial role in understanding how much dynamic power a circuit will consume during operation. This estimation is typically based on the switching activity of the signals in the design, which reflects how frequently signals toggle between logic states. When synthesizing without a testbench or real input stimuli, the synthesis tool relies on a default toggling rate to approximate signal activity. 

Most tools assume a default toggling rate of 12.5% (i.e., a signal toggles once every 8 clock cycles) and a 50% static probability (equal chance of being 0 or 1). These assumptions help provide a rough estimate of dynamic power consumption. However, actual power usage can significantly deviate from this default if realistic switching data is not used. Therefore, for accurate power analysis, post-synthesis simulations with real input stimuli are essential.

## Theory:
In a testbench -based power analysis, several factors influence the accuracy and magnitude of the estimated power. Each plays a role in determining the switching activity, which directly affects dynamic power consumption. Here are the key effects:

- Toggling Rate: Higher toggling (switching) rates increase dynamic power because more charging and discharging of load capacitances occur. Lines that toggle more frequently dissipate more power.

- Number of Stimuli: A greater number of realistic and diverse input stimuli allows for more comprehensive signal coverage, revealing hotspots and active paths that might be missed with limited inputs, thus improving power estimation accuracy.

- Corner Analysis (Process-Voltage-Temperature - PVT Corners): Different corners (e.g., TT, SS, FF) affect transistor speed and leakage. For instance, at high temperature and low voltage (slow-slow corner), leakage increases, while fast corners may lead to more dynamic switching.

- Input Signal Correlation: If testbench inputs are highly correlated (e.g., switching together), they may reduce overall toggling in combinational logic. Random or decorrelated inputs may cause higher toggling and dynamic power.

- Clock Frequency: Higher clock rates increase power as switching happens more often per unit time. A testbench running at a higher clock shows more dynamic activity per second.

- Simulation Duration and Coverage: Longer and more diverse simulation cycles capture a wider range of circuit behavior. This ensures toggling data across various operational modes, improving overall power prediction.

In summary, power estimation during simulation is sensitive to how closely the testbench mimics real-world conditions. Accurate testbench design leads to more reliable power analysis.

----

## Testbenches under consideration for the DUT (FullAdder) :
1. Testbench 1 -> All 8 input combinations in increasing order, clock toggles every 5 time units.
2. Testbench 2 -> All 8 input combinations in increasing order, clock toggles every 1 time unit (higher toggling rate).
3. Testbench 3 -> Only 4 input combinations in increasing order, clock toggles every 5 time units.
4. Testbench 4 -> All 8 input combinations are Gray Coded, clock toggles every 5 time units.
5. Testbench 4 -> All 8 input combinations are Gray Coded, clock toggles every 1 time units (higher toggling rate).

## Procedure 
- generate .vcd file during simulation using the testbench.
- After the read_hdl command, include the read_vcd command with the relevant vcd during synthesis.
<img width="567" height="320" alt="Screenshot from 2025-08-07 14-59-03" src="https://github.com/user-attachments/assets/7d0360a6-ed1d-444f-a395-c09b57053370" />


Fig: Instance of a .vcd file generated post simulation

## Observations :

<img width="533" height="109" alt="Screenshot from 2025-08-07 15-20-08" src="https://github.com/user-attachments/assets/975eb5a2-44ae-4bf0-9dac-7d7ffd8fc182" />

## Inference :

- Inferences from the data show that Leakage Power is constant, as it's static. Increasing the clock toggling rate from 5 to 1 time unit (Testbenches 1 vs 2, or 4 vs 5) dramatically increases Internal and Switching Power.

- Using fewer input combinations (Testbench 3 vs 1) slightly reduces power.

- Switching to a Gray Coded input sequence (Testbench 4 vs 1, or 5 vs 2) also yields a minor reduction in dynamic power due to fewer bit transitions. 

- Overall, dynamic power is most sensitive to the clock rate, followed by the input encoding and number of combinations.






   
