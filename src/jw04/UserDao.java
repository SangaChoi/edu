package jw04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/UserDao")
public class UserDao extends HttpServlet {
	
	String dburl="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String dbuser="scott";
	String dbpwd="tiger";
	
	public UserDao() {
	}
	
	public void getUser(UserVO userVO) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(dburl, dbuser, dbpwd);
			
			pstmt=con.prepareStatement("SELECT id, pwd FROM users WHERE id=? AND pwd=?");
			pstmt.setString(1, userVO.getId());
			pstmt.setString(2, userVO.getPwd());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("db���� Ȯ���� id, pwd==>"+userVO.getId()+" : "+userVO.getPwd());
				userVO.setActive(true);
			}else {
				System.out.println("db�� <"+userVO.getId()+">�� �ش��ϴ� �ڷᰡ �����ϴ�.");
			}
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs !=null) {
					try {
						rs.close();
					}catch(Exception e1) {}
				}
				if(pstmt !=null) {
					try {
						pstmt.close();
					}catch(Exception e2) {}
				}
				if(con !=null) {
					try {
						con.close();
					}catch(Exception e3) {}
				}
			}
	}
}