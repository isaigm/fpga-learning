
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
signal counter : unsigned(31 downto 0) := (others => '0');
signal number : unsigned(15 downto 0) := (others => '0');
begin
    process (CLK100MHZ)
    begin 
        if rising_edge(CLK100MHZ) then
            counter <= counter + 1;
            if counter > 10_000_000 then
                counter <= (others => '0');
                number <= number + 1;
            end if;
            LED <= std_logic_vector(number);
        end if;
    end process;

end Behavioral;
