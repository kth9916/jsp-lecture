<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%		// client ������ ID, Password
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("password");
	
	// DB���� ������ ��
	if(user_id.equals("admin") && user_pw.equals("1234")){
		// ���ǿ� ���� ������ ���� �Ҵ�
		session.setAttribute("userID", user_id);
		session.setAttribute("userPW", user_pw);
		
		out.println("���� ������ �����߽��ϴ�.");
		out.println(user_id + " �� ȯ�� �մϴ�.");
		
	}else{
		out.println("���� ������ �����߽��ϴ�.");
	}

%>

</body>
</html>