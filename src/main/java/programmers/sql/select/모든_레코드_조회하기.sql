-- https://school.programmers.co.kr/learn/courses/30/lessons/59034

SELECT *
FROM ANIMAL_INS;

SELECT *
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;

SELECT ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;


/*
 문제에 순서 보장 조건이 있었다. "모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요."
 이를 놓쳤지만 정답 처리되었다.

 이는 데이터베이스에 데이터가 입력될 때 ANIMAL_ID 순서로 들어갔고 별도의 작업 없이 그대로 저장되어 우연히 순서가 맞은 것이다.
 'Cluster Index 순으로 나왔다' 고 할 수 있다.
 실무에서는 ORDER BY 를 명시하지 않으면 DB 엔진 따라 마음대로, 보통 제일 먼저 읽히는 순서대로 데이터를 내보낼 가능성이 있다.
 순서를 항상 명시해서 처리하자.
 */

 /*
  *, Asterisk 는 안티 패턴으로 취급된다.
  모든 정보를 출력하라는 요구사항이었으니 사용해도 무방하지만 실무에서는 권장되지 않는다.

  실무에서는 항상 딱 필요한 컬럼만 읽도록 해서 불필요한 네트워크 트래픽을 방지해야한다.
  인덱스 부분에서도 손해가 발생한다.
  인덱스는 특정 컬럼만 복사해둔 목차이며 이를 통해 원본 데이터(Table Heap)까지 가지 않고 인덱스만을 읽고 끝낼 수 있는데
  * 는 인덱스 없는 컬럼이 포함되므로 지양한다.

  또, 추후 요구사항 변경에도 취약하다.
  SELECT * 로 작동되는 어떤 기능이 있다고 하면,
  나중에 테이블에 새 컬럼이 추가되면 이 컬럼은 개발 당시의 의도 밖이기 때문에 새로운 데이터를 처리하지 못하고 에러가 날 가능성이 있다.

  모든 데이터를 다 뽑는 요구사항이더라도 직접 컬럼을 명시하는 습관을 들이자.
  */