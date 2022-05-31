package logon02;

import common.DBConnPool;
import java.sql.Date;
public class LogonDBBean extends DBConnPool {
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	
	
	public LogonDBBean( ) {super();};
	
	public void insertMember (LogonDataBean Member) {
		
		try {
			
			String orgPass = Member.getU_pass();
			
			System.out.println("암호화 되지 않은 패스워드 : " + orgPass);
			
			
			String sql = "insert into member02 values (?, ?, ?, ?, ?, ?, ?) ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, Member.getU_id());
			psmt.setString(2, Member.getU_pass());
			psmt.setString(3, Member.getU_name());
			psmt.setTimestamp(4, Member.getR_date());
			psmt.setString(5, Member.getU_address());
			psmt.setString(6, Member.getU_tel());
			psmt.setString(7, Member.getU_birthday());
			
			psmt.executeUpdate();
			
			System.out.println("회원 정보 DB 입력 성공");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("회원 정보 DB 입력시 예외 발생");
		}finally {
			
		}
	}
	
	public int userCheck(String u_id, String u_pass) {
		int x = 1;
		
		try {
			String orgPass = u_pass;
			
			String sql = "select u_pass from member02 where u_id = ? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String dbpass = rs.getString("u_pass");
				
				if(orgPass.equals(dbpass)) {
					x = 1;
				}else {
					x = 0;
				}
			}
			
			System.out.println("아이디와 패스워드 인증 성공 했습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디와 패스워드 인증 실패 했습니다.");
		}finally {
			
		}
		return x;
	}
	
	public int confirmId (String u_id) {
		int x = -1 ;    
		
		try {
			String sql = "select u_id from member02 where u_id = ?" ; 
			psmt = con.prepareStatement(sql); 
			psmt.setString (1,u_id); 
			rs = psmt.executeQuery();
			
			if ( rs.next()) {  
				
				System.out.println(u_id + " 는 존재 하는 ID 입니다.");
				 x= 1; 
			} else { 
				
				System.out.println(u_id + " 는 DB에 존재하지 않는 ID 입니다.");
				 x= -1 ; 
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(" ID 중복 체크중 예외 발생");
		}finally {
		
		}	
		return x ; 
	}
}
