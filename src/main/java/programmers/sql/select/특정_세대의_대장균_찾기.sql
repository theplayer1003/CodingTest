-- https://school.programmers.co.kr/learn/courses/30/lessons/301650

SELECT child.ID, parent.ID, gparent.ID, gparent.PARENT_ID
FROM ECOLI_DATA AS child
         JOIN ECOLI_DATA AS parent ON child.PARENT_ID = parent.ID
         JOIN ECOLI_DATA AS gparent ON parent.PARENT_ID = gparent.ID
WHERE gparent.PARENT_ID IS NULL
ORDER BY child.ID ASC;

SELECT child.ID
FROM ECOLI_DATA AS child
         JOIN ECOLI_DATA AS parent ON child.PARENT_ID = parent.ID
         JOIN ECOLI_DATA AS gparent ON parent.PARENT_ID = gparent.ID
WHERE gparent.PARENT_ID IS NULL
ORDER BY child.ID ASC;

/*
 복잡한 문제는 몇 개의 행을 뽑아서 직접 조인 결과를 적어보자.
 */