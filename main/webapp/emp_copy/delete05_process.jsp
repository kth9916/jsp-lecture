<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Process</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>
	
<%

	request.setCharacterEncoding("UTF-8");
	
	String eno = request.getParameter("eno");


	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		sql = "SELECT eno FROM emp_copy where eno = ?";
		pstmt2 = conn2.prepareStatement(sql);
		pstmt2.setString(1, eno);
		
		rs = pstmt2.executeQuery();
		
		if(rs.next()){
			String rEno = rs.getString("eno");
			
			if(eno.equals(rEno)){
				sql = "delete emp_copy where eno = ?";
				pstmt2 = conn2.prepareStatement(sql);
				pstmt2.setString(1, eno);
				pstmt2.executeUpdate();
				
				out.println("테이블에서 해당 사원번호 : " + eno + "가 잘 삭제 되었습니다. ");
			}else {
				out.println("해당 사원번호는 존재하지 않습니다.");
			}
		}else{
			out.println("해당 사원번호는 존재하지 않습니다.");
		}
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt2 != null)
			pstmt2.close();
		if(conn2 != null)
			conn2.close();
	}

%>
</body>
</html>