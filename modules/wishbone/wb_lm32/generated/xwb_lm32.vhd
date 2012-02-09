--auto-generated by gen_lmcores.py. Don't hand-edit please
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wishbone_pkg.all;
entity xwb_lm32 is
generic(g_profile: string);
port(
clk_sys_i : in  std_logic;
rst_n_i : in  std_logic;
irq_i : in  std_logic_vector(31 downto 0);
dwb_o  : out t_wishbone_master_out;
dwb_i  : in  t_wishbone_master_in;
iwb_o  : out t_wishbone_master_out;
iwb_i  : in  t_wishbone_master_in);
end xwb_lm32;
architecture rtl of xwb_lm32 is 
function f_eval_i_burst_length(profile_name:string) return natural is
begin
if profile_name = "minimal" then return 1; end if; 
if profile_name = "medium" then return 1; end if; 
if profile_name = "medium_icache" then return 4; end if; 
if profile_name = "medium_debug" then return 4; end if; 
if profile_name = "medium_icache_debug" then return 4; end if; 
if profile_name = "full" then return 4; end if; 
if profile_name = "full_debug" then return 4; end if; 
return 0;
end function;
function f_eval_d_burst_length(profile_name:string) return natural is
begin
if profile_name = "minimal" then return 1; end if; 
if profile_name = "medium" then return 1; end if; 
if profile_name = "medium_icache" then return 1; end if; 
if profile_name = "medium_debug" then return 1; end if; 
if profile_name = "medium_icache_debug" then return 1; end if; 
if profile_name = "full" then return 4; end if; 
if profile_name = "full_debug" then return 4; end if; 
return 0;
end function;
component lm32_top_minimal is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_medium is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_medium_icache is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_medium_debug is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_medium_icache_debug is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_full is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;
component lm32_top_full_debug is port (
 
  clk_i    : in  std_logic;
  rst_i    : in  std_logic;
  interrupt  : in  std_logic_vector(31 downto 0);
  I_DAT_I  : in  std_logic_vector(31 downto 0);
  I_ACK_I  : in  std_logic;
  I_ERR_I  : in  std_logic;
  I_RTY_I  : in  std_logic;
   D_DAT_I  : in  std_logic_vector(31 downto 0);
   D_ACK_I  : in  std_logic;
   D_ERR_I  : in  std_logic;
   D_RTY_I  : in  std_logic;
   I_DAT_O  : out std_logic_vector(31 downto 0);
   I_ADR_O  : out std_logic_vector(31 downto 0);
   I_CYC_O  : out std_logic;
   I_SEL_O  : out std_logic_vector(3 downto 0);
   I_STB_O  : out std_logic;
   I_WE_O   : out std_logic;
   I_CTI_O  : out std_logic_vector(2 downto 0);
   I_LOCK_O : out std_logic;
   I_BTE_O  : out std_logic_vector(1 downto 0);
   D_DAT_O  : out std_logic_vector(31 downto 0);
   D_ADR_O  : out std_logic_vector(31 downto 0);
   D_CYC_O  : out std_logic;
   D_SEL_O  : out std_logic_vector(3 downto 0);
   D_STB_O  : out std_logic;
   D_WE_O   : out std_logic;
   D_CTI_O  : out std_logic_vector(2 downto 0);
   D_LOCK_O : out std_logic;
   D_BTE_O  : out std_logic_vector(1 downto 0));
end component;

  function pick(first : boolean;
                 a, b  : t_wishbone_address)
      return t_wishbone_address is
   begin
      if first then
         return a;
      else
         return b;
      end if;
   end pick;
   
   function b2l(val : boolean)
      return std_logic is
   begin
      if val then 
         return '1';
      else
         return '0';
      end if;
   end b2l;

 function strip_undefined
    (x           : std_logic_vector) return std_logic_vector is
    variable tmp : std_logic_vector(x'left downto 0);
  begin
    for i  in 0 to x'left loop
      if(x(i)='X' or x(i)='U' or x(i)='Z') then
        tmp(i) := '0';
      else
        tmp(i) := x(i);
      end if;
    end loop;  -- i
    return tmp;
  end strip_undefined;
   
   constant dcache_burst_length : natural := f_eval_d_burst_length(g_profile);
   constant icache_burst_length : natural := f_eval_i_burst_length(g_profile);
   
   -- Control pins from the LM32
   signal I_ADR : t_wishbone_address;
   signal D_ADR : t_wishbone_address;
   signal I_CYC : std_logic;
   signal D_CYC : std_logic;
   signal I_CTI : t_wishbone_cycle_type;
   signal D_CTI : t_wishbone_cycle_type;
   -- We also watch the STALL lines from the v4 slaves
   
   -- Registered logic:
   signal inst_was_busy : std_logic;
   signal data_was_busy : std_logic;
   signal inst_addr_reg : t_wishbone_address;
   signal data_addr_reg : t_wishbone_address;
   signal inst_remaining : natural range 0 to icache_burst_length;
   signal data_remaining : natural range 0 to dcache_burst_length;
   
   -- Asynchronous logic:
   signal I_STB_O : std_logic;
   signal D_STB_O : std_logic;
   signal rst:std_logic;
begin
		rst <= not rst_n_i;
gen_profile_minimal: if (g_profile = "minimal") generate
U_Wrapped_LM32: lm32_top_minimal

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_minimal;
gen_profile_medium: if (g_profile = "medium") generate
U_Wrapped_LM32: lm32_top_medium

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_medium;
gen_profile_medium_icache: if (g_profile = "medium_icache") generate
U_Wrapped_LM32: lm32_top_medium_icache

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_medium_icache;
gen_profile_medium_debug: if (g_profile = "medium_debug") generate
U_Wrapped_LM32: lm32_top_medium_debug

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_medium_debug;
gen_profile_medium_icache_debug: if (g_profile = "medium_icache_debug") generate
U_Wrapped_LM32: lm32_top_medium_icache_debug

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_medium_icache_debug;
gen_profile_full: if (g_profile = "full") generate
U_Wrapped_LM32: lm32_top_full

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_full;
gen_profile_full_debug: if (g_profile = "full_debug") generate
U_Wrapped_LM32: lm32_top_full_debug

port map(
      clk_i	=> clk_sys_i,
      rst_i	=> rst,
      interrupt	=> irq_i,
      -- Pass slave responses through unmodified
      I_DAT_I	=> strip_undefined(iwb_i.DAT),
      I_ACK_I	=> iwb_i.ACK,
      I_ERR_I	=> iwb_i.ERR,
      I_RTY_I	=> iwb_i.RTY,
      D_DAT_I	=> strip_undefined(dwb_i.DAT),
      D_ACK_I	=> dwb_i.ACK,
      D_ERR_I	=> dwb_i.ERR,
      D_RTY_I	=> dwb_i.RTY,
      -- Writes can only happen as a single cycle
      I_DAT_O	=> iwb_o.DAT,
      D_DAT_O	=> dwb_o.DAT,
      I_WE_O	=> iwb_o.WE,
      D_WE_O	=> dwb_o.WE,
      -- SEL /= 1111 only for single cycles
      I_SEL_O	=> iwb_o.SEL,
      D_SEL_O	=> dwb_o.SEL,
      -- We can ignore BTE as we know it's always linear burst mode
      I_BTE_O	=> open,
      D_BTE_O	=> open,
      -- Lock is never flagged by LM32. Besides, WBv4 locks intercon on CYC.
      I_LOCK_O	=> open,
      D_LOCK_O	=> open,
      -- The LM32 has STB=CYC always
      I_STB_O	=> open,
      D_STB_O	=> open,
      -- We monitor these pins to direct the adapter's logic
      I_ADR_O	=> I_ADR,
      I_CYC_O	=> I_CYC,
      I_CTI_O	=> I_CTI,
      D_ADR_O	=> D_ADR,
      D_CYC_O	=> D_CYC,
      D_CTI_O	=> D_CTI);
end generate gen_profile_full_debug;

   -- Cycle durations always match in our adapter
   iwb_o.CYC <= I_CYC;
   dwb_o.CYC <= D_CYC;
   
   iwb_o.STB <= I_STB_O;
   dwb_o.STB <= D_STB_O;
   
   I_STB_O <= (I_CYC and not inst_was_busy) or b2l(inst_remaining /= 0);
   inst : process(clk_sys_i)
      variable inst_addr : t_wishbone_address;
      variable inst_length : natural;
   begin
      if rising_edge(clk_sys_i) then
         if rst = '1' then
            inst_was_busy <= '0';
            inst_remaining <= 0;
            inst_addr_reg <= (others => '0');
         else
            inst_was_busy <= I_CYC;
            
            -- Is this the start of a new WB cycle?
            if I_CYC = '1' and inst_was_busy = '0' then
               inst_addr := I_ADR;
               if I_CTI = "010" then
                  inst_length := icache_burst_length;
               else
                  inst_length := 1;
               end if;
            else
               inst_addr := inst_addr_reg;
               inst_length := inst_remaining;
            end if;
            
            -- When stalled, we cannot advance the address
            if iwb_i.STALL = '0' and I_STB_O = '1' then
               inst_addr_reg  <= std_logic_vector(unsigned(inst_addr) + 4);
               inst_remaining <= inst_length - 1;
            else
               inst_addr_reg  <= inst_addr;
               inst_remaining <= inst_length;
            end if;
         end if;
      end if;
   end process;
   
   D_STB_O <= (D_CYC and not data_was_busy) or b2l(data_remaining /= 0);
   data : process(clk_sys_i)
      variable data_addr : t_wishbone_address;
      variable data_length : natural;
   begin
      if rising_edge(clk_sys_i) then
         if rst = '1' then
            data_was_busy <= '0';
            data_remaining <= 0;
            data_addr_reg <= (others => '0');
         else
            data_was_busy <= D_CYC;
            
            -- Is this the start of a new WB cycle?
            if D_CYC = '1' and data_was_busy = '0' then
               data_addr := D_ADR;
               if D_CTI = "010" then
                  data_length := dcache_burst_length;
               else
                  data_length := 1;
               end if;
            else
               data_addr := data_addr_reg;
               data_length := data_remaining;
            end if;
            
            -- When stalled, we cannot advance the address
            if dwb_i.STALL = '0' and D_STB_O = '1' then
               data_addr_reg  <= std_logic_vector(unsigned(data_addr) + 4);
               data_remaining <= data_length - 1;
            else
               data_addr_reg  <= data_addr;
               data_remaining <= data_length;
            end if;
         end if;
      end if;
   end process;
   
   -- The first request uses the WBv3 address, thereafter an incrementing one.
   dwb_o.ADR <= pick(data_was_busy = '0', D_ADR, data_addr_reg);
   iwb_o.ADR <= pick(inst_was_busy = '0', I_ADR, inst_addr_reg);
	end rtl;
