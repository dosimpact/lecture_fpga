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
