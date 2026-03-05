-- Gemini

[문제] VIP 고객의 카테고리별 매출 분석
문제 설명
어느 배달 앱의 2026년 1월 주문 내역을 담은 FOOD_ORDERS 테이블입니다.
컬럼은 ORDER_ID(주문 번호), USER_ID(고객 ID), CATEGORY(음식 카테고리),
ORDER_DATE(주문 일자), AMOUNT(결제 금액)로 구성되어 있습니다.

|Column name    |Type           |Nullable|
|ORDER_ID       |VARCHAR(10)    |FALSE   |
|USER_ID        |VARCHAR(10)    |FALSE   |
|CATEGORY|      |VARCHAR(20)    |FALSE   |
|ORDER_DATE     |DATE           |FALSE   |
|AMOUNT         |NUMBER         |FALSE   |

요구사항
2026년 1월 1일부터 2026년 1월 31일 사이에 **총 주문 횟수가 3회 이상인 'VIP 고객'**들을 대상으로,
해당 기간 동안 그들이 주문한 **음식 카테고리별 총 결제 금액(TOTAL_AMOUNT)**을 조회하는 SQL문을 설계해 주세요.
결과는 총 결제 금액을 기준으로 내림차순 정렬되어야 합니다.


/*
 1단계 질문
 최종 출력물의 1행은 어떤 데이터를 의미하는가?
 - 특정 기간 안에 총 주문 횟수가 3회 이상인 사람들을 찾아서,
   특정 기간 동안 그들이 주문한 음식 카테고리별로 총 결제 금액 조회한다.

 따라서 메인 쿼리의 SELECT 대상과 GROUP BY 기준은 무엇이 되어야 하는가?
 - SELECT USER_ID, CATEGORY, SUM(AMOUNT) AS TOTAL_AMOUNT
   GROUP BY (USER_ID, CATEGORY)


 2단계 질문
 문제에서 요구하는 조건들을 분리했을 때, 메인 쿼리의 WHERE 절에서 곧바로 필터링 해야할 조건은 무엇인가?
 - WHERE ORDER_DATE >= '2026-01-01' AND ORDER_DATE <= '2026-01-31'

 총 주문 횟수가 3회 이상인 고객"이라는 조건은 1, 2, 3번
 (원천 데이터 필터링, 식별자 IN 필터링, 파생 테이블 FROM 필터링)
 중 어떤 방식의 서브쿼리로 분리되어야 하며, 그 서브쿼리 내부의 집계 기준은 무엇인가?
 - 2번, 식별자 IN 필터링
 WHERE 절로 기간을 잡고, COUNT(ORDER_ID), GROUP BY USER_ID


 3단계 질문
 -1 어떤 테이블에서
 -2 어떤 조건으로 거르고
 -3 어떤 서브쿼리로 대상을 좁힌 뒤
 -4 무엇으로 그룹화하여
 -5 어떻게 정렬한다.
 */

SELECT CATEGORY, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM FOOD_ORDERS
WHERE ORDER_DATE >= '2026-01-01' AND ORDER_DATE <= '2026-01-31'
AND USER_ID IN (
    SELECT USER_ID
    FROM FOOD_ORDERS
    WHERE ORDER_DATE >= '2026-01-01' AND ORDER_DATE <= '2026-01-31'
    GROUP BY USER_ID
    HAVING COUNT(ORDER_ID) >= 3
    )
GROUP BY CATEGORY
ORDER BY TOTAL_AMOUNT DESC;