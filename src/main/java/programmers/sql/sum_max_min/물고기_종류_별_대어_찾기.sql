-- https://school.programmers.co.kr/learn/courses/30/lessons/293261

SELECT
FROM FISH_INFO AS Fish
         JOIN FISH_NAME_INFO AS FishName ON Fish.FISH_TYPE = FishName.FISH_TYPE
WHERE 0 0 30 0 bass
1 0 50 0 bass
2 0 40 0 bass
3 1 20 1 snapper
4 1 n  1 snapper


SELECT *
FROM FISH_INFO
WHERE () IN (SELECT MAX(Fish.LENGTH), FishName.FISH_NAME
             FROM FISH_INFO AS Fish
                      JOIN FISH_NAME_INFO AS FishName ON Fish.FISH_TYPE = FishName.FISH_TYPE
             GROUP BY FishName.FISH_NAME)

SELECT FISH_TYPE, LENGTH
FROM FISH_INFO
WHERE

SELECT MAX(Fish.LENGTH), FishName.FISH_NAME
FROM FISH_INFO AS Fish
         JOIN FISH_NAME_INFO AS FishName ON Fish.FISH_TYPE = FishName.FISH_TYPE
GROUP BY FishName.FISH_NAME


SELECT Fish.ID, FishName.FISH_NAME, Fish.LENGTH
FROM FISH_INFO AS Fish
         JOIN FISH_NAME_INFO AS FishName ON Fish.FISH_TYPE = FishName.FISH_TYPE
WHERE (Fish.FISH_TYPE, Fish.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH)
                                        FROM FISH_INFO
                                        GROUP BY FISH_TYPE)
ORDER BY Fish.ID ASC;



-- "물고기 종류(FISH_TYPE)와 길이(LENGTH)를 **쌍(Pair)**으로 묶어서, '종류별 최대 길이 리스트'에 포함되는지(IN) 확인해보세요."1

ID      FISH_TYPE       LENGTH      FISH_NAME
0       0               30          bass
1       0               50          bass
2       0               40          bass
3       1               20          snapper
4       1               null        snapper
5       2               13          anchovy
6       0               60          bass
7       0               55          bass



SELECT Fish.ID, Fishname.FISH_NAME, Fish.LENGTH
FROM FISH_INFO AS Fish
         JOIN FISH_NAME_INFO AS Fishname ON Fish.FISH_TYPE = Fishname.FISH_TYPE
WHERE (Fish.FISH_TYPE, Fish.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH) FROM FISH_INFO GROUP BY FISH_TYPE)
ORDER BY Fish.ID ASC;











