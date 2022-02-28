------------------------------------------------------------
-- Testbench for Three-bit wide 4-to-1 multiplexer
-- 24.02.2022
-- Tomas Kristek 230278
------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    signal s_sel       	 : std_logic_vector(2 - 1 downto 0);
    signal s_f         	 : std_logic_vector(3 - 1 downto 0);

begin
    -- Connecting testbench signals with mux_3bit_4to1
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i      => s_a,
            b_i      => s_b,
            c_i      => s_c,
            d_i      => s_d,
            sel_i    => s_sel,
            f_o      => s_f
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
       -- Set one test case and wait 100 ns
       	s_d		<= "010";
        s_c 	<= "011"; 
        s_b 	<= "000"; 
        s_a 	<= "100";
        s_sel 	<= "00";
        wait for 100 ns;
        
        s_d		<= "011";
        s_c 	<= "010"; 
        s_b 	<= "101"; 
        s_a 	<= "001";
        s_sel 	<= "01";
        wait for 100 ns;
        
        s_d		<= "101";
        s_c 	<= "111"; 
        s_b 	<= "110"; 
        s_a 	<= "010";
        s_sel	<= "10";
        wait for 100 ns;
        
        s_d		<= "100";
        s_c 	<= "001"; 
        s_b 	<= "101"; 
        s_a 	<= "110";
        s_sel	<= "11";
        wait for 100 ns;
        wait;
    end process p_stimulus;

end architecture testbench;
