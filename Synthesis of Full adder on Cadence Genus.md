# SYNTHESIS OF FULL ADDER ON CADENCE GENUS
## Objectives : 
- To perfomance Synthesis on a functionally verified RTL in Cadence genus to generate a Mapped Netlist.
- Compare different designs
    - Full Adder using 2 Half Adders (Structural Modelling)
    - Full Adder in data flow modelling
    - Full Adder in Behavioural modelling
- Compare different technologies using libraries for
    - 180nm
    - 90nm
    - 45nm
- Compare different Corners using libraries for
    - Slow corner
    - fast corner
    - Typical corner
- Report Timing, Area and Power for the comparison.

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
   fig: Technology Independent Synthesis Schematic
7. Use the syn_map command to do synthesis using the library we have chosen - Technology dependent Synthesis.
   <img width="912" height="198" alt="Screenshot from 2025-07-24 14-40-43" src="https://github.com/user-attachments/assets/e1934611-db7e-4062-a745-d15bc8cf22bc" />
8. View the Timing report
   
   <img width="912" height="198" alt="Screenshot from 2025-07-24 14-40-43" src="https://github.com/user-attachments/assets/9479ab93-b4d5-4e9b-9422-9910f95a42e1" />
   
10. View the Power report
    
   <img width="758" height="807" alt="Screenshot from 2025-07-24 14-43-32" src="https://github.com/user-attachments/assets/6205ccf7-36ad-40fc-bef4-ddc3e1e55322" />
   
11. View the Area report
    
    <img width="714" height="280" alt="Screenshot from 2025-07-24 14-44-14" src="https://github.com/user-attachments/assets/bfb73a07-7cd4-40b6-8b27-112b82105990" />

12. Capture the Schematic after technology dependent Synthesis.
    <img width="1220" height="647" alt="Screenshot from 2025-07-24 14-46-17" src="https://github.com/user-attachments/assets/17fc5178-cb15-45d7-a00e-f2a276deb40b" />
    fig: Technology dependent Synthesis Schematic




   

   



   


    



