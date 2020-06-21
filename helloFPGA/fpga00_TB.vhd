ENTITY fpga00_TB IS
END fpga00_TB;

ARCHITECTURE TestBanch OF fpga00_TB IS

    COMPONENT fpga00
        PORT (
            A, B : IN BIT;
            X : OUT BIT
        );
    END COMPONENT;

    SIGNAL A : BIT := '0';
    SIGNAL B : BIT := '0';
    SIGNAL X : BIT := '0';

BEGIN
    A <= '0', '1' AFTER 100ns, '0' AFTER 300ns, '1' AFTER 400ns;
    B <= '0', '1' AFTER 200ns, '0' AFTER 400ns, '1' AFTER 600ns;

    U1 : fpga00
    PORT MAP(
        A => A,
        B => B,
        X => X
    );
END TestBanch;