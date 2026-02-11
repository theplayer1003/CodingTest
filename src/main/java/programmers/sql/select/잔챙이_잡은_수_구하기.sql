-- https://school.programmers.co.kr/learn/courses/30/lessons/293258

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO
WHERE LENGTH IS NULL;

/*
 10cm 이하 길이의 물고기는 NULL 값을 가진다.
 이는 비즈니스 로직을 NULL 값에 녹여낸 형태다.
 본래 NULL은 없는 값 이나 알수 없음을 표현하는데 10cm 이하라는 뜻으로 대체되었다.

 장점으로는 잔챙이라는 별도의 컬럼 저장이나 0을 저장할 필요가 없어서
 저장 공간의 절약을 들 수 있겠으나

 나중에 진짜로 "아직 길이를 측정하지 못한 물고기" 같은 값이 들어온다면 10cm 이하라는 논리와 겹쳐 구분할 수 없게 된다.

 좋은 설계는 잔챙이라는 비즈니스 규칙을 NULL에 덮어 씌우지 않아야한다.
 */

/*
 NULL 은 인덱스를 탈 수 있다.
 과거 DBMS 에선 탈 수 없었지만 현대 RDBMS 에서는 NULL 을 인덱싱 할 수 있다.

 LENGTH 에 인덱스를 걸면 B-Tree 의 가장 왼쪽, 혹은 별도 설정 공간에 NULL 값들이 모이게 된다.

 단, 선택도에 따라 양상이 다르다.
 만약 데이터 대부분이 NULL이라면 옵티마이저는 인덱스를 타는 비용보다 전체 테이블을 읽는 비용이 싸다고 판단해 인덱스를 무시한다.
 NULL이 소수라면 인덱스를 활용한다.
 */

/*
 COUNT(*) vs COUNT(LENGTH)

 전자의 경우 모든 행을 세라는 뜻이 되어 NULL 도 세지만
 후자의 경우 LENGTH 컬럼 중 NULL 이 아닌 값만 세게 된다.
 */