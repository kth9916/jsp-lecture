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
	<p> 아이디 : <jsp:getProperty property="id" name="person"/>
		<!-- person 객체의 id 컬럼을 getter를 통해서 접근 (getId()) -->
	
	<p> 이름 : <jsp:getProperty property="na" name="person"/>
		<!-- person 객체의 name을 getter를 통해서 접근 (getName()) -->
	<p><p><p>
	
	<p> 아이디 : <%= person.getId() %>
	<p> 이름 : <%= person.getNa() %>
	
	<p><p><p>
	
	<p> 아이디 :<% out.println(person.getId()); %> 
	<p> 이름 : <% out.println(person.getNa()); %>
</body>
</html>