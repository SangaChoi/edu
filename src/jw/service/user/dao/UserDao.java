package jw.service.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jw.common.dao.AbstractDao;
import jw.service.user.vo.UserVO;

public class UserDao extends AbstractDao{
	
	public UserDao() {
	}
	
	public void getUser(UserVO userVO) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=this.connect();			
			pstmt=con.prepareStatement("SELECT id, pwd FROM users WHERE id=? AND pwd=?");
			pstmt.setString(1, userVO.getId());
			pstmt.setString(2, userVO.getPwd());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("db에서 확인한 id, pwd==>"+userVO.getId()+" : "+userVO.getPwd());
				userVO.setActive(true);
			}else {
				System.out.println("db에 <"+userVO.getId()+">에 해당하는 자료가 없습니다.");
			}
			
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
			this.close(con, pstmt, rs);			
		}		
	}
	
	public boolean addUser(UserVO userVO) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		boolean insertResult=false;
		
		try {
			con=this.connect();
			pstmt=con.prepareStatement(	"insert " +
					"into users ( no, id, pwd) " +
					"values( ? , ? , ? )" );
			
			pstmt.setInt(1,userVO.getNo());
			pstmt.setString(2,userVO.getId());
			pstmt.setString(3,userVO.getPwd());
			
			if( 1 == pstmt.executeUpdate()){    
				insertResult=true;
			}
		}catch(Exception e){		
			e.printStackTrace();
		}finally {
			this.close(con, pstmt);
		}
		
		return insertResult;
	}
	
	public List<UserVO> getUserList(){
		
		List<UserVO> arrayList=new ArrayList<UserVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=this.connect();
			pstmt=con.prepareStatement("SELECT no,id,pwd FROM users ORDER BY no");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UserVO userVO=new UserVO();
				userVO.setNo(rs.getInt("no"));
				userVO.setPwd(rs.getString("pwd"));
				userVO.setId(rs.getString("id"));
				
				System.out.println(userVO);
				
				arrayList.add(userVO);
			}
		}catch(Exception e){		
			e.printStackTrace();
		}finally {
			this.close(con, pstmt);
		}
		
		return arrayList;
	}

}
