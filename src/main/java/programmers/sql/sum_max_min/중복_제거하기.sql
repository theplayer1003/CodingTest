-- https://school.programmers.co.kr/learn/courses/30/lessons/59408

SELECT COUNT(DISTINCT (NAME)) AS COUNT
FROM ANIMAL_INS


SELECT COUNT(DISTINCT NAME) AS COUNT
FROM ANIMAL_INS

/*
 DISTINCT 는 함수가 아니라 키워드 다.
 함수처럼 괄호로 묶어도 알아서 작동하지만 본래 문법대로 중복 제거를 지시하는 수식어로 쓰는게 표준이다.

 함수: 값을 받아 변환하는 기계
 UPPER('abc') -> 'ABC'
 SUBSTR('hello', 1, 2) -> 'he'
 ROUND(3.14519, 2) -> 3.14

 COUNT(ID)
 SUM(PRICE)
 MAX(DATE)

 키워드: 문법을 지시하는 명령어
 SELECT, FROM, WHERE, GROUP BY, ORDER BY
 AND, OR, AS, IN, IS NULL1, DISTINT
 */