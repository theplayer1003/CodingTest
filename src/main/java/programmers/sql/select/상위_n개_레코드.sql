-- https://school.programmers.co.kr/learn/courses/30/lessons/59405

SELECT NAME
FROM ANIMAL_INS
ORDER BY DATETIME ASC
LIMIT 1;

SELECT NAME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);

/*
 LIMIT 는 모든 정렬을 마치고 가장 위의 1개를 가져오는게 아니다.
 LIMIT 가 쿼리에 붙을 경우 DB엔진은 소트 버퍼를 효율적으로 사용하는 Top-N 최적화 알고리즘을 사용한다.

 인덱스가 없으면 전체 데이터를 퀵 소트나 머지 소트 정렬하는 대신
 메모리에 크기 1 짜리 우선순위 큐를 만들고 데이터를 스캔하면서 현재 힙의 값보다 작은 값이 나오면 교체하는 식으로 검사한다.
 전체 정렬보다 훨씬 적은 메모리와 CPU 비용 O(N) 으로 수행된다.

 인덱스가 있다면 정렬 자체가 필요 없다.
 B-Tree 인덱스의 가장 왼쪽 리프 노드 하나만 읽으면 끝난다. O(1)

 만약 LIMIT 가 너무 크다면 우선순위 큐를 메모리에 유지하는 비용이 너무 크다.
 이때는 옵티마이저가 전략을 바꿔 일반적인 정렬을 수행한다.
 */