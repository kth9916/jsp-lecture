<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB의 내용을 가져와서 출력하기</title>
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
		<th>dno>
	</tr>
	
	<%
	
		ResultSet rs = null; 	
		PreparedStatement pstmt2 = null;
		
		try{
			String sql = "SELECT * FROM emp_copy";
			pstmt2 = conn2.prepareStatement(sql);
			rs = pstmt2.executeQuery(sql);
					
			
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
			if(pstmt2 != null)
				pstmt2.close();
			if(conn2 != null)
				conn2.close();
		}
	%>

	

</table>

</body>
</html>