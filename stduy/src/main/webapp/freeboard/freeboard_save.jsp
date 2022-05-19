<%@ page contentType="text/html; charset=EUC-KR" %>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("EUC-KR"); %>

<%@ include file = "dbconn_oracle.jsp" %>

<%
 String na = request.getParameter("name");
 String em = request.getParameter("email");
 String sub = request.getParameter("subject"); 
 String cont = request.getParameter("content");
 String pw = request.getParameter("password");
 int id =1;
 int pos=0;
 
 if (cont.length()==1) 
  cont = cont+" "  ;

 //textarea 내의 ' 가 들어가면 DB에 insert, update시 문제 발생. 
 
 

 while ((pos=cont.indexOf("\'", pos)) != -1) {    //-1 값이 존재하지 않을때 
  String left=cont.substring(0, pos); 
  		//out.println ("pos : " + pos + "<p>"); 
  		//out.println ("left : " + left + "<p>"); 
  
  String right=cont.substring(pos, cont.length());	
  		//out.println ("right : " + right + "<p>"); 
  
  cont = left + "\'" + right; 
  pos += 2;
 }
 
 //if (true) return; 
 

 
 java.util.Date yymmdd = new java.util.Date() ;
 SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
 String ymd=myformat.format(yymmdd);

 String sql=null;
 //Connection con=null;
 Statement st=null; 
 ResultSet rs=null;  
 int cnt=0; 


 try {

  st = conn.createStatement();
  sql = "select max(id) from  freeboard";	 //최신글의 번호를 가져온다. 
  rs = st.executeQuery(sql);
  if (!(rs.next())) 		//글이 존재하지 않는 경우  
   id=1;
  else {
   id= rs.getInt(1) + 1 ;  //글이존재하는 경우 최대값에 + 1	
  
  }       
  sql= "insert into freeboard(id,name,password,email,subject," ;
  sql= sql + "content,inputdate,masterid,readcount,replaynum,step)" ; 
  sql= sql + " values(" +id + ", '" +  na + "','" + pw + "','"+ em  ;
  sql= sql + "','" + sub + "','" + cont + "','" + ymd + "'," +id+"," ;
  sql= sql + "0,0,0)";

  cnt = st.executeUpdate(sql); 
  
 // out.println (sql); 
  // if (true) return;   // 
  
  
if (cnt >0) 
 out.println("데이터가 성공적으로 입력되었습니다.");
 else  
  out.println("데이터가 입력되지 않았습니다. ");
  
 
 } catch (SQLException e) {
  out.println(e);
 }finally {
	 if (rs != null)
		 rs.close(); 
	 if (st != null)
		 st.close(); 
	 if (conn != null)
		 conn.close();
 }
 
%>

 <jsp:forward page ="freeboard_list.jsp" /> 
 
 <!--  페이지 이동 
 	
 	jsp:forward  :           서버단에서 페이지를 이동, 클라이언트의 기존의 URL 정보가 바뀌지 않는다. 
 	response.sendRedirect : 
 		클라이언트에서 페이지를 재요청으로 페이지 이동 , 이동하는 페이지로 URL 정보가 바뀐다. 
 		
  -->
 
 
 
 
 
 
 
 
 
 

