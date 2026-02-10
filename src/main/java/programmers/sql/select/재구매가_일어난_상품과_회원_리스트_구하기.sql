-- https://school.programmers.co.kr/learn/courses/30/lessons/131536

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID ASC, PRODUCT_ID DESC;

/*
 GROUP BY 절
 기준되는 열 들을 잡아 가상의 분류 바구니를 생성한다.
 USER_ID, PRODUCT_ID 가 기준점이 된다면,
 1, 3 -> A 바구니
 1, 3 -> A 바구니
 1, 2 -> B 바구니
 2, 1 -> C 바구니

 말하자면 열에 기준에 따라 태그 딱지가 하나씩 붙는 것.

 HAVING 절
 현재 문맥을 대상으로 조건을 검사한다.
 GROUP BY 절을 지나며 문맥이 그룹별로 나뉘었기 때문에 A 그룹의 전체 개수가 몇 개인지, B 그룹의 전체 개수가 몇 개인지, ...
 검사해서 2 이상인 그룹만 남긴다.
 */

 /*
  쿼리 실행 순서
  1. FROM, 테이블 불러오기, context: 전체 데이터
  2. WHERE, 행에 조건 걸기, context: 필터링된 개별 행들
  3. GROUP BY, 개별 행들을 그룹화 하기
  4. HAVING, 그룹에 조건 걸기
  5. SELECT, 여기까지 정리된 테이블에서 결과를 뽑음
  6. ORDER BY, 정렬
  7. LIMIT, 최종적으로 출력할 행의 개수를 제한
  */