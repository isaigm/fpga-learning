
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sleep is
 Port ( 
        CLK100MHZ : in  std_logic; 
        LED       : out std_logic_vector (15 downto 0)
    );
end sleep;

architecture Behavioral of sleep is

component counter is
  Port (CLK100MHZ : in std_logic;
        activate : out std_logic );
end component;
signal activate : std_logic := '0';
signal number : unsigned(15 downto 0) := (others => '0');

begin
    cnt : counter port map(CLK100MHZ => CLK100MHZ, activate => activate);
    process (CLK100MHZ)
    begin 
        if rising_edge(CLK100MHZ) then
            if activate = '1' then
                number <= number + 1;
            end if;
            LED <= std_logic_vector(number);
        end if;
    end process;
end Behavioral;
