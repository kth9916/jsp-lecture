<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Bean�� Getter�� RAM�� ���� ȣ��</title>
</head>
<body>
	<jsp:useBean id="person" class="dao.Person" scope="request"></jsp:useBean>
	
	<p> ���̵� : <%= person.getId() %>
	<p> �̸� : <%= person.getNa() %>


</body>
</html>