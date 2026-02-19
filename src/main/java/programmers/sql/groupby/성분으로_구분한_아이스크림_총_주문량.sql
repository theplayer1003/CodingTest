--https://school.programmers.co.kr/learn/courses/30/lessons/133026


SELECT Iceinfo.INGREDIENT_TYPE, SUM(Saleinfo.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF AS Saleinfo
         JOIN ICECREAM_INFO AS Iceinfo ON Saleinfo.FLAVOR = Iceinfo.FLAVOR
GROUP BY Iceinfo.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;

/*
 FROM & JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

이 순서에 의해 '별칭' 은 그 별칭이 생성된 이후 절부터 사용이 가능하다.
 ORDER BY 절에서 사용한 TOTAL_ORDER 라는 별칭은(실제 테이블의 컬럼이지만 여기선 별칭으로 선언되었기 때문에 별칭)
 SELECT 절 이후에 실행되기 때문에 사용 가능한 것.
 반대로 그 이전인 WHERE 절 GROUP BY 절 등에서는 SELECT 에서 만들어진 별칭으로 접근이 불가능하다.
 쿼리 실행 순서를 확실히 알아야 한다.
 */

 /*
  문제에서 처음으로 PK 와 FK 를 명시해줬다.

  이를 통해 JOIN 실행 시 옵티마이저가 어떤 알고리즘으로 수행할지 생각해보자.
  1. Nested Loop Join, NLJ
 아마 높은 확률로 이 알고리즘이 작동할거다.
  - FIRST_HALF 테이블의 레코드를 하나씩 순차적으로 스캔하면서
  - 해당 레코드의 FLAVOR 값을 가지고 ICECREAM_INFO 테이블을 검색
  - 이때 ICECREAM_INFO 의 FLAVOR 는 기본키 이므로 자동으로 고유 인덱스가 있으며 풀 스캔 없이 B-Tree 인덱스를 통해
  O(log N) 속도로 데이터를 찾아 결합할 수 있다.

  2. 해시 조인, Hash Join
 양쪽 테이블의 데이터 크기가 매우 크다면 옵티마이저는 해시 조인을 선택할 수도 있다.
  하나의 테이블로 해시 맵을 구성하고, 다른 테이블을 스캔하며 해시 함수를 통해 매칭을 시도하는 방식.

  PK, FK 가 가지는 의미는

  1. ICECREAM_INFO 의 PK 가 FLAVOR 라고 하면 해당 컬럼은 유니크한 값임이 보장된다.
  따라서 이 테이블과 FIRST_HALF 테이블을 조인하게 되면 1:N 임을 알 수 있다.
  중복된 맛이 있다고하면 조인 시 데이터가 불어나기 때문에 SUM 결과가 기대와 다를 수 있고 PK 명시를 통해 이 위험이 없음을 알 수 있다.

  2. FIRST_HALF 테이블의 FLAVOR 가 외래 키임을 알려줬기 때문에 여기서 존재하는 맛은 반드시 ICECREAM_INFO 테이블에 존재함이 보장된다.
  따라서 교집합 연산인 이너 조인에서 누락되는 데이터가 생기지 않는다는걸 알 수 있다.

  */
