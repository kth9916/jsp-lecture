<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2> =========== Web.xml ���� ���� ��� ========== </h2>

���� �����Ⱓ ���� ���� : <%= session.getMaxInactiveInterval() / 60 %> ��

<p><p>

<h2> =========== ���� ���� ���� ���� ========== </h2>
<%
	
	session.setMaxInactiveInterval(60 * 60);		// 1�ð����� ����
	
	int time = session.getMaxInactiveInterval() / 60 ; 	//��
	
	out.println("���� ��ȿ �ð� " + time + "��");

%>
</body>
</html>