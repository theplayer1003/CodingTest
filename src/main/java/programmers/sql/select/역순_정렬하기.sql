-- https://school.programmers.co.kr/learn/courses/30/lessons/59035

SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;

/*
 FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT
 실행 순서기 때문에 처음 FROM 절에서 모든 테이블 데이터가 다 불러와진다.
 이후 SELECT 를 실행한다고 해서 선택된 컬럼 외의 데이터가 버려지는 것은 아니다.
 SELECT 는 투영 작업, 프로젝션(Projection) 작업으로 선택되지 않은 컬럼을 마스킹해서 제외하는 작업이다.

 따라서 SELECT 하지 않았지만 ORDER BY 절의 정렬 대상으로 사용 가능하다.
 */

 /*
  ORDER BY 절은 비싼 연산인가?
  정렬은 보통 N log N 의 무거운 작업이다.
  하지만 ANIMAL_ID 가 기본키라면 이야기가 다르다.
  대부분의 DBMS 는 PK를 기준으로 데이터를 물리적으로 정렬해서 저장한다. Clustered Index
  이걸 B-Tree 로 관리하는데 리프 노드들은 양방향 연결 리스트로 되어 있어 ASC, DESC 정렬이 쉽게 처리된다.

  즉, PK 거나, 인덱싱이 되어 있지 않은 경우 ORDER BY 절로 정렬 시 성능이 급격히 저하된다.
  인덱스 O -> O(N)
  인덱스 X -> O(N log N)
  */