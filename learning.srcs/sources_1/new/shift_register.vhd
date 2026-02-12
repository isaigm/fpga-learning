library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity shift_register is
    Port ( CLK100MHZ: in std_logic; 
           LED: out std_logic_vector(15 downto 0));
end shift_register;

architecture Behavioral of shift_register is
signal reg: std_logic_vector(15 downto  0) := "0000000000000001";
signal counter: unsigned(31 downto 0) := (others => '0');
begin
    process(CLK100MHZ)
    begin 
        if rising_edge(CLK100MHZ) then
            if counter = x"2FAF080" then
                counter <= (others => '0');
                for i in 1 to 15 loop
				    reg(i) <= reg(i - 1);
			    end loop;
			    reg(0) <= reg(15);
            else 
                counter <= counter + 1;
            end if;
        end if;
    end process;
    LED <= reg;

end Behavioral;
