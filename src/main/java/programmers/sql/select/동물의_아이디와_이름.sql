-- https://school.programmers.co.kr/learn/courses/30/lessons/59403

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;

/*
 ANIMAL_ID 가 PK 라고 가정해보자.
 자동 생성된 클러스터링 인덱스 가 있어 ID 값만 불러온다면 빠르겠지만 이 경우엔 ID 와 NAME 값이 같이 필요하다.
 이렇게 자주 조회될만한 컬럼들은 묶어서 인덱스를 생성해 둘 수 있다. 이를 커버링 인덱스라고 한다.
 */

 /*
  이 문제에서 ANIMAL_ID 는 숫자가 아닌 문자열 값이다.
  이를 통해 ORDER BY 하게 되면 사전식 정렬에 의해 의도와 다른 정렬이 이루어질 수 있다.
  숫자의 경우 1 -> 2 -> 10 -> ... 을 기대할 수 있지만
  문자열의 경우 A1 -> A10 -> A2 -> .. 처럼 앞에서부터 한자한자 판단해 정렬된다.
  이를 해결하기 위해 Natural Sort 알고리즘이 필요하거나 패딩 작업이 필요할 수 있다.

  대소문자 구분 이슈도 있다. A352713, a352713 을 같은 값으로 볼 수도 다른 값으로 볼 수도 있다.
  테이블이나 컬럼을 만들 때 COLLATE 설정을 통해 이를 지정해줄 수 있다.
  */