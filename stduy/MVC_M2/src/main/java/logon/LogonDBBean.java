package logon;

import common.DBConnPool;


import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;


public class LogonDBBean extends DBConnPool	{		
	//DAO : ���� DB�� Select , Insert, delete, update 
	
	
	//LogonDBBean ���� ��ü ���� <-- �Ѱ��� ��ü�� ���� �ؼ� ���� (�̱��� ����) 
		//�ܺ��� �ٸ� Ŭ�������� new Ű�� ����ϸ� �������� ��ü�� ������ �� �ִ�. 
		//Ư�� Ŭ������ �������� ��ü�� �������� ���ϵ��� �ϰ� �� �ϳ��� ��ü�� �����ؼ� ����ؾ� �� ��� 
			//(ȸ��)
	
	
		//�̱��� ���� : �ܺο��� �������� ��ü�� �������� ���ϰ� �ϳ��� ��ü�� ���� �ؼ� ����ϵ��� ��. 
			//0. ��ü �����ڴ� private ����
			//1. private static ���� ��ü ����, 2. ������ ��ü�� �޼ҵ�� ��ü�� ���� (public static) 
	private static LogonDBBean instance = new LogonDBBean();
	
	//LogonDBBean ��ü�� �����ϴ� �޼ҵ� 
		//�޼ҵ带 ����ؼ��� ��ü�� ���� �� �� �ִ�. 
	public static LogonDBBean getInstance() {
		return instance; 
	}
	
	//�⺻ ������ : private   : �ܺο��� ��ü ������ �Ұ��� ��. 
		// �θ� Ŭ������ �⺻ ������ ȣ�� 
//	private LogonDBBean ( ) { super(); }; 

	private LogonDBBean ( ) { super(); }; 
	
	//ȸ�� ���� ó�� (registerPro.jsp) ���� �Ѿ���� ���� DB�� ó�� ( Insert ) 
	
	public void insertMember (LogonDataBean Member) {
				
		try {
			
			//Form���� �Ѱܹ��� Password�� DB�� �����Ҷ� ��ȣȭ 
				//orgPass : Form �Ѱ� ���� password
			String orgPass = Member.getPasswd(); 
			byte[] targetBytes = orgPass.getBytes();  
			
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String encodedTxt = new String(encodedBytes);
	        
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Decoder decoder = Base64.getDecoder();
	        byte[] decodedBytes = decoder.decode(encodedBytes);
	        String decodedTxt = new String(decodedBytes);

	        System.out.println("���ڵ��� orgPass : " + orgPass);
	        System.out.println("���ڵ�  : " + encodedTxt);
	        System.out.println("���ڵ�  : " + decodedTxt);
			

			
			System.out.println ("��ȣȭ ���� ���� �н����� : " + orgPass); 

			
					
			String sql = "insert into member01 values (?, ?, ?, ?, ?, ?) "; 
			
			psmt = con.prepareStatement(sql) ; 
			psmt.setString(1, Member.getId());
			psmt.setString(2, encodedTxt);				//��ȣȭ�� password ���� 
//			psmt.setString(2, Member.getPasswd());	//��ȣȭ ���� �ʴ� �н����� ���� 
			psmt.setString(3, Member.getName());
			psmt.setTimestamp(4, Member.getReg_date()); 
			psmt.setString(5, Member.getAddress());
			psmt.setString(6, Member.getTel());
			
			psmt.executeUpdate(); 
			
			System.out.println("ȸ������ DB �Է� ���� ");		
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� DB �Է½� ���� �߻�"); 
		}finally {
//			instance.close(); 
		}
			
	}
	
	//�α��� ó�� (loginPro.jsp) :  ������ �Ѱ� ���� ID�� Pass�� DB�� Ȯ��. 
		// ����� ����ó��, DB�� ������ �����Ҷ� , DB�� ������ ���� �Ҷ�. 
		//����� ���� (MemberCheck.jsp) ���� ����ϴ� �޼ҵ�
	
	public int userCheck(String id, String passwd) {
		int x = -1;   //x = -1  : ���̵� �������� ���� , 
					  //x = 0   : ���̵�� ���������� �н����尡 ��ġ ���� ������ 
					  //x = 1   : ���� ����, 
		
		//��ȣȭ : ��ȣȭ�� Password�� ��ȣ�� �ص��� Password�� ��ȯ 
//		SHA256 sha = SHA256.getInsatnce(); 
		
		try {
			
			String orgPass = passwd;    //������ �Ѿ���� �н����� 
			byte[] targetBytes = orgPass.getBytes();
			
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String encodedTxt = new String(encodedBytes);
	        
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Decoder decoder = Base64.getDecoder();
	        

	        System.out.println("���ڵ��� orgPass : " + orgPass);
	        System.out.println("���ڵ�  : " + encodedTxt);
	       // System.out.println("���ڵ�  : " + decodedTxt);
	        
	        
			
			String sql = "select passwd from member01 where id = ? "; 
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);   
			rs = psmt.executeQuery(); 
			
			if (rs.next()) {    //���̵� �����ϸ� 
				String dbpasswd = rs.getString("passwd");     //DB���� ������ �н����� . 
//				if (BCrypt.checkpw(shaPass, dbpasswd)) {
				
				byte[] decodedBytes = decoder.decode(dbpasswd);
		        String decodedTxt = new String(decodedBytes);
				
		        System.out.println("DB���� ������ ��ȣ : " + dbpasswd);
				System.out.println("DB���� ��ȣȭ�� ��ȣ : " + decodedTxt);
				
				if (orgPass.equals(decodedTxt)) {
					x=1;  // ������ �Ѱܿ� �н������ DB���� ������ �н����尡 ��ġ �Ҷ� x: 1 
				}else {
					x= 0;   // �н����尡 ��ġ���� ������ 
				}
				
				
			}			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("���̵�� �н����� ���� ���� �߽��ϴ�.");
		}finally {
//			instance.close(); 	//��ü ��� ����. rs, smmt, psmt, con
		}
			
		return x; 		
	}
	
	//���̵� �ߺ� üũ (confirmId.jsp) : ���̵� �ߺ��� Ȯ���ϴ� �޼ҵ� 
	public int confirmId (String id) {
		int x = -1 ;    //x = -1 �϶� : ���� ID�� DB�� �������� ����
						//x = 1 �϶� : ���� ID �� DB�� ���� �Ѵ�. (�ߺ�)
		
		try {
			String sql = "select id from member01 where id = ?" ; 
			psmt = con.prepareStatement(sql);
			
			System.out.println(sql);
			
			psmt.setString (1,id); 
			rs = psmt.executeQuery();
			
			if ( rs.next()) {  // ���̵� DB �� �����ϴ� ���
				
				System.out.println(id + " �� ���� �ϴ� ID �Դϴ�. ");
				
				 x= 1; 
			} else {  //���̵� DB�� �������� �ʴ� ���
				System.out.println(id + " �� DB�� �������� �ʴ� ID �Դϴ�. ");
				 x= -1 ; 
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(" ID �ߺ� üũ�� ���� �߻�");
		}finally {
		//	instance.close(); 
		}	
		return x ; 
	}
	
	//ȸ������ DB���� �����ͼ� (modifyForm.jsp) : DB���� ȸ�� �����ǰ��� �������� �޼ҵ� 
	
	public LogonDataBean getMember (String id, String passwd) {
		LogonDataBean member = null ; 

			
		try {
			
			String orgPass = passwd; 
			 
			byte[] targetBytes = orgPass.getBytes();
			
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String encodedTxt = new String(encodedBytes);
	        
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Decoder decoder = Base64.getDecoder();

			
			
			String sql = "select * from member01 where id = ?"; 
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, id);
			rs = psmt.executeQuery(); 
			
			if (rs.next() ) {   //�ش� ���̵�  DB �� �����Ѵ�. 
				String dbpasswd = rs.getString("passwd");   // DB�� �н����带 ������ �Ҵ�
		        byte[] decodedBytes = decoder.decode(dbpasswd);
		        String decodedTxt = new String(decodedBytes);
				
				if ( orgPass.equals(decodedTxt)) {
					//DB�� passwd �� ������ �Ѱܿ� Pass�� ������  ó���� �κ�
						//DB���� select ���ڵ带 DTO (LogonDataBean) �� Setter���� �ؼ� ���� ��ȯ 
					
					//member ��ü ���� �� DB�� rs �� ����� ���� setter ������ ���� 
					member = new LogonDataBean();    //
					
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setReg_date(rs.getTimestamp("reg_date"));
					member.setAddress(rs.getString("address"));
					member.setTel(rs.getString("tel"));					
				} else { 
					//DB�� passwd �� ������ �Ѱܿ� Pass�� �ٸ��� ó���� �κ� 
				}
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� �о� ���� �� ���� �߻�");
		}finally {
			
//			instance.close(); 
		}
	
		return member; 		//member (LogonDataBean)  : DTO �� Setter ������  	
	}
	
	
	//�������������� ������ ������ DB�� �����ϴ� �޼ҵ� ( 
	//ȸ�� ���� ���� ó�� (modifyPro.jsp) ���� ȸ�������� ������ ó���ϴ� �޼ҵ� 
	public int updateMember(LogonDataBean member) {
		int x = -1 ; //x = -1 : ���̵� DB�� ���� ���� �ʴ� ��� 
					 //x = 0   : ���̵�� �����ϰ� ��й�ȣ�� Ʋ�� ��� 
					 //x = +1 : ���̵� �� Passwd ����ġ 
		
		//ID �� Passwd �� Ȯ���� ������Ʈ ���� . 
		
		try {
			String orgPass = member.getPasswd(); 
			byte[] targetBytes = orgPass.getBytes();
			
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String encodedTxt = new String(encodedBytes);
	        
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Decoder decoder = Base64.getDecoder();

			
			String sql = "select passwd from member01 where id = ?" ; 
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, member.getId());
			rs = psmt.executeQuery();  
			
			if (rs.next()) {	// �ش� ���̵� DB�� �����Ѵ�.
				//������ �ѱ� �н������ DB���� ������ �н����尡 ��ġ�ϴ��� Ȯ���� ó�� 
				String dbpasswd = rs.getString("passwd"); 
		        byte[] decodedBytes = decoder.decode(dbpasswd);
		        String decodedTxt = new String(decodedBytes);
		        
				if (orgPass.equals(decodedTxt)) {
				
					//DTO (member)���� ���� ���� DB�� UPDATE 
					       sql = "update member01 set name = ?, address = ?, tel= ? " ;  
						   sql += " where id = ?"; 
					psmt = con.prepareStatement(sql); 
					psmt.setString(1, member.getName());
					psmt.setString(2, member.getAddress());
					psmt.setString(3, member.getTel());
					psmt.setString(4, member.getId());
					
					psmt.executeUpdate();
					x = 1; 	//update ������ x ������ 1 �� �Ҵ�. 	
				
				}else {
					x = 0;   //ID�� �����ϰ� Passwd ��ġ ���� �ʴ� ��� 
				}
							
			} else {	// �ش� ���̵� DB�� �����Ѵ�. 			
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� ������ ���� �߻�");
		}finally {
//			instance.close();
		}
					
		return x; 				 
	}
	
	//ȸ�� Ż�� ó�� ( deletePro.jsp ) ���� ȸ�� ���� ���� �޼ҵ� 
	public int deleteMember(String id, String passwd) {
		int x = -1;  // x= -1 : ȸ�� Ż�� ���� 
					 // x = 1 : ȸ�� Ż�� ���� 
		
	
		try {
			
			String orgPass = passwd; 
			byte[] targetBytes = orgPass.getBytes();
			
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String encodedTxt = new String(encodedBytes);
	        
	        // Base64 ���ڵ� ///////////////////////////////////////////////////
	        Decoder decoder = Base64.getDecoder();

			
			String sql = "select passwd from member01 where id = ?"; 
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, id);
			rs = psmt.executeQuery(); 
			
			if (rs.next()) {  //id�� DB�� ���� 
				String dbpasswd = rs.getString("passwd"); 
		        byte[] decodedBytes = decoder.decode(dbpasswd);
		        String decodedTxt = new String(decodedBytes);

				if (orgPass.equals(decodedTxt)) {
				sql = "delete member01 where id = ?"; 
					
					psmt = con.prepareStatement(sql); 
					psmt.setString(1, id);
					psmt.executeUpdate(); 
					x = 1;     //delete ������ (id �� passwd�� ��� ��ġ�Ҷ� )								
				}else {
					x = 0 ;    //ID�� �����ϰ� passwd�� ��ġ ���� ������ 
				}
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� Ż��� ���ܰ� �߻� �߽��ϴ�");
		} finally {
//			instance.close();
		}
		
		return x; 			// ������ x = 1, ���н� x= -1 
	}
	
	
	
	

}
