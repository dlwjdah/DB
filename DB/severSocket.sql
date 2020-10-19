1. 서버
import java.net.ServerSocket;
import java.net.Socket;
import java.io.InputStream;
import java.io.DataInputStream;
import java.io.OutputStream;
import java.io.DataOutputStream;

1.1 ServerSocket을 생성
ServerSocket serverSocket = new ServerSocket(int포트번호);

1.2 클라이언트 Socket으로 접속 대기. 접속되면 Socket을 반환
Socket socket = serverSocket.accept();

1.3 클라이언트 Socket과 통신을 하기 위한 Stream을 생성
1.3.1 DataInputStream 생성(클라이언트의 OutputStream의 전송값을 읽어들일 stream)
DataInputStream in = socket.getInputStream()
DataInputStream dis = new DataInputStream(in);

1.3.2 OutputStream 생성 (클라이언트의 InputStream으로 전송)
OutputStream out socket.getOutputStream();
DataInputStream dos = new DataOutputStream(out);

1.4 통신
1.4.1 클라이언트가 보낸 정보 받기
String msg = dis.readUTF();

1.4.2 클라이언트로 정보 보내기
dos.writeUTF("보낼 문자열");

1.5 연결 끊기
dis.close();
dos.close();
socket.close();

2. 클라이언트
2.1 Socket을 생성하여 서버에 접속
Socket socket = new Socket("서버 IP 또는 도메인", int서버포트번호);

2.2 서버와 통신을 하기위한 스트림을 생성
2.2.1 DataInputStream을 생성(서버에서 보내진 정보를 받기)
InputStream in = socket.getInputStream();
DataInputStream dis = new DataInputStream(in);

2.2.2 DataOutputStream을 생성(서버로 정보를 전송)
OutputStream out = socket.getOutputStream();
DataOutputStream dos = new DataOutputStream(out);

2.3
2.3.1 서버가 보낸 정보 받기
String
