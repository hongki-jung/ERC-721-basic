# Klaytn-crypto-youtube-app

## Klaytn app - nft

## 토큰이란? 
일반적으로 보상의 수단으로 지급
- 쿠폰, 도서상품권, 마일리지 등

블록체인에서도 쓸 수 있다.! 
-> 이더리움 중심으로 표준화됨

블록체인 토큰의 종류 in blockchain
Fungible / Non-Fungible

## 1. Fungible 토큰
- 대체가능
- ERC-20 토큰
- 예 : 돈
- 교환 가능, 똑같은 가치를 가진다

## 2. Non - Fungible 토큰
- 대체불가능
- ERC-721 토큰
- 예 : NBA농구 카드
- 교환 불가, 각각의 토큰이 고유한 가치를 지닌다.  


<br />
<br />


## 코인과 토큰의 차이점

## Difference ? 
### 코인 
- 독립된 블록체인 네트워크에서 운영된다
- 표준화되지 않음, 자체 블록체인 네트워크가 필요하다
- 혼자서 만들기에는 무리가 있다

### 토큰 
- 디앱 or 비앱안에서 쓰인다 . 
- 이더리움에서 표준화됨 (Ex. ERC-20, ERC-721).
- 가이드라인을 따라하면 만들기 쉽다.



<br />
<br />


*참고
EOS, QTUM은 예전에 토큰이었으나 
독립된 블록체인 네트워크를 개발하여 코인이 되었다

## 공통점 : 
거래소가 존재하여 사고팔 수 있음 , 가치의 저장, 이전 가능 

<br />
<br />


## 유틸리티 토큰 vs 시큐리티 토큰

*참고
- ICO (Initial Coin Offering)
프로젝트 개발을 위한 자금 모집 —> 유틸리티 토큰 발행

- STO ( Security Token Offering)
프로젝트 개발을 위한 자금 모집 —> 시큐리티 토큰 발행


### 유틸리티 토큰이란?
- bapp내의 상품 또는 서비스를 구매할 수 있는 권리를 가지고 있는 토큰이다 ( Ex. 도토리)
- 수요가 많을수록 가치 상승
- 법적인 규제가 없음
- 투자자들이 보호받지 못함
- 진입장벽이 낮아 신속한 일처리가 가능하고 자율성이 있다

### 시큐리티 토큰이란 (증권형 토큰)?
- 자산을 소유한다는 개념
- 주식과 유사하다
- 이익이 날 때마다 배당금 지급
- 의사결정 —> 블록체인 상에서 투표
- 많이 소유할 수록 더 큰 권한이 생긴다. 
- 회사가치가 오르면 토큰 가치도 상승한다
- 국가마다 다른 법적 규제가 있어서 진입장벽이 높다.



<br />


## EIP ( Ethereum Improvement Proposal ) 란 ?
- 이더리움 개선안 , 
- 유저들이 제안서를 내는 곳(이더리움 생태계 개선을 위한 제안서를 내는 곳)

### 3가지 종류의 EIP
### 1) Standard Track EIP
- 코어
- 네트워킹
- 인터페이스
- ERC (Ethereum Request for comment) : 토큰 표준화 제안 형식
제안 

<br />


### 2) Informational EIP
- 디자인이슈
- 가이드라인 
제안

<br />


### 3) Meta EIP
- 절차
- 개발도구 변경
- 의사 결정 과정 변경 
제안 
 


 
<br />
<br />


** 까먹지 말자

에러 핸들러 : require. revert, assert, try/catch


0.4.22 ~ 0.7.x 
assert : gas를 다 소비한 후, 특정한 조건에 부합하지 않으면 (false일 때) 에러를 발생시킨다. - test용으로 사용
revert : 조건없이 에러를 발생시키고, gas를 환불시켜준다.    - 보통 if문과 같이 사용 
require : 특정한 조건에 부합하지 않으면 에러를 발생시키고 (false일 때), gas를 환불시켜준다. - 중요


0.6버전 이후
try/catch 왜 써야 하는가?
기존의 에러 헨들러 assert/rever/require 는 에러를 발생시키고 프로그램을 끝냄.
그러나 try/catch 문 안에서, assert/ revert/ require을 통해 에러가 난다면 catch는 에러를 잡지 못하고 프로그램을 끝낸다.

어디에 쓰는가?
외부 스마트 컨트랙트 함수를 부를 때, 외부 스마트 컨트랙을 생성할 때, 스마트컨트랙 내에서 함수를 부를 때


0.8.0 포함 x 
0.8.1 ~
assert : 오직 내부적으로 에러테스트 하는 용도. assert가 에러를 발생시키면 , Panic(uint256)이라는 에러타입의 에러 발생




modifier
modifier onlyAdults{

    revert("You are not allowd to pay for the cigarette");
    _;
/}


// SPDX - License-Identifier 목적
1. 라이센서를 명시해줌으로써 스마트컨트랙에 대한 신뢰감을 높일 수 있음
