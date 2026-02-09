-- https://school.programmers.co.kr/learn/courses/30/lessons/131120

SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH (DATE_OF_BIRTH) = '03'
  AND TLNO <> 'NULL'
  AND GENDER = 'W'
ORDER BY MEMBER_ID ASC;

SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH (DATE_OF_BIRTH) = 3
  AND TLNO IS NOT NULL
  AND GENDER = 'W'
ORDER BY MEMBER_ID ASC;

SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE DATE_OF_BIRTH LIKE '%-03-%'
  AND TLNO IS NOT NULL
  AND GENDER = 'W'
ORDER BY MEMBER_ID ASC;

/*
 <> 연산자
 다음 데이터와 다른지 체크하는 연산자
 TLNO <> 'NULL' 은 TLNO 의 문자열이 'NULL' 이라는 문자열과 다른지 체크하는 조건이 된다.
 NULL 이라는 문자열과 다른 번호는 모두 조건이 참이 되어 통과된다.

 문제의 의도대로 NULL 을 체크하려면 IS NULL, IS NOT NULL 을 사용해야한다.


 MONTH() 함수
 정수 타입을 반환한다.
 좌변 정수 3, 우변 문자열 '03' 의 비교는 숫자 = 문자열 의 비교지만 DBMS의 암시적 형변환을 통해 작동하기는 한다.
 다만 Java 에서 엄격한 타입 명시를 하기 때문에 여기서도 습관을 일치 시키자. 불필요한 비용도 줄어든다.


 MONTH() 함수와 인덱스
 컬럼이 함수에 감싸져 있어 인덱스를 쓰지 못하고 풀 스캔을 해야만 하는 위험이 있다.

 대신 사용할 만한 문법으로 LIKE '%-03-%' 가 있지만
 이 역시 인덱스를 타려면 앞부분이 고정되어야 한다. ex) LIKE '2022-03-%'

 BETWEEN IN 구문으로 모든 연도를 지정하면 인덱스를 탈 수 있겠지만
 현재 문제에서는 연도가 다양하게 분포되어 있는걸로 보이며 정확한 범위도 알 수 없다.

 (문제 풀이와는 무관하지만)
 따라서 인덱스를 타기 위해서는
 테이블 설계 단계에서 함수 기반 인덱스를 지정해줘야한다.
 ALTER TABLE MEMBER_PROFILE ADD INDEX idx_birth_month ((MONTH(DATE_OF_BIRTH)));
 이렇게 미리 가상의 컬럼을 만들고 인덱스를 지정해주면 쿼리에서 MONTH() 함수를 사용해도 인덱싱이 되어 있기 때문에
 빠른 성능을 기대할 수 있다.

 */