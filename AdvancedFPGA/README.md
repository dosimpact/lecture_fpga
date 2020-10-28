# 중간고사 정리

# OT

- 30F23C8
- FPGA : Field programmable gate array
- 제작된 후 설계자가 로직을 구성할 수 있는 집적회로
- HDL 를 사용 hardware description lanauge
- 저렴한 HW 시제품 제작 | 프로그래밍 가능 | FPGA 는 ASIC ( application-specific intregrated circuit)

- HBE-combo2 - DLD
- Altera사의 교육용플렛폼 | VHDL 코드로 FPGA 회로 작성 | 입출력 장치 + 임베디드 시스템 체험
- Altera Quartus / Modelsim

# ASIC 및 FPGA 소개

- FPGA : Field programmable gate array = PLD(programmable logic device) + 내부회로가 프로그래밍가능한 반도체 소자.

- 아날로그 : 연속적인 변화를 갖는 데이터 신호 | 디지털 HIGH LOW의 데이터로 이루어진 신호
- 디지털 시스템의 장점
- 1. 쉬운 설계 : 정확한 전류/전압값보단 HIGH/LOW 값만 중요함
- 2. 쉬운 데이터 저장 : 작은 공간에 데이터 유지 및 저장 하는 소자/회로 존재
- 3. 쉬운 정확성 및 정밀도 유지 : 디지털화되면 주변환경에 의해 변화되지 않는다.
- 4. 잡음의 영향을 덜 받음 : HIGH/LOW 값만 중요하므로 데이터 변형이 거의없다.

- 대부분 정보는 아날로그 | 디지털변환시 데이터 손실발생 | 처리과정 시간 요소

- 디지털 회로는 0과1의 전압범위내에서 출력전압이 나오도록 설계됨
- IC 직접회로 ( 대부분의 디지털 회로 ) = 범용 IC와 ASIC으로 분류
- 범용 IC : 많이사용되는 회로를 개발양산
- ASIC : 사용자 요구기능만족 > 특정용도의 IC

- TTL : Transistor Transistor Logic : 다수의 트렌지스터에 의한 논리게이트 구성
- ASIC : application-specific IC : 개발을 업체에 주문하는 형태로 제작
- ASIC의 장점 : 고성능의 작고 경량 | 경쟁력 강화 | 고집적화 | 소형경령화 | 성능향상 | 저전력화 | 시스템기술보호 | 신뢰성
- 단점 : 초기개발비용 | 시간 | 실패 부담 | 수정 어렵 | 수량이적을시 고가

- TODO:
- ASIC = ASSP + ASCP
- ASSP = TTL + COMS + MCU + DSP
- ASCP = FULL custom + semi custom + PLDs
- Semi custom = GateArray + Standard Cell
- PLDs = FGPAs + ..

# MUX,DEMUX

- 데이터 선택 : (data selector) | 데이터 분배 DEMUX
- 조합논리회로 - 논리곱 AND + 논리합 OR + 논리부정 NOT, 출력은 입력에의해 결정
- 논리게이트로만 구성 , 플립플롭같은 기억소자 포함 X
- Encoder/decoder/MUX/DEMUX

- 4 to 1 Mux | data selector | 7세그먼트 ( 데이터입력이 없지만 내부 시그널변수 있다.)
- 1 to 4 DeMux |
- 8 Array 7 segment | 7 개의 획으로 숫자,문자를 보여줌 | FND(flexible Numberic Display)
-

# FLIP FLOP

# Register
