-- ( (c) El Mahrouss Logic 2024, all rights reserved. )
-- ( This file handles the circuit's clock. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY ClockCircuit IS
  PORT (
    outgoing_cpu_clk : OUT STD_LOGIC
  );
END ClockCircuit;

ARCHITECTURE ClockArch OF ClockCircuit IS

  SIGNAL cpu_clk : STD_LOGIC := '0';

BEGIN

  ClockPro : PROCESS
  BEGIN
    cpu_clk <= NOT cpu_clk;
    WAIT FOR 100 ns;
    outgoing_cpu_clk <= cpu_clk;

    IF (cpu_clk = '1') THEN
      REPORT "HT: RISE";
    ELSE
      REPORT "HT: DOWN";
    END IF;
  END PROCESS; -- ClockPro

END ClockArch; -- ClockArch