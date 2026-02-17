-- https://school.programmers.co.kr/learn/courses/30/lessons/298515

SELECT CONCAT(MAX(LENGTH), 'cm') AS MAX_LENGTH
FROM FISH_INFO

SELECT CONCAT(CAST(MAX(LENGTH) AS CHAR), 'cm') AS MAX_LENGTH
FROM FISH_INFO

SELECT CONCAT(FORMAT(CAST(MAX(LENGTH) AS CHAR), 2), 'cm') AS MAX_LENGTH
FROM FISH_INFO

SELECT CAST(MAX(LENGTH) AS CHAR) || 'cm' AS MAX_LENGTH
FROM FISH_INFO

/*
 암시적 형 변환

 첫번째 쿼리는 MAX 함수에 의해 FLOAT 타입의 결과를 반환한다.
 이후 CONCAT 함수를 실행하기 위해 MySQL 엔진은 내부적으로 FLOAT 타입으로 형변환 후 'cm' 라는 문자열과 합치게 된다.
 일부 엄격한 타입 검사를 수행하는 DBMS 에서는 자동 형변환을 안해줘서 에러 발생의 위험이 있다.

 따라서, SQL 표준으로 권장되는 정석은 CAST 키워드로 명시적으로 형변환을 해주는 것이다.
 */

/*
 부동 소수점 표기

 경우에 따라서 타입이 실수지만 소수점이 생략될 수 있다.
 FLOAT 타입이지만 50.00 은 컴퓨터 입장에서 그냥 50이다. 50으로 저장된다. .00 을 신경쓰지 않는다.
 CAST 는 값만 보존하기 때문에 소수 2자리 표기를 명시하는 FORMAT 함수 등이 필요할 수 있다.
 */