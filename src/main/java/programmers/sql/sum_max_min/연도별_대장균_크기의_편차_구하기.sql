-- https://school.programmers.co.kr/learn/courses/30/lessons/299310

SELECT *
FROM ECOLI_DATA AS Parent
         JOIN ECOLI_DATA AS Child ON Parent.ID = Child.PARENT_ID;

SELECT MAX(SIZE_OF_COLONY), DATE_FORMAT(DIFFERENTIATION_DATE, '%Y') AS YEAR
FROM ECOLI_DATA
GROUP BY DATE_FORMAT(DIFFERENTIATION_DATE, '%Y');

SELECT DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') AS YEAR ,(MAX_COLONY - SIZE_OF_COLONY) AS YEAR_DEV, E1.ID
FROM ECOLI_DATA AS E1
         JOIN (SELECT MAX(SIZE_OF_COLONY) AS MAX_COLONY, DATE_FORMAT(DIFFERENTIATION_DATE, '%Y') AS YEAR
               FROM ECOLI_DATA
               GROUP BY DIFFERENTIATION_DATE) AS E2 ON DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') = E2.YEAR
WHERE DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') = E2.YEAR
ORDER BY YEAR ASC, YEAR_DEV ASC;

SELECT DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') AS YEAR ,(MAX_COLONY - SIZE_OF_COLONY) AS YEAR_DEV, E1.ID
FROM ECOLI_DATA AS E1
    JOIN (SELECT MAX(SIZE_OF_COLONY) AS MAX_COLONY, DATE_FORMAT(DIFFERENTIATION_DATE, '%Y') AS YEAR
    FROM ECOLI_DATA
    GROUP BY DATE_FORMAT(DIFFERENTIATION_DATE, '%Y')) AS E2 ON DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') = E2.YEAR
WHERE DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') = E2.YEAR
ORDER BY YEAR ASC, YEAR_DEV ASC;

SELECT YEAR(E1.DIFFERENTIATION_DATE) AS YEAR, (E2.MAX_COLONY - E1.SIZE_OF_COLONY) AS YEAR_DEV, E1.ID
FROM ECOLI_DATA AS E1
    JOIN (
    SELECT YEAR (DIFFERENTIATION_DATE) AS YEAR, MAX(SIZE_OF_COLONY) AS MAX_COLONY
    FROM ECOLI_DATA
    GROUP BY YEAR(DIFFERENTIATION_DATE)
    ) AS E2
ON YEAR(E1.DIFFERENTIATION_DATE) = E2.YEAR
ORDER BY YEAR ASC, YEAR_DEV ASC;

/*
 목표는 같은 연도에 가장 큰 대장균 크기 - 각각의 대장균 크기 값을 구하는 것.
 1. 그렇다면 일단 같은 연도에 가장 큰 대장균을 구한 테이블이 필요하다.

 구했다면 이제 구해진 테이블을 대상으로 최대 크기 - 자신의 대장균 크기를 해야한다.
 */

 /*
  YEAR 함수

  YEAR 함수를 생각해내지 못해서 날짜를 문자열로 바꾸면서 연도만 남긴다음 해당 값을 이용해 처리를 시도했다.
  쿼리를 작성해서 실행해보면 눈에 보이는 결과는 기대하던 값과 동일한데 제출 시 오답 처리 된다.
  기대하는 답은 정수였는데 문자열로 제출이 되서 오답 처리된 것으로 예상된다.
  이를 검증하기 위해
  */

SELECT CAST(DATE_FORMAT(E1.DIFFERENTIATION_DATE, '%Y') AS UNSIGNED) AS YEAR,
    (E2.MAX_COLONY - E1.SIZE_OF_COLONY) AS YEAR_DEV,
    E1.ID
FROM ECOLI_DATA AS E1
    JOIN (
    SELECT YEAR (DIFFERENTIATION_DATE) AS YEAR, MAX (SIZE_OF_COLONY) AS MAX_COLONY
    FROM ECOLI_DATA
    GROUP BY YEAR (DIFFERENTIATION_DATE)
    ) AS E2
ON YEAR (E1.DIFFERENTIATION_DATE) = E2.YEAR
ORDER BY YEAR ASC, YEAR_DEV ASC;

/*
 다시 문자열을 숫자로 캐스팅한 결과 정답 처리되었다.
 */

SELECT
    YEAR(DIFFERENTIATION_DATE) AS YEAR,
    (
    MAX(SIZE_OF_COLONY) OVER (PARTITION BY YEAR(DIFFERENTIATION_DATE)) - SIZE_OF_COLONY
    ) AS YEAR_DEV,
    ID
FROM ECOLI_DATA
ORDER BY YEAR ASC, YEAR_DEV ASC;

 /*
서브쿼리 대신 윈도우 함수를 사용할 수 있다.

서브쿼리 풀이는 기존 테이블에 대해 원하는 값들로 이루어진 테이블을 새로 작성하고 그걸 다시 원본 테이블에 조인하는 형태였다.
윈도우함수는 원본 테이블을 대상으로 특정한 그룹을 선언할 수 있고 그 그룹을 대상으로 연산을 수행할 수 있다.

Function(Column) OVER (PARTITION BY GroupColumn ORDER)
Function -> 계산할 내용. SUM, MAX, AVG, RANK, ROW_NUMBER 등
OVER -> 윈도우 함수 키워드
PARTITION BY -> 기능 의미 그대로 파티션을 나눈다는 것. GroupColumn 을 지정하고 그걸 대상으로 파티션을 나눈다
ORDER -> 필요하다면 나누어진 그룹 안에서 순서를 정할 수 있음. 누적 합계나 순위에 주로 이용한다.

이번 문제에서는 분화 날짜의 연도를 대상으로 파티션을 생성했다.
2019년, 2020년, .. 식으로 파티션이 생성될 것이며, GROUP BY 와 다른점은 GROUP BY는 대상을 압축 시킨 다는 것.
샘플 테이블을 대상으로 치자면 2019년, 2020년, 2021년 세 가지로 압축되어 버린다.
파티션은 압축 시키지 않고 해당 행들을 묶어두기만 한다. 2019년 인 행들은 그대로 있지만 2019년이라는 값으로 연관지어져 있는 상태.
파티션을 대상으로 MAX 연산을 수행하면 2019년의 최대값, 2020년의 최대값, .. 을 구할 수 있게 된다.
그 값들을 각 행마다 그대로 붙여준다. 최대값이란 컬럼이 새로 생긴 것.
ID YEAR SIZE MAX_OVER_WINDOW
1  2019 10   50
2  2019 50   50
...

PARTITION BY 없이 OVER 만 단독으로 생성 가능하다. 이 때는 테이블 전체를 하나의 파티션으로 취급한다.
  */