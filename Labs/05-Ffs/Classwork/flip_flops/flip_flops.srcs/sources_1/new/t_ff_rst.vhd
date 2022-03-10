------------------------------------------------------------
-- Design for T Flip-Flop
-- 10.03.2022
-- Tomas Kristek 230278
------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------
-- Entity declaration T Flip-Flop
------------------------------------------------------------
entity t_ff_rst is
    Port ( clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           t     : in  STD_LOGIC;
           q     : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end t_ff_rst;

------------------------------------------------------------
-- Architecture body for T Flip-Flop
------------------------------------------------------------
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active sync reset,
    -- rising-edge clk.
    -- q(n+1) = t * q_bar + not t * q
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous binary_read
            if (rst = '1') then
                s_q   <= '0';
            elsif (t = '0') then
                s_q   <= s_q;
            else -- t = '1'
                s_q   <= not s_q;
            end if;
        end if;
    end process p_t_ff_rst;
    
    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
