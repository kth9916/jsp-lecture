<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.sql.*,java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_oracle.jsp" %>


<%
 String na = request.getParameter("name");
 String em = request.getParameter("email");
 String sub = request.getParameter("subject"); 
 String cont = request.getParameter("content");
 String ymd = (new java.util.Date()).toLocaleString();
 String sql=null;
 //Connection con=null;
 Statement st=null; 
 
 int pos=0;
 
 while ((pos=cont.indexOf("\'", pos)) != -1) {
  String left=cont.substring(0, pos);
  String right=cont.substring(pos, cont.length());
  cont = left + "\'" + right;
  pos += 2;
 }  
 int cnt=0; 

 try {
 
  st = conn.createStatement();

  sql= "insert into guestboard(name,email,inputdate,subject,content)";
  sql= sql + " values('"+ na +"','"+ em +"','" + ymd + "','" ;
  sql= sql + sub + "','" + cont + "')";
     
  cnt = st.executeUpdate(sql); 
 
  /*
  if (cnt >0) {
   out.println("�����Ͱ� ���������� �ԷµǾ����ϴ�.");
  } else { 
   out.println("�����Ͱ� �Էµ��� �ʾҽ��ϴ�. ");
  }
  
  out.println (sql); 
if (true) return ; 


  */


  st.close();
  conn.close();
 } catch (SQLException e) {
  out.println(e);
 }
%>
<!--<P>
<A href="dbgb_show.jsp">[���� ����]</A> &nbsp;
<A href="dbgb_write.htm">[�� �ø��� ������]</A>//-->
 
<jsp:forward page="dbgb_show.jsp"/>
