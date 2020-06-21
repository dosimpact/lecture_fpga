# 3 주차

# ASIC CPLD FPGA

```js

1. ASIC  = application-sepcific integrated circuit
사용자의 주문에 맞춤형 반도체 지칭 => 동작속도,면적,소비전력,고성능,경량화 우위
비싸고,생산시간,설계능력 => 단점

2. CPLD = complex programmable logic device
ASIC 과 FPGA 중간 = 많은 게이트를 사용, 비휘발성 기억장치 두 특징을 모두 가진다.

3. FPGA = field programmable Gate Array

프로그래밍가능한 논리 컴포넌트 + 프로그래밍 가능한 내부 연결선으로 구성
논리컴포넌트 ( logic blocks ) : 기본적인 게이트나 좀 더 복잡한 기능을 수행
programmable interconnects (interconnection matrix ) : 브레드보드처럼, 설계자가 원하는 대로 논리 컴포넌트들을 연결하근ㅇ.
-단점 : 전력소비,너무 복잡한 설계 구현 힘듦, ASIC보다 느림
-장점 : 시장에 빠른 출시 및 버그 수정 용이


FPGA 와  CPLD

-FPGA
logic unit : CLB => routing channel 연결
logic step 이 늘수록 logic delay routing delay 증가
범용회로 구현이 어렵고, 용량이 적어 응용범위가 제한된 CPLD | 제작시간 및 비용이 많이 드는 ASIC 의 단점 보완
복잡한 배선 구조로 인하여 routing 효율성과 동작속도면에서 ASIC 단점 보완,
소량 생산 및 ASIC 테스트를 위해 사용


-CPLD
logic unit : Macro cell
다수의 입력을 받아 AND 시키고, OR를 후 F/F를 거쳐 출력한다.
logic unit : 의 규모가 FPGA 에 비해 큼
macro cell 거치는데 소요되는 logic delay가 일정하여 timing 예측에 용이
```

## ASIC = application-specific intergrated circuit ( deprecated )

```
- 사용자의 주문에 맞추어 설계 제작 해주는 반도체를 말함. 아씩
- 장점은, 맞춤형이므로 속도,크기,전력소모,성능이 고도화됨
- 단점은, 비용,시간,설계능력이 많이 소모

- 풀커스텀 > 세미 커스텀 > 프로그래머블 의 단계가 있다.

- 풀커스텀은 소수의 IC만 설계한다. 미리 검증된 논리셀보다 시간적 성능적 비용이 크다.

- 세미 커스텀방식의, Cell-based ASIC 은 표준 논리 셀을 사용한다. | 표준 셀의 배치와 연결을 정의, 표준 셀 라이브러리 구매해야함.

- PLD > Programable Logic Device의 약자 : 제조후에 사용자가 내부 논리회로의 구조를 변경할 수 있는 직접회로이다.
- eg) ROM, FPGA (field programmable Gate Array), 등이 있다.
```
