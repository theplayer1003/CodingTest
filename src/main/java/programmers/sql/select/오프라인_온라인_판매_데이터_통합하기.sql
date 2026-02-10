-- https://school.programmers.co.kr/learn/courses/30/lessons/131537

SELECT online.SALES_DATE, online.PRODUCT_ID,
FROM ONLINE_SALE AS online
         LEFT JOIN OFFLINE_SALE AS offline ON online.PRODUCT_ID = offline.PRODUCT_ID
WHERE online.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
   OR offline.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'



SELECT DATE_FORMAT(online.SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
       online.PRODUCT_ID,
       online.USER_ID,
       online.SALES_AMOUNT
FROM ONLINE_SALE AS online
WHERE online.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
UNION ALL
SELECT DATE_FORMAT(offline.SALES_DATE, '%Y-%m-%d') AS SALES_DATE, offline.PRODUCT_ID, NULL, offline.SALES_AMOUNT
FROM OFFLINE_SALE AS offline
WHERE offline.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
ORDER BY SALES_DATE ASC, PRODUCT_ID ASC, USER_ID ASC;

/*
 WHERE 절을 전체에 걸지 않고 각각 걸어줘야 효율을 챙긴다.
 조건 없이 일단 테이블을 다 합쳐버리면 메모리를 낭비하게 된다.
 미리 합쳐서 거대한 테이블에서 조건을 검색하는 것 보다 각 테이블에서 필요한 것들만 모아서 합치는게 바람직하다.
 */

/*
 서로 다른 두 테이블을 세로로 합쳐서 보일 필요가 있다. 이 때 사용하는게 UNION (ALL) 쿼리다.

 UNION 은 중복을 제거하면서 합친다.
 이를 위해 두 테이블을 합치고 모든 행을 검사해 중복 데이터를 찾는다.
 이때 정렬 작업이 한번 수행되며 O(N log N) 이다.

 UNION ALL 은 중복 없이 그냥 합친다.
 정렬, 검사 등이 없기 때문에 O(N) 으로 매우 빠르다.
 */

/*
 ORDER BY 절에서 문자열화 된 SALES_DATE 를 봐도 되는지?

 이 경우 원본 테이블을 볼 수가 없다. UNION 이 실행되는 과정을 살펴보면 알 수 있다.
 1. online 테이블에서 필요한 데이터를 꺼내옴
 2. offline 테이블에서 필요한 데이터를 꺼내옴
 3. 둘을 합쳐 메모리에 이름 없는 임시 테이블을 만듬

 ORDER BY 는 이 임시 테이블만 볼 수 있기 때문에 이미 원본테이블에 있는 인덱스는 다 날아간 상태다.

 구지 해야겠다면 각 테이블에서 DATE_FORMAT 하지 말고 원본 DATE 를 그대로 가져온 다음 UNION 한 테이블을
 서브쿼리로 묶고 다시 SELECT (여기서 포맷팅) FROM AS T ORDER BY T.~ 하는 방법은 있다.
 문자열 비교 대신 날짜 비교를 할 수 있으니 약간의 성능 이점을 볼 수 있다.
 하지만 코드가 길어지고 가독성이 떨어진다.

 */