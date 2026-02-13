-- https://school.programmers.co.kr/learn/courses/30/lessons/59415

SELECT DATETIME AS 시간
FROM ANIMAL_INS
ORDER BY DATETIME DESC
LIMIT 1;


SELECT MAX(DATETIME) AS 시간
FROM ANIMAL_INS;


/*
 시간에 대해,
 MAX 는 최근 시간, MIN 은 제일 오래된 시간
 */