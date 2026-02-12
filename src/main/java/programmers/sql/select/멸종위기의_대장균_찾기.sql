-- https://school.programmers.co.kr/learn/courses/30/lessons/301651

WITH RECURSIVE rq AS (SELECT ID, PARENT_ID
                      FROM ECOLI_DATA
                      WHERE PARENT_ID IS NULL

                      UNION ALL

                      SELECT Child.ID, Parent.ID
                      FROM ECOLI_DATA AS Parent
                               JOIN rq AS Child ON Parent.PARENT_ID = Child.ID)

SELECT * FROM rq;


/*
 Gemini said
"UNION ALL을 사용하여 '최초의 1세대(Anchor)' 쿼리와 '이전 세대를 참조하여
 다음 세대를 찾는(Recursive)' 쿼리를 하나로 합치세요."
 */


