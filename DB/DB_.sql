1. 데이터베이스 목록 조회
SHOW DATABASES;

2. 데이터베이스 생성
CREATE DATABASE 데이터베이스명;
Ex>
CREATE DATABASE test_Bank;

3. 데이터베이스 삭제
DROP DATABASE 데이터베이스명;
Ex>
DROP DATABASE test_Bank;
주의 : 데이터베이스가 삭제되면 데이터베이스 안에 수록된 모든 개체들 및 내용이 삭제된다.

4. 데이터베이스 사용(접근)
USE 데이터베이스명;
Ex)
USE test_Bank;