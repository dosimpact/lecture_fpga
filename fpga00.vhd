
entity fpga00 is
    port(
        A, B: in bit;
        X : out bit
    );
    end fpga00;
    
    architecture HB of fpga00 is
    begin
    x <= A AND B;
    end HB;