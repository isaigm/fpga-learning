library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter is
  Port (CLK100MHZ : in std_logic;
        activate : out std_logic );
end counter;

architecture Behavioral of counter is
signal cnt: unsigned(31 downto 0) := (others => '0');
begin
 process (CLK100MHZ)
    begin 
        if rising_edge(CLK100MHZ) then
            activate <= '0';
            cnt <= cnt + 1;
            if cnt > 10_000_000 then
                cnt <= (others => '0');
                activate <= '1';
            end if;
        end if;
    end process;
end Behavioral;
