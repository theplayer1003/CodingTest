-- https://school.programmers.co.kr/learn/courses/30/lessons/132201

SELECT PT_NAME, PT_NO, GEND_CD, AGE, COALESCE(TLNO, 'NONE') AS TLNO
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC;

SELECT PT_NAME, PT_NO, GEND_CD, AGE, COALESCE(TLNO, 'NONE') AS TLNO
FROM PATIENT
WHERE GEND_CD = 'W' AND AGE <= 12
ORDER BY AGE DESC, PT_NAME ASC;

/*
 같은 의미를 가지는 데이터 중 있는걸 반환하거나 없을 경우 대체 데이터를 반환시키는 함수
 예를 들어 집전화번호, 핸드폰번호, 사무실번호 세 가지의 데이터가 있을 때
 이 세 데이터는 모두 '연락 가능한 번호' 로 묶을 수 있다.
 쿼리의 결과로 연락 가능한 번호 중 하나의 번호만 출력, 만약 연락 가능한 번호가 없다면 대체 데이터를 출력하고 싶을 때 사용한다.


 - COALESCE(val1, val2, ..., '대체결과')
 표준 문법으로 모든 DBMS에 호환, N개 인자 지원

 - IFNULL(val1, val2)
 MySQL용 문법. 2개 인자로 고정되며 MySQL에서 미세하게 빠를 수 있으나 호환 불가능

 - NVL(val1, val2)
 Oracle 전용 문법. 2개 인자 고정.

 - ISNULL(val1, val2)
 MSSQL 전용 문법. 2개 인자 고정.

 인자가 두개 있는 함수는 중첩해서 사용해야 여러 컬럼을 검사할 수 있다.
 IFNULL(HOME_PHONE, IFNULL(MOBILE_PHONE, IFNULL(OFFICE_PHONE, '번호없음')))
 */

 /*
  ISNULL 은 MSSQL 에서는 위와 같이 작동하지만
  MySQL 에서는 NULL 인지를 체크하는 여부로 사용되는 함수임을 주의하자.
  ISNULL(NULL) -> 1, True
  ISNULL('A') -> 0, False
  */