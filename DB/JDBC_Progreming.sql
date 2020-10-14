import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;


1. JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdgc.Driver");

2. DB 연결


String domian = "jdbc:mysql://아이디 또는 도메인:3306/ 데이터베이스명"
         ?characterEncoding=UTF-8&serverTimezone=UTC;
String id = "DB사용자ID";
String pass = "DB접속패스워드";
Connection conn = DriverManager.getConnection(domian, id, pass);

Statement stnt = conn.createStatement();


3. DB에서 데이터를 읽거나 쓰기
3.1 읽기(SELECT)
String sql = "SELECT ...";
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
    타입 변수명 = rs.get자료형("필드명");
    ...
}

3.2 쓰기(INSERT), 수정(UPDATE), 삭제(DELETE)
String sql = "INSET... , UPDATE ... , DELETE";
int row = stmt.updateQuery(sql);

4. DB연결 끊기
rs.close();
stmt.close();
conn.close();