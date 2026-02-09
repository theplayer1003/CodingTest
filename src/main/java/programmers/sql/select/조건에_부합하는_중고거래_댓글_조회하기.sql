-- https://school.programmers.co.kr/learn/courses/30/lessons/164673

SELECT ugb.TITLE,
       ugb.BOARD_ID,
       ugr.REPLY_ID,
       ugr.WRITER_ID,
       ugr.CONTENTS,
       DATE_FORMAT(ugr.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM USED_GOODS_BOARD AS ugb
         JOIN USED_GOODS_REPLY AS ugr ON ugb.BOARD_ID = ugr.BOARD_ID
WHERE ugb.CREATED_DATE LIKE '2022-10-%'
ORDER BY ugr.CREATED_DATE ASC, ugb.TITLE ASC;

SELECT ugb.TITLE,
       ugb.BOARD_ID,
       ugr.REPLY_ID,
       ugr.WRITER_ID,
       ugr.CONTENTS,
       DATE_FORMAT(ugr.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM USED_GOODS_BOARD AS ugb
         JOIN USED_GOODS_REPLY AS ugr ON ugb.BOARD_ID = ugr.BOARD_ID
WHERE ugb.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY ugr.CREATED_DATE ASC, ugb.TITLE ASC;

/*
 MySQL은 LIKE 로 DATE 를 비교해도 암시적 형변환으로 알아서 인덱스를 타고 처리하지만
 Oracle, PostgreSQL 등 엄격한 DBMS의 경우나 표준을 고려하면 BETWEEN 이나 부등식으로 명확히 날짜 범위를 검색하는게 좋다.
 */