-- https://school.programmers.co.kr/learn/courses/30/lessons/301646

SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (2 & (
    SELECT GENOTYPE
    FROM ECOLI_DATA
    WHERE (GENOTYPE & 1
    > 0)
   OR (GENOTYPE & 4
    > 0)
    )) = 0;

SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (GENOTYPE & 2 = 0) AND (GENOTYPE & 1 > 0 OR GENOTYPE & 4 > 0);

SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE (GENOTYPE & 2 = 0) AND (GENOTYPE & 5 > 0);


ID 1 : 1000 -> 4
ID 2 : 1111 -> 1, 2, 3, 4
ID 3 : 0001 -> 1
ID 4 : 1101 -> 1, 3, 4

/*
 2번 형질이 없으며,
 1번이나 3번 형질으 보유하고 있는 대장균 개체 수

 2번 형질이 없음 ??0? 여야함
 1101
 0010(2) 과 AND 연산 시 -> 무조건 0 이어야함.

 1번이나 3번 형질을 보유하라
 0001(1) AND 연산 시 0보다 크거나
 0100(4) AND 연산 시 0 보다 크다.
 둘 중 하나만 맞아도 됨.
 */

/*
이전 비트마스킹 문제 기억 때문에 무작정 서브쿼리로 접근했는데 생각해보면 그럴 필요가 없다.
이전 개발자 스킬 문제는 두 테이블이 대상이어서 코드 값을 가져오기 위해 조회(look-up) 할 필요가 있었고
이번엔 한 테이블 대상으로 상수와의 연산을 해주면 되기 때문이다. 단일 WHERE 절로 필터링 가능하다.

1번 비트와 4번 비트를 검사하는 건 합칠 수 있다. 더 짧은 쿼리로 처리 가능하다.
 */