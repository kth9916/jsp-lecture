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
	
	<p> ���̵� : <%= person.getId() %>
	<p> �̸� : <%= person.getNa() %>
	
		<%
			//Setter ����
			person.setId(20220530);
			person.setNa("������");	
		%>
		
		<jsp:include page="useBean03.jsp"></jsp:include>
</body>
</html>