package logon;

import common.DBConnPool;
import work.crypt.BCrypt;
import work.crypt.SHA256;

public class LogonDBBean extends DBConnPool{		
	//DAO : ���� DB�� Select, Insert, delete, update
	
	//LogonDBBean ���� ��ü ���� <-- �Ѱ��� ��ü�� �����ؼ� ����(�̱��� ����)
		//�ܺ��� �ٸ� Ŭ�������� new Ű�� ����ϸ� �������� ��ü�� ������ �� �ִ�.
		//Ư�� Ŭ������ �������� ��ü�� �������� ���ϵ��� �ϰ� �� �ϳ��� ��ü�� �����ؼ� ����ؾ� �� ���
			//(ȸ��)
	
	
		//�̱��� ���� : �ܺο��� �������� ��ü�� �������� ���ϰ� �ϳ��� ��ü�� �����ؼ� ����ϵ��� ��.
			//0. ��ü �����ڴ� private ����
			//1. private static ���� ��ü ���� 2. ������ ��ü�� �޼ҵ�� ��ü�� ����
//	private static LogonDBBean instance = new LogonDBBean();
	
	//LogonDBBean ��ü�� �����ϴ� �޼ҵ�
		//�޼ҵ带 ����ؼ��� ��ü�� ������ �� �ִ�.
//	public static LogonDBBean getInstance( ) {
//		return instance;
//	}
	
	// �⺻ ������ : private : �ܺο��� ��ü ���� �Ұ��� ��.
		// �θ� Ŭ������ �⺻ ������ ȣ��
//	private LogonDBBean () {super(); };
	
	
	public LogonDBBean () {super(); };
	//ȸ�� ���� ó��(registerPro.jsp)���� �Ѿ���� ���� DB�� ����(Insert)
	
	public void insertMember(LogonDataBean Member) {
		
//		 SHA256 sha = SHA256.getInsatnce();
		
		try {
			
			//Form���� �Ѱܹ��� Password�� DB�� ������ �� ��ȣȭ
				//orgPass : Form���� �Ѱܹ��� password
			String orgPass = Member.getPasswd();
//			String shaPass = sha.Sha256Encrypt(orgPass.getBytes());		//hash
//			String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
				//bcPass : ��ȣȭ�� ��ȣ
			
			System.out.println("��ȣȭ ���� ���� �н����� : " + orgPass);
//			System.out.println("��ȣȭ�� �н����� : " + bcPass);
				
			String sql = "insert into member01 values(?, ?, ?, ?, ?, ?) ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, Member.getId());
		//	psmt.setString(2, bcPass);			// ��ȣȭ�� password ����
			psmt.setString(2, Member.getPasswd());			// ��ȣȭ ���� �ʴ� �н����� ����
			psmt.setString(3, Member.getName());
			psmt.setTimestamp(4, Member.getReg_date());
			psmt.setString(5, Member.getAddress());
			psmt.setString(6, Member.getTel());
			
			psmt.executeUpdate();

			System.out.println("ȸ������ DB �Է� ����");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("ȸ������ DB �Է½� ���� �߻�");
		} finally {
			instance.close();
		}
		
		
	}
	
	//�α��� ó�� (loginPro.jsp) : ������ �Ѱܹ��� ID�� Pass�� DB�� Ȯ��.
		//����� ����ó��, DB�� ������ ������ ��, DB�� ������ ������ ��. 
		//����� ����(MemberCheck.jsp)���� ����ϴ� �޼ҵ�
	
	public int userCheck(String id, String passwd) {
		int x = -1;		//x = -1 : ���̵� �������� ����
						//x = 1  : ���� ����
		
		//��ȣȭ : ��ȣȭ�� Password�� ��ȣ�� �ص��� Password�� ��ȯ
		SHA256 sha = SHA256.getInsatnce();
		
		try {
			
			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());
			
			String sql = "select passwd from member01 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {	//���̵� �����ϸ�
				String dbpasswd = rs.getString("passwd");	//DB���� ������ �н�����.
				if (BCrypt.checkpw(shaPass, dbpasswd)) {
					x = 1;	// ������ �Ѱܿ� �н������ DB���� ������ �н����尡 ��ġ�� �� x : 1
				} else {
					x = -1;		//�н����尡 ��ġ���� ���� ��
				}
			}
	
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("���̵�� �н����� ���� ���� �߽��ϴ�.");
		} finally {
			instance.close();	//��ü ��� ����. rs, stmt, psmt, con
		}

		return x;
	}

	//���̵� �ߺ� üũ(confirmId.jsp) : ���̵� �ߺ��� Ȯ���ϴ� �޼ҵ�
	public int confirmId(String id) {
		int x = -1;		//x = -1 �϶� ���� ID�� DB�� �������� ����
						//x = 1 �϶� ���� ID�� DB�� �����Ѵ�.(�ߺ�)
		
		try {
			String sql = "select id from member01 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {	//���̵� DB�� �����ϴ� ���
				x = 1;
			} else {	//���̵� DB�� �������� �ʴ� ���
				x = -1;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("ID �ߺ�üũ �� ���ܹ߻�");
		} finally {
			instance.close();
		}
		return x;
	}
	
	//ȸ������ ����(modifyForm.jsp) : DB���� ȸ�� ������ ���� �������� �޼ҵ�
	
	public LogonDataBean getMember(String id, String passwd) {
		LogonDataBean member = null;
		SHA256 sha = SHA256.getInsatnce();
		
		try {
			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());
			
			String sql = "select * from member01 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {		// �ش� ���̵� DB�� �����Ѵ�.
				String dbpasswd = rs.getString("passwd");		// DB�� �н����带 ������ �Ҵ�
				if(BCrypt.checkpw(shaPass, dbpasswd)) {
					// DB�� passwd�� ������ �Ѱܿ� Pass�� ���� �� ó���� �κ�
						//DB���� select ���ڵ带 DTO(LogonDataBean)�� Setter���� �ؼ� ���� ��ȯ
					
					// member ��ü ���� �� DB�� rs�� ����� ���� setter ���� �� ����
					member = new LogonDataBean();
					
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setReg_date(rs.getTimestamp("reg_date"));
					member.setAddress(rs.getString("address"));
					member.setTel(rs.getString("tel"));
					
					
				}else {
					// DB�� passwd�� ������ �Ѱܿ� Pass�� �ٸ� �� ó���� �κ�
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� �о���� �� ���� �߻�");
		}finally {
			instance.close();
		}
		
		return member;		// member (LogonDataBean) : DTO�� Setter ���� �� 
	}
	
	// �������������� ������ ������ DB�� �����ϴ� �޼ҵ� (
	// ȸ�� ���� ���� ó�� (modifyPro.jsp)���� ȸ�������� ������ ó���ϴ� �޼ҵ�
	public int updateMember(LogonDataBean member) {
		int x=-1; 		// x = -1 : update ���н�
						// x = +1 : update ����
		
		// ID�� Passwd�� Ȯ�� �� ������Ʈ ����.
		
		SHA256 sha = SHA256.getInsatnce();		// ��ü Ȱ��ȭ
		
		try {
			
			String orgPass = member.getPasswd();
			String shaPass = sha.getSha256(orgPass.getBytes());
			
			String sql = "select passwd from member01 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member.getId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {		// �ش� ���̵� DB�� �����Ѵ�.
				// ������ �ѱ� �н������ DB���� ������ �н����尡 ��ġ�ϴ��� Ȯ�� �� ó��
				String dbpasswd = rs.getString("passwd");
				if(BCrypt.checkpw(shaPass, dbpasswd)) {		// �� �н����尡 ��ġ�� ��
					//DTO(member)���� ���� ���� DB�� UPDATE
					sql = "update member01 set name = ?, address = ?, tel = ? ";
							sql +=  "where id = ?";
					psmt = con.prepareStatement(sql);
					psmt.setString(1, member.getName());
					psmt.setString(2, member.getAddress());
					psmt.setString(3, member.getTel());
					
					psmt.executeUpdate();
					x= 1;	// update ������ x ������ 1�� �Ҵ�.
				}
				
			}else { 			// �ش� ���̵� DB�� �������� �ʴ´�.
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� ���� ������ ���� �߻�");
		}finally {
			instance.close();
		}
		
		return x;
	}
	
	// ȸ�� Ż�� ó�� (deletePro.jsp) ���� ȸ�� ���� ���� �޼ҵ�
	
	public int deleteMember(String id,  String passwd) {
		int x = -1; 		// x = -1 : ȸ�� Ż�� ����
							// x = 1 : ȸ�� Ż�� ����
		
		SHA256 sha = SHA256.getInsatnce();	// ��ü�� ȣ���ؼ� ������ �Ҵ�.
		
		try {
			
			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());
			
			String sql = "select passwd from member01 where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {		// id�� DB�� ����
				String dbPasswd = rs.getString("passwd");
				if(BCrypt.checkpw(shaPass, dbPasswd)) {		// password�� ��ġ�ϴ� ��� : delete
					sql = "delete member01 where id = ?";
					
					psmt = con.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.executeUpdate();
					x = 1; 			// delete ������ 
				}
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ȸ�� Ż��� ���ܰ� �߻� �߽��ϴ�.");
		}finally {
			instance.close();
		}
		
		return x;				// ������ x = 1, ���н� x = -1
	}
	
}
