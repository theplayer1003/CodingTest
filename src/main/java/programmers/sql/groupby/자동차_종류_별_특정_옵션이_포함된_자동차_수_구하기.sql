-- https://school.programmers.co.kr/learn/courses/30/lessons/151137

SELECT *
FROM CAR_RENTAL_COMPANY_CAR


SELECT CAR_TYPE, COUNT(CAR_ID) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE FIND_IN_SET('통풍시트', OPTIONS)
   OR FIND_IN_SET('열선시트', OPTIONS)
   OR FIND_IN_SET('가죽시트', OPTIONS)
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE ASC;

/*
 FIND_IN_SET('데이터', 컬럼명)

 ',' 콤마로 구분된 문자열 리스트를 처리할 때 MySQL 환경에서 사용할 수 있는 가장 정확한 함수다.
 substring 으로 찾는게 아니라(가죽시트 -> 최고급가죽시트도 검색됨) 콤마 기준으로 문자열을 토근화하여 정확히 일치하는 단어가 있는지 검색한다.
 다만 MySQL 내장함수 이므로 다른 RDBMS 에서는 문법 에러가 유발된다.
 */

SELECT CAR_TYPE, COUNT(CAR_ID) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE ASC;

/*
  ANSI 표준

 [컬렴명] [연산자] [조건]
 OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
옵션 컬럼명에서 정규식을 통해 매칭되는 값 처리

 OPTIONS LIKE '%가죽시트%' OR OPTIONS LIKE '%열선시트%' OR ...
 문자열 패턴 매칭으로 옵션 필터링. 조건이 늘어날 수록 작성이 힘들어지며,
  컬럼 내용에 따라 앞서 말한 '가죽시트' -> '최고급가죽시트' 도 검색이 되어버리는 토큰 매칭의 한계가 존재한다.
 */