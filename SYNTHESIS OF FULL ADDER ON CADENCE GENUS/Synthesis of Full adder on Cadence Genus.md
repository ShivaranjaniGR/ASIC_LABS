# SYNTHESIS OF FULL ADDER ON CADENCE GENUS
## Objectives : 
- To perfomance Synthesis on a functionally verified RTL in Cadence genus to generate a Mapped Netlist.
- Compare different designs
    - Full Adder using 2 Half Adders (Structural Modelling)
    - Full Adder in data flow modelling
- Compare different clock frequencies of operation.
- Compare different Corners using 180nm Technology libraries for
    - Slow corner
    - fast corner
    - Typical corner
- Report Timing, Area and Power for the comparison.
 ## Theory
 ### Power, Speed and Area :
- for 180nm, area of 2x1 nand gate - area : 9.979200;

<img width="279" height="138" alt="Screenshot from 2025-07-24 15-36-28" src="https://github.com/user-attachments/assets/010a2acf-02f1-46c5-89da-57b9d45e6333" />

therefore, Gate Equivalent area = Total Area/9.979200

- During synthesis, power is estimated without real switching activity, using default toggle rates. (1 toggle per cycle). Therefore, Internal and switching power are approximated based on assumed input activity. However, Leakage power is computed accurately from the standard cell library and PVT conditions.
These estimates help guide early design choices.

-Negative slack occurs when data takes too long to propagate and misses the clock deadline. Increasing the clock frequency reduces the available time per cycle, often causing more negative slack if the logic isn't optimized.

##% PVT Corner Libraries :
In ASIC flows, PVT corner libraries contain timing, power, and noise models for each standard cell under different operating conditions.

| Corner Type | Library Name              | TransistorSpeed(Process)| Voltage | Temperature | Purpose                                   |
| ----------- | ------------------------- | ----------------------- | ------- | ----------- | ----------------------------------------- |
| **Typical** | `typical.lib` or `tt.lib` | Nominal                 | Nominal | 25°C (e.g.) | **Design, synthesis, and functional sim** |
| **Slow**    | `slow.lib` or `ss.lib`    | Slower (weak process)   | Lower   | Higher temp | Worst-case **setup** timing check         |
| **Fast**    | `fast.lib` or `ff.lib`    | Faster (strong process) | Higher  | Lower temp  | Worst-case **hold** timing check          |



 
## Tool flow :
1. Create a folder with verilog files (.v files) and the timing constraints file (.g/.sdc).
2. Open the terminal for working directory and enter the following commands.
   <img width="739" height="373" alt="Screenshot from 2025-07-24 13-38-24" src="https://github.com/user-attachments/assets/f63719d9-b81e-4d6e-ad6b-b167dc71b945" />
3. Obtain the path to the library of choice and set the data base with that library.
   <img width="923" height="171" alt="Screenshot from 2025-07-24 14-06-17" src="https://github.com/user-attachments/assets/97f9c421-2fbd-4c33-a3d3-f7ae0cbf0a36" />
4. Use the read_hdl command and feed the functionally correct HDL files, then elaborate.
   <img width="719" height="258" alt="Screenshot from 2025-07-24 14-10-51" src="https://github.com/user-attachments/assets/8c158ef9-13e7-43b3-aa90-be6a05be97f9" />
5. Input the sdc file for timing using read_sdc command.
   <img width="719" height="110" alt="Screenshot from 2025-07-24 14-14-38" src="https://github.com/user-attachments/assets/0de41575-ae32-404f-84b3-bde950bd818e" />
6. Use the syn_generic command to do technology independent synthesis. Futher, use gui_show command to view the technology independent synthesis schematic.
   <img width="910" height="161" alt="Screenshot from 2025-07-24 14-33-49" src="https://github.com/user-attachments/assets/888c7250-9066-4bc6-87e2-f74c6ade2904" />
   <img width="757" height="110" alt="Screenshot from 2025-07-24 14-34-10" src="https://github.com/user-attachments/assets/29f43075-4413-4cdf-93bb-0c7eb4337068" />
   <img width="1262" height="758" alt="Screenshot from 2025-07-24 14-35-10" src="https://github.com/user-attachments/assets/ba9416df-bf4b-486c-94c2-477bc3a9eab9" />
   <p align="center">fig: Technology independent Synthesis Schematic</p>
7. Use the syn_map command to do synthesis using the chosen library - Technology dependent Synthesis.
   <img width="912" height="198" alt="Screenshot from 2025-07-24 14-40-43" src="https://github.com/user-attachments/assets/e1934611-db7e-4062-a745-d15bc8cf22bc" />
8. View the Timing report
   
   <img width="912" height="198" alt="Screenshot from 2025-07-24 14-40-43" src="https://github.com/user-attachments/assets/9479ab93-b4d5-4e9b-9422-9910f95a42e1" />
   
9. View the Power report
    
   <img width="758" height="807" alt="Screenshot from 2025-07-24 14-43-32" src="https://github.com/user-attachments/assets/6205ccf7-36ad-40fc-bef4-ddc3e1e55322" />
   
10. View the Area report
    
    <img width="714" height="280" alt="Screenshot from 2025-07-24 14-44-14" src="https://github.com/user-attachments/assets/bfb73a07-7cd4-40b6-8b27-112b82105990" />

11. Capture the Schematic after technology dependent Synthesis.
    <img width="1220" height="647" alt="Screenshot from 2025-07-24 14-46-17" src="https://github.com/user-attachments/assets/17fc5178-cb15-45d7-a00e-f2a276deb40b" />
    <p align="center">fig: Technology dependent Synthesis Schematic</p>


## METRICS OF INTEREST
TIMING : CLOCK FREQUENCY, SLACK

POWER : LEAKAGE POWER, INTERNAL POWER, SWITCHING POWER, TOTAL POWER

AREA : CELL AREA, GATE EQUIVALENT AREA

## RESULTS :

For the design of Full adder using 2 half adders , at 180nm the following results were observed.

<img width="1156" height="293" alt="image" src="https://github.com/user-attachments/assets/958051ea-906d-46c6-97d0-411cd4883d35" />


----


For the design of full adder in data flow modelling, at 180nm the following results were observed.

<img width="1098" height="326" alt="image" src="https://github.com/user-attachments/assets/bcc91b63-b948-494c-90f3-61159b8482a8" />


----

# INFERENCES :
- Slack decreases as operating frequency of design increases.
- leakage power is independent of clock frequency but depends on the PVT corners. Leakage power depends on PVT (Process, Voltage, Temperature) corners because faster transistors (fast corner) have lower threshold voltages and leak more, while slower transistors (slow corner) have higher threshold voltages and leak less; temperature and voltage also amplify this effect.
- Across all operating frequencies and PVT corners, the total power is more in the full adder using 2 full adders compared to Behavioural modelling.as it has more logic gates and transitions, leading to higher switching and internal power than the optimized behavioral model.
- Leakage Power is higher at fast corners and will differ between architectures depending on gate count and technology cells used.




   

   
### (area of data flow and using half adders - same)
### (area of behavioural ->335.966)




<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4b89f5ad-5f73-4db2-a762-40be7c8536fd" />

fig: behavioral - full adder


    



