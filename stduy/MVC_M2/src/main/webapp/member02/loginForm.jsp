<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>
<script src="../js/jquery-1.11.0.min.js"></script>
<script src="login.js"></script>

<%
String u_id = "";
try{
	u_id = (String)session.getAttribute("u_id");
	
%>

<% if(u_id == null || u_id.equals("")){%>
	<div id="status">
		<ul>
			<li><label for="u_id">아이디</label>
				<input id="u_id" name="u_id" type="email" size="20" maxlength="50" placeholder="example@kings.com">
			<li><label for="u_pass">비밀번호</label>
				<input id="u_pass" name="u_pass" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
			<li class="label2">
				<button id="login">로그인</button>
				<button id="register">회원가입</button>
		</ul>
	</div>
<% }else{%>
	<div id="status">
		<ul>
			<li><b><%=u_id %></b>님이 로그인 하셨습니다.
			<li class="label2"><button id="logout">로그아웃</button>
			
		</ul>
	</div>
<%}}catch(Exception e){e.printStackTrace();}%>