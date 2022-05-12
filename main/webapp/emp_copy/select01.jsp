<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>

<table width = "500" border="1">
	<tr>
		<th>eno</th>
		<th>ename</th>
		<th>job</th>
		<th>manager</th>
		<th>hiredate</th>
		<th>salary</th>
		<th>commission</th>
		<th>dnoth>
	</tr>
	
	<%
	
		ResultSet rs = null; 	
		Statement stmt2 = null;
		
		try{
			String sql2 = "SELECT * FROM emp_copy";
			stmt2 = conn2.createStatement();		//connection 객체의 createstatement()로 stmt를 활성화
			rs = stmt2.executeQuery(sql2);
					
			
			while (rs.next()){
				String eno = rs.getString("eno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String manager = rs.getString("manager");
				String hiredate = rs.getString("hiredate");
				String salary = rs.getString("salary");
				String commission = rs.getString("commission");
				String dno = rs.getString("dno");
			
			%>		
		<tr>
			<td><%= eno %></td>
			<td><%= ename %></td>
			<td><%= job %> </td>
			<td><%= manager %></td>
			<td><%= hiredate %></td>
			<td><%= salary %></td>
			<td><%= commission %></td>
			<td><%= dno %>
		</tr>	
		<%	
			}		
		}catch(Exception ex){
			out.println("테이블 호출하는데 실패 했습니다.");
			out.println(ex.getMessage());
		} finally {
			if(rs != null)
				rs.close();
			if(stmt2 != null)
				stmt2.close();
			if(conn2 != null)
				conn2.close();
		}
	%>

	

</table>

</body>
</html>