library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity push_btn is
    Port ( 
        CLK100MHZ : in  std_logic; 
        btnR      : in  std_logic; 
        LED       : out std_logic_vector (15 downto 0)
    );
end push_btn;

architecture Behavioral of push_btn is
    signal number   : unsigned (15 downto 0) := (others => '0');
    signal btn_reg  : std_logic := '0'; 
    signal btn_sync : std_logic := '0'; 
begin

    process (CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            
            btn_sync <= btnR;
            btn_reg  <= btn_sync;
            
            if btn_sync = '1' and btn_reg = '0' then
                number <= number + 1;
            end if;
        end if;
    end process;

    LED <= std_logic_vector(number);

end Behavioral;