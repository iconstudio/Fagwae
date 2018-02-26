Fagwae
==========

### 목차

- [개선](https://github.com/iconstudio/Fagwae#개선)
- [설명](https://github.com/iconstudio/Fagwae#설명)
- [테마](https://github.com/iconstudio/Fagwae#테마)
  - [Shape](https://github.com/iconstudio/Fagwae#shape-도형)
  - [Frame](https://github.com/iconstudio/Fagwae#frame-골자형)
  - [Indeterminate](https://github.com/iconstudio/Fagwae#indeterminate-부정형)
- [플레이어](https://github.com/iconstudio/Fagwae#플레이어)
- [작업 목록](https://github.com/iconstudio/Fagwae#작업-목록)

------

### 개선

 `ZNIQ (Xeronixworks, 김게맛)` 님 께서 2010 년 경에 만들다 중단하셨던 것을 후에 제가 이어받은 게임인 `Fagwae` (파괘) 의 개선판입니다. `GameMaker 8` 로 만들어져 있었기 때문에 호환성과 최적화의 한계가 존재하여 `GameMaker Studio 2` 로 포팅 중입니다.

 단순한 해상도 조절과 재컴파일로 그치는 것이 아닙니다. 더 많은 적, 더 많은 아이템 등의 컨텐츠 개선 역시 있을 예정입니다. 제가 `GameMaker 8` 에서 `GameMaker Studio 1` 로 넘어가는 과도기에 건들지 않았기 때문에, 많은 `GameMaker 8` 의 비호환 함수들을 바꾸지 못하여 고심하던 참에 재사용 가능한 코드는 다시 사용하고 나머지는 새로 작업했습니다.

### 설명

  본 게임은 평범한 슈팅 게임에 가깝습니다만 양산형 게임과는 거리가 있습니다. 탄막 슈팅 게임은 아니고, 고전 레트로 슈팅과 비슷한 점이 많습니다.

 플레이어는 파란 기체를 조종하며 세가지의 테마를 완료해야합니다. 이전 버전에선 4 스테이지와 2회차의 구성, 조잡한 보스, 온갖 적이 뒤섞여서 나오는 난잡한 테마, 폭탄도 부가 화력도 없는 플레이어 화력의 열악함으로 슈팅 게임의 기본 요소도 제대로 갖추지 못했습니다. 새 버전에서는 원래 `Fagwae` 의 멋을 살린 **`Shape`** 테마, 칙칙하고 무거운 **`Frame`** 테마, 마지막으로 불규칙적이고 어려운 **`Indeterminate`** 테마가 선을 보입니다. 이전의 `Fagwae` 는 **`Shape`** 테마와 **`Indeterminate`** 테마의 혼합에 가까웠습니다. 이젠 조금을 빼면 서로 다른 유형의 적들이 각자의 테마에서 출몰합니다.

 보조 무기와 폭탄 역시 추가됩니다. 플레이어는 적을 타격함으로서 피버 게이지를 모으고 추가 콤보 점수를 얻을 수 있습니다. 피버와 함께 폭탄 게이지도 차오릅니다. 폭탄 게이지는 천천히 차오르지만 화면 내 적들과 탄알을 한순간에 뒤집어버리는 강력함을 자랑합니다. 폭탄은 일부 적이나 보스를 잡을 시 주어집니다.

------

### 테마

##### Shape (도형)

`현란한 색과 패턴을 자랑하는 도형들의 테마에 잘 오셨습니다`

 도형들은 방사형 탄막으로 플레이어를 가두는 것을 선호합니다.

##### Frame (골자형)

`파괘 월드를 지지하는 철골들이 무너지기 시작했습니다`

 철골들은 탄을 뿌리기 보다는 직접 몸으로 들이받는 것을 선호합니다.

##### Indeterminate (부정형)

`플레이어의 파괴 행위로 모든 것이 변해버렸습니다`

 이전의 적보다 강화된 적이 등장하며 패턴도 일정치 않습니다.

------

### 플레이어



------

### 작업 목록

- [x] 화면 처리
- [x] 메인 메뉴
      - [ ] 점수 메뉴
      - [x] 도전과제 메뉴
      - [x] 설정 메뉴
- [x] 프로필, 설정 저장
- [x] 기본적 플레이어 구현
- [x] 게임 진행 처리
      - [x] 일시정지
      - [x] 이어하기, 게임 오버
      - [x] 스테이지 용 트리거
      - [x] 입출력 (키보드, 게임 패드)
      - [x] 도전과제 갱신
      - [ ] 점수 갱신
- [ ] 적 구현
      - [ ] `Shape`
            - [x] 일반
            - [ ] 보스
      - [ ] `Frame`
            - [ ] 일반
            - [ ] 보스
      - [ ] `Indeterminate`
            - [ ] 일반
            - [ ] 보스
- [ ] 3 종류의 테마 진행 처리
      - [x] 테마에 따른 배경 전환
      - [ ] 테마에 따라 의도된 이벤트 진행
- [ ] 아이템 구현
- [ ] 플레이어 상세 추가 구현
      - [ ] 몫 습득
      - [ ] 아이템 습득과 강화 효과
      - [ ] 폭탄
- [ ] 6 개의 스테이지 구현
- [ ] 게임 엔딩

------

