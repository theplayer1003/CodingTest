-- https://school.programmers.co.kr/learn/courses/30/lessons/273709

SELECT SUM(PRICE) AS TOTAL_PRICE
FROM ITEM_INFO
WHERE RARITY = 'LEGEND'

/*
 SUM 은 조건에 맞는 행이 없으면 0이 아닌 NULL 을 반환한다.

 SELECT COALESCE(SUM(PRICE), 0) AS TOTAL_PRICE
 FROM ITEM_INFO
 WHERE RARITY = 'LEGEND';

 방어적 코딩을 하자.
 */

/*
  커버링 인덱스
  RARITY 에 인덱스가 걸려있으면 물론 성능이 향상되지만,
  (RARITY, PRICE) 로 인덱스가 걸리면 훨씬 빠르다.

  RARITY 인덱스를 탐색해서 LEGEND 구간을 찾고, O(log N)
  인덱스 자체에 이미 PRICE 값이 옆에 붙어 있으므로 테이블을 열 필요가 없어진다.
  인덱스만으로 끝난다.
 */