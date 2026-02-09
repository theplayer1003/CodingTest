-- https://school.programmers.co.kr/learn/courses/30/lessons/131118

SELECT ri.REST_ID,
       ri.REST_NAME,
       ri.FOOD_TYPE,
       ri.FAVORITES,
       ri.ADDRESS,
       ROUND(AVG(rr.REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO AS ri
         JOIN REST_REVIEW AS rr ON ri.REST_ID = rr.REST_ID
WHERE ri.ADDRESS LIKE '서울%'
GROUP BY REST_ID
ORDER BY SCORE DESC, ri.FAVORITES DESC;

/*
 GROUP BY 사고 과정
 결과 집합에서 한 행이 무엇을 의미해야하는가?
 -> 식당별 리뷰 평균을 구하라는 문제
 즉, 한 행은 식당을 의미해야한다.
 따라서 식당을 식별할 수 있는 Unique Key,PK 인 REST_ID 로 그룹화 한다.

 SELECT 절에서 컬럼을 선택할 때는 두 가지로 나뉜다.
 기준값과 집계값.
 기준값은 그룹화와 관계 없이 존재할 수 있는 고유 속성들이다.
 여러 리뷰의 존재 여부와 상관없이 식당의 이름은 그대로다. FOOD_TYPE 도 그대로다.

 리뷰 점수는 여러 점수 값을 하나의 결과물로 만들어야 하는 속성이다. 집계값이다.
 */

 /*
  (INNER) JOIN, LEFT JOIN

  RIGHT JOIN도 존재하지만 이는 LEFT JOIN 의 방향이 뒤집혔을 뿐이다.
  A LEFT JOIN B 는 B RIGHT JOIN A 와 같다. 따라서 헷갈리게 둘 다 쓸 필요가 없다. 실제른 항상 LEFT JOIN 만 쓴다.

  INNER JOIN 은 교집합이다. 양쪽 테이블에 모두 존재하는 데이터만 남고 없으면 사라진다.
  이 문제의 경우 리뷰가 없는 식당도 있을 수 있다. 이 식당은 JOIN 결과물에서 사라진다.
  반대로 LEFT JOIN을 걸게 되면 리뷰가 없는 식당은 리뷰가 없는채로, 리뷰 쪽 테이블이 NULL로 채워진채로 JOIN 결과물에 남는다.

  LEFT JOIN 상태로 필터링을 하게 되면 왼쪽의 테이블이 바탕이 되고 오른쪽을 왼쪽에 붙인다. A <- B
  이 과정에서 A 테이블의 행은 모두 존재하며 B 테이블 중에 A 테이블과 매칭 되는게 없으면 해당 컬럼은 NULL 로 채워진다.
  차집합, 리포팅(데이터가 없어도 데이터가 없단걸 표현해야할때) 등에 사용된다.
  */