-- https://school.programmers.co.kr/learn/courses/30/lessons/301649

SELECT ID,
       CASE
           WHEN PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) <= 0.25 THEN 'CRITICAL'
           WHEN PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) <= 0.50 THEN 'HIGH'
           WHEN PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) <= 0.75 THEN 'MEDIUM'
           ELSE 'LOW'
           END
           AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID ASC;


/*
 CTE, Common Table Expression, WITH 절

 WITH RankedEcoli AS (
    SELECT
        ID,
        PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PER_RANK
    FROM ECOLI_DATA
)
SELECT
    ID,
    CASE
        WHEN PER_RANK <= 0.25 THEN 'CRITICAL'
        WHEN PER_RANK <= 0.50 THEN 'HIGH'
        WHEN PER_RANK <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM RankedEcoli
ORDER BY ID ASC;

 말하자면 임시 변수 선언 같은 것. 일회용 임시 테이블을 선언하고 중복되는 부분을 대체.
 */

/*
 NTILE, N 등분 함수

 SELECT ID,
       CASE NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC)
           WHEN 1 THEN 'CRITICAL'  -- 1번 그룹 (상위 25%)
           WHEN 2 THEN 'HIGH'      -- 2번 그룹 (25~50%)
           WHEN 3 THEN 'MEDIUM'    -- 3번 그룹 (50~75%)
           WHEN 4 THEN 'LOW'       -- 4번 그룹 (하위 25%)
       END AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID ASC;
 */
