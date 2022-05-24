package ex01;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO extends DBConnPool {
		//DB �� Connection ��ü�� ��� �ؼ� ���� �ߺ� �ڵ带 ������ �� �ִ�. 
	
	public MemberDAO() {     
		super(); 		//�θ� Ŭ������ �⺻ ������ ȣ��  (con ��ü�� ���� )
	}
		
	//List.jsp ����� ���� select : ��� ���ڵ尡 ����. 
		//���ڵ� 1���� DTO �� ���� 
	    //DTO�� List : Vector (��Ƽ������ ����) , ArrayList  (�̱۾�����)
	
	public List<MemberDTO> listMember () {
		
		//List<MemberDTO> 
		List<MemberDTO> listMember = new ArrayList<MemberDTO>(); 
		MemberDTO dto = new MemberDTO(); 
			
		String query = "select * from t_member" ;
		
		
		try { 

		psmt = con.prepareStatement(query); 
		rs = psmt.executeQuery(); 
			//rs �� DB���� Select �� ��� �� (���ڵ��)�� ���� 
		
		//rs�� ����� ���ڵ� ���� DTO�� ������ List �� ADD ���ش�. 
		
		while (rs.next()) {
			//rs�� ���� ������ ������ DTO�� �߰� 
			MemberDTO dto2 = new MemberDTO();
			
			String id = rs.getString("id");
			String pwd = rs.getString("pwd"); 
			String name = rs.getString(3); 
			String email = rs.getString("email");
			Date joinDate = rs.getDate("joinDate"); 
			
			//DTO�� Setter ���� 
			dto2.setId(id);
			dto2.setPwd(pwd);
			dto2.setName(name);
			dto2.setEmail(email);
			dto2.setJoinDate(joinDate);
			
			System.out.println("ID ��� : "  + id );
			
			listMember.add(dto2); 			
		}
				
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Member  ���̺��� Select �� ���� �߻� ");
		}
		
		return listMember; 
	}
	
	//Insert.jsp db�� insert
	// �Ű� ������ dto �� �޴´�. 
	
	public int addMember (MemberDTO dto) {
		
		int result = 0 ;    //Insert  ���� ���θ� Ȯ�� �ϴ� ���� 
		
		String query = "insert into t_member" ; 
				query += " (id, pwd, name, email)" ; 
				query += " values (? , ? , ? , ?)" ; 
				
				System.out.println( "Insert :" + query );
				
		//DTO�� �Ѿ���� ������ ������ getter �� ȣ���ؼ� ������ �Ҵ�. 
		String id = dto.getId(); 
		String pwd = dto.getPwd();
		String name = dto.getName(); 
		String email = dto.getEmail();
					
		try {
			//psmt ��ü ���� 
			psmt = con.prepareStatement(query); 
			//? �� ���� �Ҵ� 
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			psmt.setString(3, name);
			psmt.setString(4, email);
			
			//psmt ���� 
			result = psmt.executeUpdate();    //inset, update, delete �ϰ�� 
			
				//result : 1 <== Insert ����
				//result : 0 <== Insert ����
			
			System.out.println("Insert  ���� ");
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Insert �� ���ܰ� �߻��Ǿ����ϴ�. ");
			
		}	
		
		return result; 
		
	}
	
	
	//delet.jsp db���� delete
		//�Ű������� Primary Key �÷��� �������� �޾Ƽ� ó�� 
	public int delMember (String id) {
		
		int result = 0;
		
		String query ="delete t_member where id = ? "; 
		
		try {
			psmt = con.prepareStatement(query); 
			psmt.setString(1, id);
			result = psmt.executeUpdate(); 			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("�� ������ ���� �߻� ");
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	//proj01.war ���Ϸ� �������� �ؼ� ����
		// p.jangwoo@gmail, ����Կ��Ե� ���� 

}
