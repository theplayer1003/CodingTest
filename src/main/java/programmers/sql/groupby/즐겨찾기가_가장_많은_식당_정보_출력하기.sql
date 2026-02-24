-- https://school.programmers.co.kr/learn/courses/30/lessons/131123

SELECT FOOD_TYPE, MAX(FAVORITES)
FROM REST_INFO
GROUP BY FOOD_TYPE, FAVORITES


SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES)
                                 FROM REST_INFO
                                 GROUP BY FOOD_TYPE)
GROUP BY FOOD_TYPE
ORDER BY FOOD_TYPE DESC;



SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES)
                                 FROM REST_INFO
                                 GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;


SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM (SELECT FOOD_TYPE,
             REST_ID,
             REST_NAME,
             FAVORITES,
             RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rnk
      FROM REST_INFO) AS RankedRest
WHERE rnk = 1
ORDER BY FOOD_TYPE DESC;

/*
 윈도우 함수는 ANSI 표준 SQL 문이다.
 */

/*
 서브쿼리에서 실수한 부분은 바깥 쿼리에서 다시 GROUP BY 를 걸었단 점.
그럴 필요가 없다.
 왜냐하면 이미 내부 쿼리에서 FOOD_TYPE으로 그룹 지어진 MAX 값이 있다.
 하나의 값이다. 이제 바깥 쿼리에서 이것과 매칭되는 행을 찾을거기 때문에 자동으로 FOOD_TYPE 으로 그룹화 된다.
 한식 - 734
 일식 - 230
 양식 - 102
 등

 이 테이블과 새 원본 테이블을 대조하기 때문에 카테고리의 최대 값인 행만 잡히며 이는 자동으로 GROUP BY FOOD_TYPE
 을 수행한것과 같다.
 */

/*
 윈도우 함수 사용 풀이

 윈도우 함수를 통해 FOOD_TYPE 으로 파티션을 나눈다. 이후 ORDER BY 절로 좋아요 기준으로 내림차순을 두면
 제일 위에 있는 행이 좋아요 수가 제일 많은 가게가 된다. 마지막으로 RANK() 집계 함수로 rnk 라는 새로운 컬럼에
 등수를 매겨둔다.
 이후 바깥 쿼리에서 rnk 컬럼이 1인 행만 찾아내면 목표하는 데이터만 뽑을 수 있게 된다.

 앞서 IN 서브쿼리를 통한 방식과 비교해보자면
 전자는 확장성에서 불리하다.
 비즈니스 요구사항이 1위 식당이 아니라 1위부터 3위 식당으로 변경된다면 전자는 처리가 매우 어렵지만
 후자는 WHERE rnk <= 3 으로 조건을 바꿔주기만 하면 된다.
 또 윈도우 함수는 메모리 상의 파티셔닝과 정렬을 한 번의 스캔으로 처리하도록 잘 최적화되어 있어 대용량 데이터를 다룰 때 선호된다.
 */

WITH RankedRest AS (SELECT FOOD_TYPE,
                           REST_ID,
                           REST_NAME,
                           RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rnk
                    FROM REST_INFO)

SELECT FOOD_TYPE,
       REST_ID,
       REST_NAME,
       FAVORTIES
FROM RankedRest
WHERE rnk = 1
ORDER BY FOOD_TYPE DESC;

/*
 CTE: 공통 테이블 식
 WITH 절을 통해 복잡한 쿼리를 구조화하고 가독성을 높이는 쿼리. 일시적으로 명명된 결과 집합을 만든다.
 서브쿼리와 달리 쿼리 내에서 재사용이 가능하며, 계층 구조 데이터 처리를 위한 재귀 쿼리 작성에도 매우 강력하다.
 */