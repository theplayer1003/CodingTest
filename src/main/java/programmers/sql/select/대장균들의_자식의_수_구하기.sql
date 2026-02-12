-- https://school.programmers.co.kr/learn/courses/30/lessons/299305

SELECT Parent.ID, COUNT(Child.ID)
FROM ECOLI_DATA AS Parent
         LEFT JOIN ECOLI_DATA AS Child ON Parent.ID = Child.PARENT_ID
GROUP BY Parent.ID
ORDER BY Parent.ID ASC;




부모 정보                             자식 정보
1       NULL    10  19/01/01    5   NULL
2       NULL    2   19/01/01    3   NULL
3       1                           1       NULL
4       2                           2       NULL
5       2                           2       NULL
6       4                           4       2



자식 정보                             부모 정보
1       NULL    10  19/01/01    5   1
2       NULL    2   19/01/01    3   2
3       1                           3       1
4       2                           4       2
5       2                           5       2
6       4                           6       4

부모ID    부모부모ID    자식ID    자식부모ID
1       NULL        3       1
2       NULL        4       2
2       NULL        5       2
3       1           .
4       2           6       4
5       2
6       4
