<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="dao.Person" scope="request"></jsp:useBean>
	<jsp:setProperty property="id" name="person" value="20220606" />
	<jsp:setProperty property="na" name="person" value="������(����)" />
	
	<p> ���̵� : <jsp:getProperty property="id" name="person"/>
	<p> �̸� : <jsp:getProperty property="na" name="person"/>
	
	
</body>
</html>