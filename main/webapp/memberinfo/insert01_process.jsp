<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼에서 넘겨받은 값을 DB에 저장하는 파일</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>	

<%
	request.setCharacterEncoding("UTF-8");	//폼에서 넘긴 한글을 처리하기 위함.
	
	//폼에서 넘긴 값을 변수에 담는다.
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String city = request.getParameter("city");
	String phone = request.getParameter("phone");
	
	Statement stmt = null;		// Statement 객체 : SQL 쿼리 구문을 담아서 실행하는 객체.
	String sql = null;		//전역 변수
	
	try {
		sql = "INSERT INTO mbtb1(idx, id, pass, name, email) Values(seq_mbtb1_idx.nextval, '" + id + "', '" + passwd + "', '" + name + "' , '" + email + "')";
		//강사님String sql = "INSERT INTO mbtb1 ( idx, id, pass, name, email ) Values (seq_mbtb1_idx.nextval, '" + id + "','"+  passwd + "','" + name+"','" + email + "') ";
		
		stmt = conn.createStatement();	//connection 객체를 통해서 statement 객체 생성
		stmt.executeUpdate(sql);		//statement 객체를 통해서 sql을 실행함.
					//stmt.executeUpdate (sql) : sql <== insert, update, delete 문이 온다.
					//stmt.executeQuery (sql)  : sql <== select 문이 오면서 결과를 Resultset 객체로 반환
		
		out.println("테이블 삽입에 성공했습니다.");
		out.println("<p> <p>");
		
		//out.println(sql);  //출력된 값의 코드형식이 잘 맞아야한다. 따옴표 처리, 컬럼 수 등 확인
		
		
	}catch (Exception ex) {
		out.println("mbtb1 테이블 삽입을 실패 했습니다.");
		out.println(ex.getMessage());
		out.println("<br><p>");
		//out.println(sql);
		
		
		
	} finally {
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null)
			conn.close();		
	}
	
%>

<p><p>

<%= id %> <p>
<%= passwd %> <p>
<%= name %> <p>
<%= email %> <p><p>


<%= sql %> <p><p>			//html 블락에서 출력할 때
<% 

out.println(sql);			//JSP 블락에서 출력할 때 

%>


</body>
</html>