package membership03;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{
	
	public MemberDAO() {
		super();
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member03 where id = ? and pass = ?" ;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
				dto.setGrade(rs.getString("grade"));
				
				System.out.println("인증 성공");
			}else {
				System.out.println("인증 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("ID, PASS 확인시 예외 발생");
		}
		
		return dto;
	}
}
