```
시그널은 모드 없이 선언.
컴포넌트 선언도 엔터티 선언과 유사동일
-end component
-사용:엔터티이름을 연결

컴포넌트 사용
-사용명:컴포넌트 이름
-port map(
	안=>밖,
-port map안에는 ,로 이어줌.

프로세스 사용
-프로세스선언,변수?
-begin
-end process;

if문 사용할때, process 문으로 감싸고 if로 사용될 변수들 미리 선언
if문은 ( ) 을 되도록 쳐주자.

case문을 사용할때도, case에 들어가는 변수를 process 문으로 감싸주어야 한다.
-case s is
-when '0'=>
-when others=>
-null;

하나의 비트는 '0' 이런식
여러개의 비트는 "000" 으로

버퍼는 변수선언에서 모드중 하니이다.
시그널 대신, 버퍼를 이용해서, 입력이자, 출력이자, 임시변수로도 사용이 가능하다.

sdt_logic_vector 는 + 연산이 가능하다.

타입은
type state_type is (s0,s1,s2);

+K)
카운터 = 레지스터 < 미리 정해진 순서대로 상태 전이가 진행>
10진 카운터 = 0~9까지 숫자 반복.
eg) 000 - 001 - 010 - 011 ... 은 3bit를 가지는 2진 카운터, (0~7의 숫자를 가진다고 8진 카운터가 아님.)
카운터는 , 데이터의 흐름을 나타내는곳, 시스템에 필요한 주파수를 생성

병렬 인터페이스 = 여러 데이터라인으로 데이터를 한번에 전송하는 방식
클럭으로 동기화를 해줘야 한다. 전달속도 우수, 다른 라인에 있으면 시간차 발생 > 입력안되는 불상사

SRAM = staic random access memory
```