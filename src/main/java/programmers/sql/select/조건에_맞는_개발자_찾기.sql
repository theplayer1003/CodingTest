-- https://school.programmers.co.kr/learn/courses/30/lessons/276034

SELECT Dev.ID, Dev.EMAIL, Dev.FIRST_NAME, Dev.LAST_NAME
FROM SKILLCODES AS Devskill
         JOIN DEVELOPERS AS Dev ON
WHERE

SELECT CODE
FROM SKILLCODES
WHERE SKILLCODES.NAME = 'Python'
   OR SKILLCODES.NAME = 'C#';


SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE (SKILL_CODE & (SELECT SUM(CODE)
FROM SKILLCODES
WHERE SKILLCODES.NAME = 'Python' OR SKILLCODES.NAME = 'C#')) > 0
ORDER BY ID ASC;

/*
 비트 마스킹 문제

 비트 마스킹이란 2진법 특성을 이용해 값을 표현하고 존재 여부를 확인할 수 있는 것.
 예를 들어

 JAVA: 0001(2)
 C#: 0010(2)
 파이썬: 0100(2)
 C++: 1000(2)

 라고 하자.

 JAVA OR C# 은 0011(2) 이다.
 어떤 개발자의 스킬 코드가 1011(2) 라고 하면 JAVA OR C# 의 코드인 0011(2) 와 AND 연산을 하면
 0011(2) 이 된다. 즉 자바 와 C# 의 비트가 살아남고 이 스킬을 가졌다고 판단할 수 있다.
 AND 연산의 결과가 0보다 크다면 판단하고자하는 자바와 C# 의 비트 중 어느 하나라도 남았단 뜻이므로
 해당 개발자가 자바나 C# 의 스킬을 가졌음을 알 수 있다.

 만약 자바 와 C# 이라면, AND 연산의 결과가 목표하는 두 기술을 의미하는 0011(2) 와 정확히 일치하는지 보면 된다.
 */

/*
 비트마스킹 표현법은 관계형 테이블로 대체될 수 있다.
 개발자가 임의로 1은 자바, 2는 C#, 3은 파이썬, 4는 C++ 이라고 정의한 관계 테이블을 만들고
 이를 통해 표현하면 된다.

 비트 마스킹은 사용하는 비트 개수만큼만 속성을 표현할 수 있으며 무한정 늘릴 경우 비트마스킹 표현은 인덱싱이 불가능해서 성능이 떨어진다.
 관계형 테이블로 표현하게 되면 데이터 무결성을 확보하고 유지보수성도 편해진다.

 그럼 비트 마스킹은 필요가 없는가? 하드웨어 성능이 충분히 올라간 현재 환경에서 비트마스킹보다는 관계형 테이블이 가지는 이점이 더 큰 가치일 수 있다.
 다만 비트 마스킹만의 장점도 여전히 있다.
 먼저 저장 공간의 압도적인 차이가 장점이다.
 비트마스킹으로 요일을 표현한다고 하면 Integer 의 4byte 가 필요하다.
 반면 관계형 테이블은 1:N 맵핑으로 USER_ID(8byte) <-> DAY_CODE(1byte) 형태가 된다.

 만약 10억명의 데이터를 다룰 상황이라면 비트마스킹은 4GB 지만 관계형 테이블은 훨씬 많은 공간이 필요할 수 있다.
 저장 공간을 극도로 효율적으로 사용해야하는 임베디드 시스템이나 네트워크 패킷 헤더 같은 경우 비트마스킹이 유일한 해법이 될 수 있다.

 복잡한 논리 연산에서도 비트마스킹이 더 강점을 띈다.
 '월요일 또는 화요일에 가능하며, 토요일은 불가능하지만 일요일은 가능한 사람'
 관계형 테이블의 경우
 SUM(CASE WHEN DAY_CODE IN ('MON', 'TUE') THEN 1 ELSE 0 END) > 0 : 월요일이나 화요일
 AND SUM(CASE WHEN DAY_CODE = 'SAT' THEN 1 ELSE 0 END) = 0 : 토요일은 아님
 AND SUM(CASE WHEN DAY_CODE = 'SUN' THEN 1 ELSE 0 END) > 0 : 일요일은 가능

 비트마스킹의 경우
 WHERE (CODE & (MON | TUE)) > 0 : 월요일이나 화요일
 AND (CODE & SAT) = 0 : 토요일은 아님
 AND (CODE & SUN) > 0 : 일요일은 가능

 확연한 차이를 보인다.
 */