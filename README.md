# FPGA 실험

# require env

- quartus + model sim + device 합쳐진 파일 다운로드 및 실행
- Web Edition (무료)

```
https://fpgasoftware.intel.com/13.0/?edition=web


Quartus II Web Edition Software (Device support included)
Quartus-web-13.0.0.156-windows.tar
Size: 4.3 GB MD5: F902840CC880BE903775D3DFA070E0B8

```

# WILL - TODO

- 오퍼레이션 추가 학습 필요 ( 2주차 )

# 2주차 정리

# DataType

- 시그널이름: 모드 타입;

- mode

```js
in : indicates that input signal > 입력
out :  indicates that output signal (only be read) > 출력 및 읽기가능
buffer : indicates that output of the entity whose can be read inside entity architecture > 출력으로도 사용, 그 값을 다시 또 읽고 쓴다면 buffer로 선언
inout : signal can be an input or an output > 출력을 다시 입력으로 쓴다면 선언
```

- type

```js
Bit : 0 and 1
Bit_vector : vector of bit values ( *Binary ) ex) bit_vector(0 to 7)

std_logic, std_ulogic (_vector) : can have 9 values > 0,1,언노운,하이 임피던스, 등등 9가지 값을 사용

Boolean : TRUE or FALSE
Integer :
Real :
Character:

time :

```

# operators

- 비트연산자,대소비교, 쉬프트, 로테이트, 사칙연산 등 지원

# if,case,loop

```js
if () then
    ...
elsif () then
    ...
else
    ...
end if;
```

```js
case latent_space is
    when g =>
        G <= latent_space
    when d =>
        D <= G(latent_space)
end case;
```

```js
loop
    wait until CLK = '1';
    intern_value := (intern_value + 1) mod 32;
    COUNT <= intern_value;
end loop

```

```js
- 라이브러리 선언

  library ieee;
  use ieee.std_logic_1164.all; // ?
  use ieee.std_logic_unsigned.all; // 대수 연산

```

```js
- 포트에 시그널 이름을 정의, mode type 도 정의
entity counter is
port(
	clk : in std_logic; // 1비트, 자료형, 입력
	reset : in std_logic; // 1비트
	enable : in std_logic; // 1ㅣ트
	count : out std_logic_vector(3 downto 0) // 4비트, 자료형, 입력
);
end counter;
```

```js
- clk의 이벤트는 = 라이징엣지 > 일때마다 카운터를 하나씩증가
- 시그널은 = 임의의 변수(신호)를 정의하고 설계에 의해 실행한다.

architecture behav of counter is
signal pre_count: std_logic_vector(3 downto 0);
begin
	process(clk, enable, reset)
	begin
		if reset = '1' then
			pre_count <= "0000";
		elsif (clk='1' and clk'event) then
            if enable = '1' then
                pre_count <= pre_count + "1";
            end if;
        end if
    end process;
    count <= pre_count;
end behave
```

# 3 주차

## ASIC = application-specific intergrated circuit

- 사용자의 주문에 맞추어 설계 제작 해주는 반도체를 말함. 아씩
- 장점은, 맞춤형이므로 속도,크기,전력소모,성능이 고도화됨
- 단점은, 비용,시간,설계능력이 많이 소모

- 풀커스텀 > 세미 커스텀 > 프로그래머블 의 단계가 있다.

- 풀커스텀은 소수의 IC만 설계한다. 미리 검증된 논리셀보다 시간적 성능적 비용이 크다.

- 세미 커스텀방식의, Cell-based ASIC 은 표준 논리 셀을 사용한다. | 표준 셀의 배치와 연결을 정의, 표준 셀 라이브러리 구매해야함.

- PLD > Programable Logic Device의 약자 : 제조후에 사용자가 내부 논리회로의 구조를 변경할 수 있는 직접회로이다.
- eg) ROM, FPGA (field programmable Gate Array), 등이 있다.

# 4 주차

## 1. 간단한 논리 게이트 만들기

- 프로젝트 생성 및 디바이스 셋팅 아래처럼 ( 아니면 auto로 설정)
- Cyclone IV E: EP4CE40F23C8
- 파일이름이랑 엔터티 이름이랑 동일해야 한다.

```c#
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
```

- 문법 오류 검사하기
- 컴파일 하기
- RTL view로 회로 확인하기

## 2. 모델심으로 시뮬레이션 하기

- 임의의 입력값을 준, 코드 작성

```c#
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
```

- 이역시, 문법 오류 확인 및 컴파일하기
- 모델심 프로젝트 생성 및 위 두개 파일 모두 임포트
- 모두 컴파일
- 시뮬레이션 시작 > work > test 코드 실행
- 입력 웨이브 추가
- run 1us // 1초동안 실행시키기

# 5주차

## Half Adder

```c#
ENTITY half_adder IS
PORT(
	A,B:IN BIT;
	S,C:OUT BIT
);
END half_adder;

ARCHITECTURE ADDER OF half_adder IS
BEGIN

PROCESS(A,B)
BEGIN
	IF A=B THEN
		S<='0';
	ELSE
		S<='1';
	END IF;
END PROCESS;

PROCESS(A,B)
BEGIN
	IF A = '1' AND B = '1' THEN
		C<='1';
	ELSE
		C<='0';
	END IF;
END PROCESS;

END ADDER;

```

## Full-Adder

```c#
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity counter is
port(
	clk : in std_logic;
	reset : in std_logic;
	enable : in std_logic;
	count : out ENTITY Full_adder IS
	PORT(
		A,B,CIN:IN BIT;
		S,COUT:OUT BIT
	);
	END Full_adder;

	ARCHITECTURE ADDER OF Full_adder IS
		COMPONENT half_adder IS
		PORT(
		A,B:IN BIT;
		S,C:OUT BIT
		);
		END COMPONENT;

		SIGNAL REG_C1,REG_C2 : BIT;
		SIGNAL REG_SUM : BIT;
	BEGIN
	U1_HA: half_adder
	PORT MAP(
		A=>A,
		B=>B,
		S=> REG_SUM,
		C=>REG_C1
	);

	U2_HA: half_adder
	PORT MAP(
		A=>CIN,
		B=>REG_SUM,
		S=> S,
		C=>REG_C2
	);

	COUT <=REG_C1 OR REG_C2;

	END ADDER;
	(3 downto 0)
);
end counter;


architecture behav of counter is
signal pre_count: std_logic_vector(3 downto 0);
begin
	process(clk, enable, reset)
	begin
		if reset = '1' then
			pre_count <= "0000";
		elsif (clk='1' and clk'event) then
            if enable = '1' then
                pre_count <= pre_count + "1";
            end if;
        end if
    end process;
    count <= pre_count;
end behave
```

## Test

```c#
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TEST IS
END TEST;

ARCHITECTURE ADDER OF TEST IS

COMPONENT Full_adder
PORT(
	A,B,CIN:IN BIT;
	S,COUT:OUT BIT
);
END COMPONENT;

SIGNAL A,B : BIT := '0';
SIGNAL CIN : BIT := '0';
SIGNAL S,COUT : BIT := '0';

BEGIN

A<= '0', '1'AFTER 200NS, '0'AFTER 400NS,
	'1'AFTER 600NS, '0'AFTER 800NS
	, '1'AFTER 1000NS, '0'AFTER 1200NS
	 , '1'AFTER 1400NS;
B<='0', '1'AFTER 400NS, '0'AFTER 800NS,
	'1'AFTER 1200NS;
CIN<= '0', '1'AFTER 800NS;

U_TEST: full_adder
PORT MAP(
	A=>A,
	B=>B,
	CIN=>CIN,
	S=>S,
	COUT=>COUT
);
END ADDER;

```

# 6주차

- Process 문법 덕분에, 동시 실행되는 코드를 막을 수 있다.
