-- https://school.programmers.co.kr/learn/courses/30/lessons/59037

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged'
ORDER BY ANIMAL_ID ASC;

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION <> 'Aged'
ORDER BY ANIMAL_ID ASC;

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NOT INTAKE_CONDITION = 'Aged'
ORDER BY ANIMAL_ID ASC;

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION IN ('Normal', 'Injured', 'Sick')
ORDER BY ANIMAL_ID ASC;

/*
 != 는 대부분의 DBMS 가 지원하지만 <> 가 ANSI 표준이다.
 */

/*
 NOT 은 부정 연산으로 != 와 동일하다.
 뒤에 따라오는 조건의 진리값을 뒤집는다.
 옵티마이저가 똑같이 처리하기 때문에 둘의 성능 차이는 없다.
 */

/*
 만약 해당 컬럼이 인덱스가 되어 있다면 부정 검사를 긍정으로 바꾸는게 좋다.
 부정 검사는 모든 테이블의 행을 돌면서 조건을 검사해야만 한다. 풀 스캔이 필연적이다.
 해당 컬럼의 모든 데이터를 확인 가능하다면 긍정 검사로 바꿔 인덱스를 타고 빠른 처리가 가능하다.
 */

/*
 마지막 쿼리는 오답처리된다.
 SELECT DISTINCT INTAKE_CONDITION FROM ANIMAL_INS;
 로 검색해보아도 상태 값은 4개가 맞지만, 문제 링크에 걸린 데이터 제공처에 들어가보면 다른 상태값이 존재함을 알 수 있다.
 샘플 데이터와 실제 채점 데이터가 다른걸로 추정된다.

 앞서 인덱스 관점에서 부정연산 대신 긍정 연산을 쓰고자 했지만,
 이런 관점에서는 부정 연산이 견고하며, 유지보수성을 확보할 수 있음을 알 수 있다.
 부정 연산이었다면 추후 어떤 상태 데이터가 추가되던 간에 작성 당시의 논리가 깨지지 않는다.
 긍정 연산의 경우 새로 생긴 상태 데이터에 의해 쿼리를 수정할 필요가 생긴다.
 */

/*
 그렇다면 인덱스도 쓸 수 있으면서 추후 데이터 변화에 의해 논리가 깨지지 않는 방법은 없을까?
 SQL 만으로는 어렵다. 데이터 모델링이나 아키텍처 쪽으로 가야한다.

 1. 플래그 컬럼 추가, Boolean 같은 인덱스 효율 좋은 컬럼을 추가해서 판단

 2. MySQL 5.7+, Generated Column
 파생 컬럼 기능. 물리적인 컬럼 추가가 아닌 논리적인 가상 컬럼을 만들고 인덱스를 걸 수 있다.

 3. 애플리케이션 레벨의 동적 쿼리
 Java/Spring 쪽에서 처리하는 방법.
 메타데이터 캐싱, 로직 처리, 쿼리 생성 등

 추후 공부 필요
 */