-- https://school.programmers.co.kr/learn/courses/30/lessons/157340

SELECT History.CAR_ID, MAX(
        CASE
            WHEN (START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16') THEN '대여중'
            ELSE '대여 가능'
            END
                       ) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS History
GROUP BY History.CAR_ID
ORDER BY CAR_ID DESC;

SELECT CAR_ID,
       CASE
           WHEN MAX(IS_RENTED) = 1 THEN '대여중'
           ELSE '대여 가능'
           END AS AVAILABILITY
FROM (SELECT CAR_ID,
             CASE
                 WHEN (START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16') THEN 1
                 ELSE 0
                 END AS IS_RENTED
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) AS Sub
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;


SELECT CAR_ID,
       CASE WHEN MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN 1 ELSE 0 END) = 1
               THEN '대여중'
           ELSE '대여 가능'
           END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;

/*
 서브쿼리 풀이

 날짜 조건을 검색해서 라벨링한 후 해당 쿼리를 서브쿼리로 하여 컬럼에 이름을 지어주자
 테이블을 2번 스캔하기 때문에 비용에서 손해를 본다
 */

/*
 FROM & JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

 쿼리를 순서대로 분석하는 연습을 하자.
 조건부 집계 쿼리를 순서대로 읽어보면,

 FROM 절로 테이블을 읽는다. JOIN 은 없으니 생략.
 WHERE 절이 없으니 생략.
 GROUP BY 를 통해 CAR_ID 기준으로 데이터를 쪼개서 가상의 그룹 테이블(Bucket) 을 생성한다.
 예를 들어 29번 차만 모인 테이블이 생긴다.
 HAVING 절이 없으니 생략.
 SELECT 절에서 집계 및 연산을 한다.
 안쪽 CASE 문을 보면 목표로 하는 날짜 '2022-10-16' 이 시작 날짜와 끝 날짜 사이에 있는지 체크한다. 맞다면 1 아니면 0 으로 라벨을 붙인다.
 그 결과에 대해 MAX 함수를 사용하니 최종적으로 1인 값(참인 값) 만 남는다.
 바깥 CASE 문에서 안쪽 CASE 문의 결과 중 참 인것을 대상으로 '대여중' 라벨을 붙인다.
 그 외의 것들은 '대여 가능' 이라는 라벨을 붙이고 최종 컬럼 명을 붙인다.
 ORDER BY 절로 정렬한다.
 LIMIT 는 없으니 모든 행을 출력한다.
 */

