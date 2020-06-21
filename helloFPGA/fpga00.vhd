
ENTITY fpga00 IS
    PORT (
        A, B : IN BIT;
        X : OUT BIT
    );
END fpga00;

ARCHITECTURE HB OF fpga00 IS
BEGIN
    x <= A AND B;
END HB;