package member.model.dao;


import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.ArrayList;

import member.model.vo.Member;

public class MemberDao {
	
	public MemberDao() {}
	
	//로그인
	public Member loginCheck(Connection conn, String userid, String userpwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=? and userpwd=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setTypeNumber(rset.getInt("typenumber"));
				member.setUserName(rset.getString("username"));
				member.setUserPwd(userpwd);
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setGender(rset.getString("gender"));
				member.setBirth(rset.getDate("birth"));
				member.setEnrollDate(rset.getDate("enrolldate"));
				member.setUserOfile(rset.getString("userofile"));
				member.setUserRfile(rset.getString("userrfile"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//가입
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values(?,?,?,?,?,?,?,?,sysdate,null,null,'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setInt(2, member.getTypeNumber());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserPwd());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getGender());
			pstmt.setDate(8, member.getBirth());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//아이디 중복체크
	public int checkUserId(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) 
				result = 1;
			else
				result = 0;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	//탈퇴
	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set quityn='Y' where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//수정
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set userpwd=?,email=?,phone=? where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserPwd());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getUserId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				member.setUserId(userId);
				member.setUserName(rset.getString("username"));
				member.setUserPwd(rset.getString("userpwd"));
				member.setTypeNumber(rset.getInt("typenumber"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setGender(rset.getString("gender"));
				member.setBirth(rset.getDate("birth"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn){
		return null;
	}
	
	//내 문의내역
	public ArrayList<Member> selectMyQnaList(Connection conn, String userid) {
		return null;
	}
	
	//내 신청내역
	public ArrayList<Member> selectMyWishList(Connection conn, String userid) {
		return null;
	}
	
	//아이디찾기
	public Member selectMemberSearchId(Connection conn, String username, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where username=? and phone=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(rset.getString("userid"));
				member.setUserName(rset.getString("username"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//임시비밀번호 적용
	public void updateTempPwd(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		
		String query = "update member set userpwd=? where userid=?";
		
		//임시비밀번호 발생
		int index = 0;  
        char[] charSet = new char[] {  
                '0','1','2','3','4','5','6','7','8','9'    
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};  
          
        StringBuffer sb = new StringBuffer();  
        for (int i=0; i<6; i++) {  
            index =  (int)(Math.random()*charSet.length);  
            sb.append(charSet[index]);  
        }  
        
        String tempPwd = sb.toString();   
        
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tempPwd);
			pstmt.setString(2, userid);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	}

	//비밀번호 찾기
	public Member selectMemberSearchPwd(Connection conn, String userid, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=? and email=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				updateTempPwd(conn,userid);
				
				member = new Member();
				
				member.setUserId(rset.getString("userid"));
				member.setUserPwd(rset.getString("userpwd"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	
	
  
  	// 관리자용 dao************************************************************************************************
	// 관리자 전체 조회용
	public ArrayList<Member> selectAdminAll(Connection conn){
		ArrayList<Member> list = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select * from member where quityn = 'N') where typenumber between 4 and 5 order by typenumber desc, enrolldate desc, userid desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userid"));
				m.setUserName(rset.getString("username"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 관리자 추가용
	public int insertAdmin(Connection conn, Member member) {
		return 0;
	}
	
	// 관리자 수정용
	public int updateAdmin(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt= null;
		
		String query = "update member set userpwd = ?, phone = ?, email = ?, birth = ? where userid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setDate(4, m.getBirth());
			pstmt.setString(5, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 삭제용(quityn N -> Y)
	public int deleteAdmin(Connection conn, String userid) {
		int result = 0;
		Statement stmt = null;
		
		String query = "update member set quityn = 'Y' where userid = '" + userid + "'";
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}
	
	// 관리자 한명 검색용
	public ArrayList<Member> selectAdminOne(Connection conn, String searchtype, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select * from member where typenumber in (4, 5)) where " + searchtype + " like '%" + keyword + "%' order by enrolldate desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserId(rset.getString("userid"));
				m.setUserName(rset.getString("username"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	// 관리자 전체회원 조회용
	public ArrayList<Member> selectAll(Connection conn){
		ArrayList<Member> list = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset= null;
		
		String query = "SELECT * FROM (SELECT * FROM MEMBER WHERE QUITYN = 'N') WHERE TYPENUMBER BETWEEN 1 AND 3 ORDER BY ENROLLDATE DESC";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserName(rset.getString("username"));
				m.setUserId(rset.getString("userid"));
				m.setGender(rset.getString("gender"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 관리자 회원 검색용
	public ArrayList<Member> selectMemberSearch(Connection conn, String searchtype, String keyword, String gender, String typenumber){
		ArrayList<Member> list = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = null;
		
/*		경우의 수
 		1-1. 키워드 X, 성별전체, 회원유형 전체
		1-2. 키워드 X, 성별 O, 회원유형 전체
		1-3. 키워드 X, 성별 전체, 회원유형 O
			1-3.1 메인회면 이용자 신규회원용 typenumber=4
			1-3.2 메인화면 이용자 TOTAL용 typenumber=5
			1-3.3 메인화면 제작자 신규회원용 typenumber=6
		1-4. 키워드 X, 성별O, 회원유형O

		2-1. 키워드 O, 성별전체, 회원유형 전체
		2-2. 키워드 O, 성별 O, 회원유형 전체
		2-3. 키워드 O, 성별 전체, 회원유형 O
		2-4. 키워드 O, 성별O, 회원유형O*/
		
		if(keyword == null) {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 1-1
				query = "select * from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber in (1,2,3) order by enrolldate desc";
			
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 1-2
				query = "select * from (select * from member where quityn = 'N') where gender = '" + gender + "' and typenumber in (1,2,3) order by enrolldate desc";
			
			else if(gender.equals("ALL") && !typenumber.equals("ALL")) {	// 1-3
				if(typenumber.equals("4"))	// 메인화면 이용자 신규회원용
					query = "select * from (select * from member where quityn = 'N' and enrolldate = sysdate) where gender in ('F', 'M') and typenumber in (1,2) order by enrolldate desc";
				
				else if(typenumber.equals("5"))	// 메인화면 이용자 TOTAL용
					query = "select * from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber in (1,2) order by enrolldate desc";
				
				else if(typenumber.equals("6")) // 메인화면 제작자 신규회원용
					query = "select * from (select * from member where quityn = 'N' and enrolldate = sysdate) where gender in ('F', 'M') and typenumber = 3 order by enrolldate desc";
				else
				query = "select * from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber = " + typenumber + " order by enrolldate desc";
				
			}else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 1-4
				query = "select * from (select * from member where quityn = 'N') where gender = '" + gender + "' and typenumber = " + typenumber + " order by enrolldate desc";
		} else {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 2-1
				query = "select * from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber in (1,2,3) order by enrolldate desc";
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 2-2
				query = "select * from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber in (1,2,3) order by enrolldate desc";
			else if(gender.equals("ALL") && !typenumber.equals("ALL"))	// 2-3
				query = "select * from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber = " + typenumber + " order by enrolldate desc";
			else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 2-4
			query = "select * from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber = " + typenumber + " order by enrolldate desc";
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserName(rset.getString("username"));
				m.setUserId(rset.getString("userid"));
				m.setGender(rset.getString("gender"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 관리자 한명 출력용
		public Member selectAdminOneDetail(Connection conn, String userid) {
			Member m = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where userid = '" + userid + "'";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					m = new Member();
					
					m.setUserId(userid);
					m.setUserName(rset.getString("username"));
					m.setUserPwd(rset.getString("userpwd"));
					m.setPhone(rset.getString("phone"));
					m.setEmail(rset.getString("email"));
					m.setGender(rset.getString("gender"));
					m.setBirth(rset.getDate("birth"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return m;
		}
	
	// 관리자 회원 정보 수정용
	public int updateMemberAdmin(Connection conn, String userid) {
		return 0;
	}
	
	// 관리자 회원 삭제(강제탈퇴)용
	public int deleteMemberAdmin(Connection conn, String userid) {
		return 0;
	}
	
	// 관리자 이용자 신규회원(Sysdate) 검색용
	public ArrayList<Member> selectNewUserSystdate(Connection conn){
		ArrayList<Member> newUList = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where typenumber between 1 and 2 and enrolldate = sysdate";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userid"));
				newUList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return newUList;
	}
	
	// 관리자 제작자 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectNewMakerSystdate(Connection conn){
			ArrayList<Member> newMList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where typenumber = 3 and enrolldate = sysdate";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					newMList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return newMList;
		}
		

	// 관리자 이용자 전체회원 조회용
		public ArrayList<Member> selectAllUser(Connection conn){
			ArrayList<Member> totalUList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where typenumber between 1 and 2 and quityn = 'N'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					totalUList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return totalUList;
		}
		
	// 관리자 제작자 전체회원 조회용
		public ArrayList<Member> selectAllMaker(Connection conn){
			ArrayList<Member> totalMList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where typenumber = 3 and quityn = 'N'";
			
			try { 
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					
					totalMList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return totalMList;
		}

		
		

		

}
