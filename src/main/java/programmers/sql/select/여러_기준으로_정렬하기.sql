-- https://school.programmers.co.kr/learn/courses/30/lessons/59404

SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC;

/*
 인덱스에도 방향이 있다.

 만약 효율적인 쿼리를 위해 NAME, DATETIME 의 커버링 인덱스를 생성한다면 어떨까.
 인덱스를 생성하면 기본적으로 오름차순으로 정렬된다.
 하지만 쿼리는 DATETIME 의 내림차순을 요구한다.
 결국 NAME 은 인덱스를 타지만 그 안에서 다시 DATETIME 을 별도 정렬해야한다.

 MySQL 8.0+ 등 최신 DBMS 에서는 인덱스를 만들 때부터 정렬 방향을 지정하는 기능을 지원한다.
 CREATE INDEX idx-optimized ON ANIMAL_INS (NAME ASC, DATETIME DESC);
 이제 DB 엔진은 쿼리 그대로 인덱스를 읽기만 하면 정렬 없이 결과를 만들 수 있다.
 */