-- https://school.programmers.co.kr/learn/courses/30/lessons/276013

SELECT Devinfo.ID, Devinfo.EMAIL, Devinfo.FIRST_NAME, Devinfo.LAST_NAME
FROM DEVELOPER_INFOS AS Devinfo
WHERE Devinfo.SKILL_1 = 'Python'
   OR Devinfo.SKILL_2 = 'Python'
   OR Devinfo.SKILL_3 = 'Python'
ORDER BY Devinfo.ID ASC;

SELECT Devinfo.ID, Devinfo.EMAIL, Devinfo.FIRST_NAME, Devinfo.LAST_NAME
FROM DEVELOPER_INFOS AS Devinfo
WHERE 'Python' IN (Devinfo.SKILL_1, Devinfo.SKILL_2, Devinfo.SKILL_3)
ORDER BY Devinfo.ID ASC;

/*
 OR 연산으로 줄줄이 이어가지 않고 IN 연산자를 통해 해결 가능하다.
 보통 컬럼 IN (대상) 형태를 많이 쓰지만,
 거꾸로 대상 IN (대상 컬럼들) 형태도 가능하다.
 */

/*
 사실 이 문제의 함정은 테이블 자체에 있다.
 쿼리가 OR 연산의 중복으로 이루어지는 이유는 테이블이 1NF 를 위반하고 있기 때문이다.
 SKILL_1, SKILL_2, SKILL_3 같은 의미를 가지는 속성을 번호만으로 나열했다.
 만약 스킬 4가 필요해지는 날이 오면 테이블 구조 자체가 변경되어야 하며 시스템 운영에 치명적이다.
 앞서 본대로 조회에도 문제가 있다.

 정규화 된 올바른 설계 였다면,

 DEVELOPERS : ID, NAME, EMAIL
 SKLLLS : SKILL_ID, SKILL_NAME
 DEVELOPER_SKILLS : DEV_ID, SKILL_ID <- 여기에 개발자와 스킬 간의 정보가 매핑된다.
 이제 스킬이 1000개가 늘어나도 테이블 구조 자체가 변경될 필요가 없다.

 이런 테이블이었다면

 SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
 FROM DEVELOPERS D
 JOIN DEVELOPER_SKILLS DS ON D.ID = DS.DEV_ID
 JOIN SKILLS S ON DS.SKILL_ID = S.SKILL_ID
 WHERE S.SKILL_NAME = 'Python'
 ORDER BY D.ID ASC;

 쿼리로 조회할 수 있다.
 */