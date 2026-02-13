-- https://school.programmers.co.kr/learn/courses/30/lessons/131115

SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, MAX(PRICE) AS PRICE
FROM FOOD_PRODUCT;

SELECT *
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);

SELECT *
FROM FOOD_PRODUCT
ORDER BY PRICE DESC LIMIT 1;

/*
 처음엔 MAX 집계를 걸어주면 나머지 컬럼도 그 값을 따라갈거라고 생각해서 쿼리를 작성했다.
 실제로는 값만 최대값이 되고 나머지 컬럼은 MySQL 구현 방식에 의한 비결정적 값이 된다.(Random 무작위 값)
 */

/*
 따라서 최대값이란 조건을 얻기 위해 서브 쿼리를 작성했다.

 얼핏 서브쿼리는 쿼리가 두 번 일어나니까 비효율적이지 않을까? 걱정이 든다.
 인덱스가 없다면 두 쿼리 동안 풀 스캔이 두번 발생한다. O(N) + O(N) = O(N)
 인덱스가 있다면 MAX 값을 위해 트리의 제일 오른쪽 끝으로 가야하며, O(log N)
 PRCIE = 최대값을 위해 이진 탐색을 할수 있따. O(log N)
 O(log N) + O(log N) = O(log N)

 보통 가격, 날짜 등의 필터링 조건에 인덱스를 기본적으로 걸어두는 이유다.
 */

/*
 LIMIT 를 이용해 한번의 쿼리로 끝낼 수도 있다.
 다만 한계점은 만약 최대 값인 행이 여러개라면, 그 중 하나만 출력되기 때문에 의도와 달라질 수 있다.
 */