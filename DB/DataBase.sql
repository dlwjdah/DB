1. 데이터베이스 백업
윈도우 cmd기능 활용

1.1 사전 설정 : 선택적 사항, 1회만 실시
MySQL 실행파일 위치
    C:\Program Files\MySQL\MySQL Server 8.0\bin

1.1.1 System Path로 추가.
1. 제어판 > 시스템
2. 고급 시스템 설정
3. [고급] 탭 > [환경변수]
4. path 선택후 [편집]
5. MySQL의 경로 추가

1.2 백업
mysqldump -u사용자명 -p 백업DB > 백업파일명.sql
Ex>
mysqldump -uroot -p test_bank > test_bank.sql

2. 복원
조건 : 해당 DB는 반드시 MySQL에 존재해야 한다.
복원은 해당 DB를 덮어쓰기 한다.

mysql -u 사용자명 -p 백업DB < 백업파일명.sql
Ex>
mysql -u root -p test_bank < test_bank.sql