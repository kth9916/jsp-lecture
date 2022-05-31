<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "logon02.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  String u_id = request.getParameter("u_id");
  String u_pass  = request.getParameter("u_pass");

  LogonDBBean manager = LogonDBBean.getInstance();
  int check = manager.userCheck(u_id, u_pass);

  if(check==1)
	session.setAttribute("u_id",u_id);

  out.println(check);
%>