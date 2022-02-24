------------------------------------------------------------
-- Three-bit wide 4-to-1 multiplexer
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
    signal s_sel_i       : std_logic_vector(2 - 1 downto 0);
    signal s_f_o         : std_logic_vector(3 - 1 downto 0);

begin
    -- Connecting testbench signals with mux_3bit_4to1
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i      => s_a,
            b_i      => s_b,
            c_i      => s_c,
            d_i      => s_d,
            sel_i    => s_sel_i,
            f_o      => s_f_o
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
        
        -- Test case
        s_a <= "110"; 
        s_sel_i <= "00"; 
        wait for 100 ns;
        
        -- Expected output
        assert ((s_f_o = "110")
        
        -- If false, then report an error
        report "Input 110 on a FAILED" severity error;
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
    wait;
    end process p_stimulus;

end architecture testbench;
