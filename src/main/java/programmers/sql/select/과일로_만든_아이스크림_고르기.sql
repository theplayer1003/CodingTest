-- https://school.programmers.co.kr/learn/courses/30/lessons/133025

SELECT fh.FLAVOR
FROM FIRST_HALF AS fh
         JOIN ICECREAM_INFO AS ii ON fh.FLAVOR = ii.FLAVOR
WHERE ii.INGREDIENT_TYPE = 'fruit_based'
  AND fh.TOTAL_ORDER > 3000
ORDER BY fh.TOTAL_ORDER DESC;