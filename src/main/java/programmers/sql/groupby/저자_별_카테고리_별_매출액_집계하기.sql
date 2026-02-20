-- https://school.programmers.co.kr/learn/courses/30/lessons/144856

SELECT Bookinfo.AUTHOR_ID, Authorinfo.AUTHOR_NAME, Bookinfo.CATEGORY, (Bookinfo.PRICE * SUM(Saleinfo.SALES)) AS TOTAL_SALES
FROM BOOK AS Bookinfo
         LEFT JOIN AUTHOR AS Authorinfo ON Bookinfo.AUTHOR_ID = Authorinfo.AUTHOR_ID
         LEFT JOIN BOOK_SALES AS Saleinfo ON Bookinfo.BOOK_ID = Saleinfo.BOOK_ID
WHERE Saleinfo.SALES_DATE >= '2022-01-01' AND Saleinfo.SALES_DATE < '2022-02-01'
GROUP BY Authorinfo.AUTHOR_ID, Bookinfo.CATEGORY
ORDER BY Bookinfo.AUTHOR_ID ASC, Bookinfo.CATEGORY DESC;

SELECT *
FROM BOOK AS Bookinfo
         LEFT JOIN AUTHOR AS Authorinfo ON Bookinfo.AUTHOR_ID = Authorinfo.AUTHOR_ID
         LEFT JOIN BOOK_SALES AS Saleinfo ON Bookinfo.BOOK_ID = Saleinfo.BOOK_ID
WHERE Saleinfo.SALES_DATE >= '2022-01-01' AND Saleinfo.SALES_DATE < '2022-02-01'
GROUP BY Authorinfo.AUTHOR_ID, Bookinfo.CATEGORY




SELECT Bookinfo.category, Authorinfo.AUTHOR_NAME, SUM(Saleinfo.SALES)
FROM BOOK AS Bookinfo
         LEFT JOIN AUTHOR AS Authorinfo ON Bookinfo.AUTHOR_ID = Authorinfo.AUTHOR_ID
         LEFT JOIN BOOK_SALES AS Saleinfo ON Bookinfo.BOOK_ID = Saleinfo.BOOK_ID
WHERE Saleinfo.SALES_DATE >= '2022-01-01' AND Saleinfo.SALES_DATE < '2022-02-01'
GROUP BY Authorinfo.AUTHOR_ID, Bookinfo.CATEGORY



SELECT Bookinfo.category, Authorinfo.AUTHOR_NAME, Bookinfo.BOOK_ID, Bookinfo.PRICE, SUM(Saleinfo.SALES), (Bookinfo.PRICE * SUM(Saleinfo.SALES)) AS TOTAL_SALES
FROM BOOK AS Bookinfo
         LEFT JOIN AUTHOR AS Authorinfo ON Bookinfo.AUTHOR_ID = Authorinfo.AUTHOR_ID
         LEFT JOIN BOOK_SALES AS Saleinfo ON Bookinfo.BOOK_ID = Saleinfo.BOOK_ID
WHERE Saleinfo.SALES_DATE >= '2022-01-01' AND Saleinfo.SALES_DATE < '2022-02-01'
GROUP BY Authorinfo.AUTHOR_ID, Bookinfo.CATEGORY, Bookinfo.BOOK_ID
ORDER BY Bookinfo.AUTHOR_ID ASC, Bookinfo.CATEGORY DESC;


SELECT AUTHOR_ID, AUTHOR_NAME, CATEGORY, SUM(TOTAL_SALES) AS TOTAL_SALES
FROM (SELECT Bookinfo.AUTHOR_ID,
             Authorinfo.AUTHOR_NAME,
             Bookinfo.CATEGORY,
             (Bookinfo.PRICE * SUM(Saleinfo.SALES)) AS TOTAL_SALES
      FROM BOOK AS Bookinfo
               LEFT JOIN AUTHOR AS Authorinfo ON Bookinfo.AUTHOR_ID = Authorinfo.AUTHOR_ID
               LEFT JOIN BOOK_SALES AS Saleinfo ON Bookinfo.BOOK_ID = Saleinfo.BOOK_ID
      WHERE Saleinfo.SALES_DATE >= '2022-01-01'
        AND Saleinfo.SALES_DATE < '2022-02-01'
      GROUP BY Authorinfo.AUTHOR_ID, Bookinfo.CATEGORY, Bookinfo.BOOK_ID
      ORDER BY Bookinfo.AUTHOR_ID ASC, Bookinfo.CATEGORY DESC) AS test
GROUP BY AUTHOR_ID, AUTHOR_NAME, CATEGORY

SELECT
    A.AUTHOR_ID,
    A.AUTHOR_NAME,
    B.CATEGORY,
    SUM(B.PRICE * S.SALES) AS TOTAL_SALES -- [핵심] 각 행의 곱셈 결과를 합산
FROM BOOK AS B
         INNER JOIN AUTHOR AS A ON B.AUTHOR_ID = A.AUTHOR_ID
         INNER JOIN BOOK_SALES AS S ON B.BOOK_ID = S.BOOK_ID
WHERE S.SALES_DATE >= '2022-01-01'
  AND S.SALES_DATE < '2022-02-01'
GROUP BY
    A.AUTHOR_ID,
    A.AUTHOR_NAME,
    B.CATEGORY
ORDER BY
    A.AUTHOR_ID ASC,
    B.CATEGORY DESC;


/*
 GROUP BY 는 JOIN 된 결과 테이블에 변형을 가하는 작업이 아니다.

 처음 문제 풀이를 접근할때, 저자 아이디와 카테고리로 그룹핑을 했다. 그러고 결과를 살펴보니 한 저자의 한 카테고리의, 여러 책이 존재할 수 있는데 이 부분이 누락되어
 값이 의도대로 나오지 않을거란 생각이 들었다. 가격이 다른 책들이 있을 수 있으니까 BOOK_ID 까지 그룹을 걸어줘야한다고 생각하고 쿼리를 진행했다.
 그러고나서 나온 결과는 저자 별, 카테고리 별, 책 별 그룹핑된 매출액이었고 문제에서 원하는 대답은 책을 분류하지 않으니까 작성한 쿼리를 내부 쿼리로 써서,
 바깥에 쿼리를 감싸서 원하는 결과 모양을 만들어야한다고 생각했다.

 여차저차 작동하는 정답 쿼리 자체는 구해냈지만 근본적인 생각이 틀렸음을 알았다.

 그룹 바이는 조인된 테이블(연산 대상이 될 테이블)을 변형하는 작업이 아니다. 만들어진 가상의 테이블을 메모리 상에서 동일한 크룹 키를 가진 튜플들을 식별할 수 있도록
 논리적인 파티션 경계를 만드는 작업이다. '분류표 라벨링 작업을 해두는 것' 이다. '저자 아이디와 저자 카테고리가 이러한 행'들을 각각의 바구니에 모아둔다고 생각해도 된다.

 따라서 내가 처음 우려한 '가격이 다른 책들의 정보가 어떻게 변형 된게 아닐까?' 라는 생각은 틀렸다.
 SELECT 문이 그룹 바이 절 이후에 실행된다는 데서 착안한 착각이었는데,
 SELECT 절에서 (Bookinfo.PRICE * Saleinfo.SALES) 을 실행하게 되면 조인된, 연산 대상이 될 테이블 원형에 대해서 처리가 일어난다.
 즉, 그룹바이와 무관하게 모든 책들에 대한 가격 * 판매량 계산이 일어나기 때문에 원하는 결과를 얻을 수 있다.
 */