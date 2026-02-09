-- https://school.programmers.co.kr/learn/courses/30/lessons/144853

SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
WHERE (PUBLISHED_DATE BETWEEN '2021-01-01' AND '2021-12-31')
  AND CATEGORY = '인문'
ORDER BY PUBLISHED_DATE ASC;

--

SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
WHERE (PUBLISHED_DATE BETWEEN '2021-01-01' AND '2021-12-31')
  AND CATEGORY = '인문'
ORDER BY BOOK.PUBLISHED_DATE ASC;

SELECT BOOK_ID, DATE_FORMAT(PUBLISED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
WHERE (PUBLISHED_DATE >= '2021-01-01' AND PUBLISHED_DATE < '2022-01-01')
  AND CATEGORY = '인문'
ORDER BY BOOK.PUBLISHED_DATE ASC;

/*
문제는 출판일을 DATE 타입으로 표기하고 있고 이는 원래는 날짜 정보만 담고 시간 정보가 없다.
하지만 실제로 쿼리를 실행해보면 0시0분0초 가 같이 출력되는걸 볼 수 있다.
데이터베이스에는 시간 정보가 없지만 중간 처리 과정 어딘가에서 시간 정보를 포함해서 출력하는 것으로 추측된다.
따라서 DATE_FORMAT 함수로 포맷팅하는 작업이 필요하다.

strftime 표준 포맷팅 문법
%Y : 2025 : 4자리 전체 표기
%y : 25 : 2자리 축약

%M : January : 영어 전체 이름 텍스트
%b : Jan : 영어 축약 이름
%m : 01 : zero 패딩 숫자 표기
%c : 1 : zero 패딩 없는 숫자 표기

%d : 05 : zero 패딩 숫자 표기
%e : 5 : zero 패딩 없는 숫자 표기

15:07:09
%H : 15 : 24시간제, zero 패딩
%h : 03 : 12시간제, zero 패딩
%p : PM : 오전, 오후 표시
%i : 07 : %m 아님!
%s : 09 : 초


포맷팅을 수행하게 되면 최종 컬럼명이 DATE_FORMAT(PUBLISHED_ ...) 로 출력된다.
별칭을 적어줘야하는데 여기서 별칭을 원본 컬럼과 동일하게 지정해야 한다면
ORDER BY 절에서 PUBLISED_DATE 는 원본 컬럼이 아닌 포맷팅 작업으로 문자열로 치환된 PUBLISED_DATE 를 가리키게 된다.
이 경우 포맷팅 결과가 연-월-일 순으로 자연스럽게 되어 정렬 결과에 영향이 없었지만, 월-일-연 등 일 경우 정렬이 의도대로 되지 않을 수 있다.
테이블명.컬럼명 으로 원본을 가리키도록 명확히 적을 수 있다.
 */