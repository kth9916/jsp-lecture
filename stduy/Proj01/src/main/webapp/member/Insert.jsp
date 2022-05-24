<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

</head>
<body>
<form name="insertFrm" method="post" enctype="multipart/form-data" action="../member/insert.do" onsubmit="return validateForm(this)" >
	<table border="1" width="90%">
		<tr>
			<td> 아이디 : </td>
			<td><input type="text" name="id" style="width=150px;" ></td>
		</tr>
		<tr>
			<td> 이름 : </td>
			<td><input type="text" name="name" style="width=90%;" ></td>
		</tr>
		<tr>
			<td> 비밀번호 : </td>
			<td><input type="password" name="pwd" style="width=100px;" ></td>
		</tr>
		<tr>
			<td> 이메일 : </td>
			<td><input type="text" name="email" style="width=90%;" ></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit"> 작성 완료 </button>
				<button type="reset"> RESET </button>
				<button type="button" onclick="location.href = '../member/list.do';" > 목록 바로가기 </button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>