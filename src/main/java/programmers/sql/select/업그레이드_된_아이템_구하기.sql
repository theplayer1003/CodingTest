-- https://school.programmers.co.kr/learn/courses/30/lessons/273711

SELECT iinfo.ITEM_ID, iinfo.ITEM_NAME, iinfo.RARITY
FROM ITEM_TREE AS itree
         LEFT JOIN ITEM_INFO AS iinfo ON itree.PARENT_ITEM_ID = iinfo.ITEM_ID
WHERE iinfo.RARITY = 'RARE'
  AND itree.PARENT_ITEM_ID IS NOT NULL
ORDER BY iinfo.ITEM_ID DESC;

SELECT iinfo2.ITEM_ID, iinfo2.ITEM_NAME, iinfo2.RARITY
FROM ITEM_INFO AS iinfo1
         LEFT JOIN ITEM_TREE AS itree1 ON iinfo1.ITEM_ID = itree1.ITEM_ID
         LEFT JOIN ITEM_INFO AS iinfo2 ON itree1.PARENT_ITEM_ID = iinfo2.ITEM_ID
WHERE iinfo1.RARITY = 'RARE'
  AND itree1.PARENT_ITEM_ID IS NOT NULL
ORDER BY iinfo2.ITEM_ID DESC;

-- A 아이템이 B 아이템으로 업그레이드가 가능하다면, A 아이템은 B 아이템의 부모다. A -> B, 부모 -> 자식 아이템
-- 트리의 낮은 쪽이 부모다.

SELECT iinfo2.ITEM_ID, iinfo2.ITEM_NAME, iinfo2.RARITY
FROM ITEM_INFO AS iinfo1
         JOIN ITEM_TREE AS itree1 ON iinfo1.ITEM_ID = itree1.PARENT_ITEM_ID
         JOIN ITEM_INFO AS iinfo2 ON itree1.ITEM_ID = iinfo2.ITEM_ID
WHERE iinfo1.RARITY = 'RARE'
ORDER BY iinfo2.ITEM_ID DESC;

SELECT Child.ITEM_ID, Child.ITEM_NAME, Child.RARITY
FROM ITEM_INFO AS Parent
         JOIN ITEM_TREE AS Relation ON Parent.ITEM_ID = Relation.PARENT_ITEM_ID
         JOIN ITEM_INFO AS Child ON Relation.ITEM_ID = Child.ITEM_ID
WHERE Parent.RARITY = 'RARE'
ORDER BY Child.ITEM_ID DESC;

SELECT Child.ITEM_ID, Child.ITEM_NAME, Child.RARITY
FROM ITEM_INFO AS Parent
         LEFT JOIN ITEM_TREE AS Relation ON Parent.ITEM_ID = Relation.PARENT_ITEM_ID
         LEFT JOIN ITEM_INFO AS Child ON Relation.ITEM_ID = Child.ITEM_ID
WHERE Parent.RARITY = 'RARE'
  AND Relation.PARENT_ITEM_ID IS NOT NULL
ORDER BY Child.ITEM_ID DESC;


/*
 M:N 관계 해소, 브릿지 테이블을 통한 셀프 조인, Relation 표현

 문제를 풀기 위해 부모 아이템 - 관계 - 자식 아이템 구조를 만들어야한다.
 이를 M:N 관계 해소, 브릿지 테이블 셀프 조인 등으로 부른다.
 */

/*
 별칭을 의미 있게 짓는 연습을 하자
 */

/*
 INNER vs LEFT

 INNER 는 교집합. 양쪽 모두에 존재하는 데이터만 남는다.
 LEFT 는 왼쪽 테이블이 Master, 무조건 존재하는 테이블이며 오른쪽이 Guest, 주인 테이블 옆에 붙던가 없으면 NULL 로 채워진다.

 해당 문제에서는 관계 에서 NULL 이 있는 테이블은 필요가 없기 때문에 INNER JOIN 이 적합하다.
 */

/*
 서브쿼리 해결도 가능하다.
 과거엔 서브 쿼리 성능이 떨어졌지만 최신 DBMS 는 서브쿼리도 알아서 최적화해서 실행한다.
 다만, 가끔 아주 복잡한 쿼리에서는 옵티마이저가 최적화를 못 할 수도 있다.
 JOIN 을 명시하는건 옵티마이저에게 결합이 필요함을 명확히 알려주기 때문에 이 쪽이 확실하다.

 또, 서브쿼리는 안에서 바깥으로 읽어나가야 해서 가독성이 떨어질 수 있다.
 JOIN 쪽이 좀 더 권장되는 방식이다.
 */