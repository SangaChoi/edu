package jw04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Login extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
	
		
		req.setCharacterEncoding("EUC_KR");
		res.setContentType("text/html;charset=EUC_KR");
		PrintWriter out = res.getWriter();
		
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");

//=============JDBC 시작	
		String fromDbId=null;
		String fromDbPwd=null;
		
		try {
			String dburl="jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbuser="scott";
			String dbpwd="tiger";
			
			//Connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(dburl, dbuser, dbpwd);
			
			//Statement
			PreparedStatement pstmt=con.prepareStatement("SELECT id, pwd FROM users WHERE id=?");
			pstmt.setString(1, id);
			
			//ResultSet
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				fromDbId=rs.getString("id");
				fromDbPwd=rs.getString("pwd");
				System.out.println("db에서 확인한 id, pwd==>"+fromDbId+" : "+fromDbPwd);
			}else {
				System.out.println("db에서 client에서 입력한<"+id+">와 <"+pwd+">가 없습니다.");
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			System.out.println("==> JDBC 관련 Exception 발생한 모양<==");
			e.printStackTrace();
		}
//================JDBC 종료	
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<h2>Login 확인</h2>");
		
//DBMS Data와 Client Form Data 비교 회원유무 판단		
		if(fromDbId !=null && fromDbPwd !=null && fromDbId.equals(id) && fromDbPwd.equals(pwd)) {
			out.println(id+"님 환영합니다.");
		}else {
			out.println("id, pwd를 확인하세요.");
		}
		
		out.println("<p><p><a href='/edu/jw04/login.html'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
}

