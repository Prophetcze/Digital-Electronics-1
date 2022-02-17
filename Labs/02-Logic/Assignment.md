# Lab 2: Tomas Kristek 230278

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   <img src= "Images/K-map_Greater.JPG" width=30% height=30%>

   Less than:

   <img src= "Images/K-map_Less.JPG" width=20% height=20%>

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   <img src= "Images/Sop_PoS.JPG">

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   My student ID: **230278**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case, 230278 (a = 7, b = 8)
        s_b <= "1000"; s_a <= "0111"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 1000, 0111 FAILED" severity error;

        -- Second test case, (a = 10, b = 4)
        s_b <= "1010"; s_a <= "0100"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 1010, 0100 FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![4-bit Comparator - Log](Images/Log.png)

3. Link to your public EDA Playground example:

   [4-bit Comparator - EDA](https://www.edaplayground.com/x/tmX7)

