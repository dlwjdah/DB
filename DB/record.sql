1. 레코드 삽입(INSERT)
1.1 완전체 형식
INSERT INTO 테이블명(칼럼명1, 칼럼명2, 칼럼명3, ...);
VALUES(값1, 값2, 값3, ...);
주의 ( 칼럼당 값 하나씩 )
1. 칼럼명1 = 값1, 칼럼명 나열순에 맞추어 값을 나열한다.
2. 칼럼명의 순서는 중요하지 않다.
3. 모든 칼럼을 기술할 필요도 없다. 단, 필수항목(Not Null)은 반드시 기술.
4. 값이 문자, 날짜 형식일 경우 반드시 "" 또는 ''로 감싸줘야 한다.
5. 값이 숫자인 경우 "" 또는 '' 는 기입하지 않아도 무방하다.
6. 관습적으로 값은 ''로 묶어준다.
Ex>
INSERT INTO address(serial_no, client_id, address1, address2, address3, postal_code)
VALUES(1, '321', '서울특별시', '강남구 삼성동 44번지', 'A아파트 1동 101호', '50693');
1.2 간략형
INSERT INTO 테이블명
VALUES(값1, 값2, 값3, ...);
조건>
테이블의 칼럼순서를 알고 있을 경우 사용 (순서 변경 안됨)
모든 칼럼을 입력해야 함.
모든 제약조건을 지켜야 입력 가능.
Ex>
INSERT INTO address
VALUES(2, '441', '경기도', '성남시 분당구 정자동 66번지', 'b아파트 5동 111호', '12301');


2. 레코드 검색(조회)(SELECT)
2.1 완전체 기본형
SELECT 칼럼명1, 칼럼명2, ...
FROM 테이블명;
Ex>
SELECT serial_no, client_id, postal_code
FROM address;
SELECT serial_no, client_id, address1
FROM address
WHERE address1='경기도';

2.2 단순조회
SELECT * FROM 테이블명;
Ex>
SELECT * FROM address;

3.갱신(UPDATE)
UPDATE 테이블명
SET 칼럼명1-값1, 칼럼명2-값2, ...
WHERE 조건;
주의 -> 
WHERE 조건을 기술하지 않으면 전체 레코드를 대상으로 수정이 된다.
조건은 결과가 TRUE 또는 FALSE형태의 BOOLEAN 타입이어야 한다.
조건은 주로 비교, 논리 연산자를 활용
- 연산자 : https://www.w3schools.com/sql/sql_operators.asp

Ex>
UPDATE address
SET address1 = '제주도', address2 = '서귀포시 색달동', address3 = '청아아파트 111동 11호'
WHERE serial_no = 1;
        

4. 삭제 (DELETE)
DELETE FROM 테이블명
WHERE 조건;

주의 >
WHERE 조건을 생략하면 전체 레코드가 삭제.
Ex>
DELETE FROM address
WHERE address1 = '서울특별시';


5. SELECT DISTINCT
- 조회시 중복 제거
SELECT DISTINCT 컬럼명1, 컬럼명2, ...
FROM 테이블명
[WHERE 조건]; <- 생략가능


6. WHERE
- SELECT, UPDATE, DELETE 구문에서 조건을 부여할 때 사용
SELECT 필드명, ...
FROM 테이블명
WHERE 조건;

UPDATE 테이블명
SET 필드명 = 값, ...
WHERE 조건;

DELETE FROM 테이블명
WHERE 조건;

6.1 WHERE 절에서 사용하는 연산자
= : Equals
>, <, >=, <=
<> : Not equals

6.1.1 BETWEEN : ~ 사이에 
WHERE 필드명 BETWEEN 시작 AND 끝; // 시작 <= 필드값 <= 끝
Ex>
SELECT * FROM Products
WHERE Price BETWEEN 50 AND 60; // Price값이 50이상 그리고 60이하

6.1.2 LIKE : 패턴 검색
WHERE 필드명 LIKE '패턴';
- 패턴에 사용되는 와일드카드 문자
% : 0개, 1개 또는 여러 문자를 대체한다.
_ : 1개 문자를 대체한다.

Ex>
WHERE CustomerName LIKE 'a%'; // CustomerName이 a로 시작하는. a, ab, abc
WHERE CustomerName LIKE '%a'; // CustomerName이 a로 끝나는. a, ba, soda
WHERE CustomerName LIKE '%or%'; // CustomerName에 or가 포함되는. or, korea, orange, aaaor
WHERE CustomerName LIKE 'a_'; // CustomerName에 a로 시작하며 글자수는 총 3자. abc, ade, aid
WHERE CustomerName LIKE 'a_%_%'; // CustomerName에 a로 시작하며 글자수는 총 3자 이상. abc, apple

6.1.3 IN; 목록과 일치하는 (or 연산자의 축약형)
WHERE 필드명 IN(값1, 값2, ...)
// WHERE 필드명 = 값1 OR 필드명 = 값2 OR ...;
Ex>
WHERE Country IN ('Germany', 'France', 'UK');


7. AND, OR, Not
- 조건의 논리 연산자

7.1 AND - 모든 조건이 TRUE일때 TRUE
WHERE 조건1 AND 조건2 AND 조건3 ...;
Ex>
WHERE Country = 'Germany' AND City = 'Berlin';

7.2 OR - 조건 중 1개이상 TRUE이면 TRUE
WHERE 조건1 OR 조건2 OR 조건3 ...;
Ex>
WHERE City-'Berlin' OR City-'Minchen'; // WHERE City IN('Berlin', 'minchen');

7.3 NOT - 조건의 결과거 TRUE이면 FALSE, FALSE이면 TRUE로 전환
WHERE NOT 조건;
Ex>
WHERE NOT Country = 'Germany';

7.4 AND, OR, NOT은 혼합하여 사용할 수 있다. 우선순위는 ()로 묶어서 표현.
Ex>
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Minchen');
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';