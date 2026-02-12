-- https://school.programmers.co.kr/learn/courses/30/lessons/299307

SELECT ID,
       CASE
           WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
           WHEN SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
           ELSE 'HIGH'
           END AS SIZE
FROM ECOLI_DATA
ORDER BY ASC;

/*
 CASE WHEN THEN 문, ANSI 표준 SQL

 위에서부터 순차적으로 검색을 해나가므로 조건의 앞뒤를 다 안 적어도 된다.

 값의 일치 여부 같은 것도 따질 수 있다.
 CASE BLOOD_TYPE
    WHEN 'A' THEN 'Timidity'
    WHEN 'B' THEN 'Active'
    ELSE 'Unkown'
 END

 SELECT, ORDER BY, GROUP BY, 집계 함수 내
 등 다양한 곳에 쓰인다.
 ELSE 를 생략하면 조건에 안 맞는 행은 NULL 이 된다.
 */

/*
 MySQL 전용 IF()

 IF(조건, 참일 때 값, 거짓일 때 값)
SELECT ID,
       IF(SIZE_OF_COLONY <= 100, 'LOW',
          IF(SIZE_OF_COLONY <= 1000, 'MEDIUM', 'HIGH')
       ) AS SIZE
FROM ECOLI_DATA
 */

