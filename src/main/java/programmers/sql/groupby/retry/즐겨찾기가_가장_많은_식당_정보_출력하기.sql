-- https://school.programmers.co.kr/learn/courses/30/lessons/131123

SELECT FOOD_TYPE,
       REST_ID,
       REST_NAME,
       FAVORITES
FROM (SELECT FOOD_TYPE,
             REST_ID,
             REST_NAME,
             FAVORITES,
             RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rnk
      FROM REST_INFO) AS Ranked
WHERE rnk = 1
ORDER BY FOOD_TYPE DESC;

SELECT FOOD_TYPE,
       REST_ID,
       REST_NAME,
       FAVORITES
FROM REST_INFO
WHERE (FAVORITES, FOOD_TYPE) IN (SELECT MAX(FAVORITES),
--WHERE (FOOD_TYPE, FAVORITES) IN (SELECT MAX(FAVORITES),
                                        FOOD_TYPE
                                 FROM REST_INFO
                                 GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;

/*
 IN 을 활용한 풀이에서 WHERE 절의 컬럼 순서와 서브쿼리의 커럶 순서가 맞지 않아 오답 처리 되었다.
 순서를 맞춰줘야한다.

 SQL 엔진은 (A, B) IN (SELECT X, Y ...) 구문을 처리할 때
 1. A와 X 를 비교
 2. B와 Y 를 비교
 3. 두 조건이 모두 맞는 행 찾기
 순으로 돌아간다.

 처음 시도처럼 컬럼 순서를 뒤집어서 써주면 하나도 맞는 데이터가 없어서 공백으로 출력된다.

 처음 기대 처럼 알아서 비교해준다면 편하겠지만,
 SQL 표준은 위치를 기준으로 삼는다.
 그렇지 않다면 별칭에 관한 처리가 불확실해진다.
 또 위치 기반으로 첫번째는 첫번째, 두번째는 두번째 비교하는게 성능상 유리하다.
 */