-- https://school.programmers.co.kr/learn/courses/30/lessons/301647

SELECT Child.ID, Child.GENOTYPE, Parent.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS Parent
         JOIN ECOLI_DATA AS Child ON Parent.ID = Child.PARENT_ID
WHERE (Parent.GENOTYPE & Child.GENOTYPE) = Parent.GENOTYPE
ORDER BY Child.ID ASC;


/*
P.ID    P.PID   C.ID    C.PID
1       null    2       1
1       null    3       1
2       1       4       2
2       1       7       2
3       1       6       3
4       2       5       4
5       4       null    null (날라감)
6       3       8       6
7       2       null    null (날라감)
8       6       null    null (날라감)
 */


/*
부모의 형질을 모두 보유 했는지 확인하는 법.

 P.GEN & C.GEN 결과가 C.GEN 보다 크거나 같으면.
1111
1011
---
1011 >= 1111 부모형질 False 부모 형질을 다 가지지 못함

0010
1110
0010 >= 0010 부모형질 True 부모 형질 다 가짐
 */