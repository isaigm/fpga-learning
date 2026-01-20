
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sleep is
    generic(N: integer := 5); 
    Port (
        CLK100MHZ : in  std_logic; 
        LED       : out std_logic_vector (N - 1 downto 0)
        );
end sleep;

architecture Behavioral of sleep is
function maxNumber (nbits : integer) return integer is
    variable i : integer;
    variable max : unsigned(N downto 0) := to_unsigned(1, N + 1);
    begin
        return to_integer(shift_left(max, N) - 1);
end function;
component counter is
  Port (CLK100MHZ : in std_logic;
        activate : out std_logic );
end component;
signal activate : std_logic := '0';
signal number : unsigned(N - 1 downto 0) := (others => '0');
signal max: unsigned (N - 1 downto 0) := to_unsigned(maxNumber(N), N);
begin
    cnt : counter port map(CLK100MHZ => CLK100MHZ, activate => activate);
    process (CLK100MHZ)
    begin 
        if rising_edge(CLK100MHZ) then
            if activate = '1' then
                number <= number + 1;
            end if;
            if number > max then
                number <= (others => '0');
            end if;
            LED <= std_logic_vector(number);
        end if;
    end process;
end Behavioral;
