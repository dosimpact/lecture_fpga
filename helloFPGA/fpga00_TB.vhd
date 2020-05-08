entity fpga00_TB is
end fpga00_TB;
    
architecture TestBanch of fpga00_TB is

component fpga00
    port(
        A, B: in bit;
        X : out bit
    );
end component;

signal A : bit:='0';
signal B : bit:='0';
signal X : bit:='0';

begin
    A <= '0', '1' after 100ns, '0' after 300ns, '1' after 400ns;
    B <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns;
    
    U1 : fpga00
    port map(
        A => A,
        B => B,
        X => X
    );
end TestBanch;