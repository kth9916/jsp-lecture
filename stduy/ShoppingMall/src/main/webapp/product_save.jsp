<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>


<%
	//�̹��� ������ ���ε� �Ǵ� ���� ������ �������� ��� 
 String fileurl= application.getRealPath("upload");
  //out.println (fileurl); 
  //if (true) return; 

 /*
 out.println ("��Ŭ������ �������� ��� : " + fileurl); 

 String upload = application.getRealPath("upload"); 
 out.println( "<p><p> ��Ŭ���� ������ �������� ��� : " + upload ); 

 if (true) return; 		//���α׷� ���� 
 */

 String saveFolder="upload";
 String encType="euc-kr";
 int Maxsize = 5*1024*1024*1024;   //�ִ� ���ε� �뷮 :  5GB
 
 ServletContext context = getServletContext();
 MultipartRequest multi = null;
 DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
 	//���ε� ������ ������ �̸��� ������ ������ ��� �����̸� ��ڿ� ��ȣ�� �Ҵ��ؼ� ���ε��
 
 multi = new MultipartRequest(request,fileurl,Maxsize,encType,policy);
 
 String wn = multi.getParameter("wname");
 String cat= multi.getParameter("category");
 String pn = multi.getParameter("pname");
 String sn = multi.getParameter("sname");
 int price = Integer.parseInt(multi.getParameter("price"));
 int dprice = Integer.parseInt(multi.getParameter("dprice"));
 int stock = Integer.parseInt(multi.getParameter("stock"));
 String des = multi.getParameter("description");
 
 /*
 out.println (wn ); out.println (cat);out.println (pn );out.println (sn );
 out.println (price ); out.println (dprice);out.println (stock );out.println (des );
 if (true) return;   //���α׷� ���� 
 */ 
 
 
 
 long id = 0;   //��ǰ�� ���� ��ȣ �Ҵ�  
 int pos=0;
 		//��ǰ ������ �� �ķ��� ' ������ DB�� ����� ���� �߻� 
 		// DB�� ���� ������ ' �� ó���ؼ� DB�� ���� �ǵ��� ����
 		
 while ((pos=des.indexOf("\'", pos)) != -1) {
  String left=des.substring(0, pos);
  String right=des.substring(pos, des.length());
  des = left + "\'" + right;
  pos += 2;
 }
 
 java.util.Date yymmdd = new java.util.Date() ;
 SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
 
 String ymd=myformat.format(yymmdd);   //ymd : ����� 
 
 String sql=null;
 //Connection con=null;
 Statement st=null; 
 ResultSet rs=null;  
 int cnt=0; 
 

 
 try {
  
  st = conn.createStatement();
  sql = "select max(id) from  product where category= '"+cat+"'";
  		//DB�� id(��ǰ�� ���� ��ȣ) : ������ category �� �ִ� ���� �����ͼ� +1 �ؼ� ��ǰ ���� ��ȣ �Ҵ�. 
 
  rs = st.executeQuery(sql);
  rs.next();
  id= rs.getLong(1);       // id �� ī�װ��� �ִ밪 
    
  //id : ��ǰ������ȣ �Ҵ� , 
  if (id==0)    //������ ���ڵ尡 0 , category �÷��� ��ǰ�� �������� �ʴ� ��� 
   id=Integer.parseInt(cat+"00001");   //1100001
  else    
   id= id + 1 ;
 
  
  //
  Enumeration files = multi.getFileNames();		//���� �̸� 2�� �� �Ѳ����� �����´�. 
  String fname1 = (String) files.nextElement();
  String filename1 = multi.getFilesystemName(fname1);
  String fname2 = (String) files.nextElement();
  String filename2 = multi.getFilesystemName(fname2);
 
  if (filename2 == null)
   filename2=filename1;
  sql = "insert into product(id,category,wname,pname,sname,price,downprice" ;
  sql = sql+",inputdate,stock,small,large,description) values("+id+",'";      
  sql = sql+cat+"','"+wn+"','"+pn+"','"+sn+"',"+price+","+dprice+",'"+ymd;
  sql = sql+"',"+stock+",'"+filename2+"','"+filename1+"','"+des+"')" ;
  
  // �ʹ� �����ؼ� preparestatement ���°� �� ����
 
  cnt = st.executeUpdate(sql);
      
  if (cnt >0) 
   out.println("��ǰ�� ����߽��ϴ�.");
  else  
   out.println("��ǰ�� ��ϵ��� �ʾҽ��ϴ�. ");
 
  st.close();
  conn.close();
  
 } catch (SQLException e) {
  out.println(e);
 }
%>
<P>
<A href="product_list.jsp">[��ǰ �������]</A> &nbsp;
<A href="product_write.htm">[��ǰ �ø��� ������]</A>