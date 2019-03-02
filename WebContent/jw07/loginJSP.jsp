<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ page import="java.sql.*" %>

<%

request.setCharacterEncoding("EUC_KR");
//response.setContentType("text/html;charset=EUC_KR");
//PrintWriter out = res.getWriter();

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

//=============JDBC ����	
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
		System.out.println("db���� Ȯ���� id, pwd==>"+fromDbId+" : "+fromDbPwd);
	}else {
		System.out.println("db���� client���� �Է���<"+id+">�� <"+pwd+">�� �����ϴ�.");
	}
	
	rs.close();
	pstmt.close();
	con.close();
	
}catch(Exception e) {
	System.out.println("==> JDBC ���� Exception �߻��� ���<==");
	e.printStackTrace();
}
//================JDBC ����
%>

<html>
<head></head>
<body>
<h2>Login Ȯ��</h2>

<!-- //DBMS Data�� Client Form Data �� ȸ������ �Ǵ�	-->	
<%if(fromDbId !=null && fromDbPwd !=null && fromDbId.equals(id) && fromDbPwd.equals(pwd)) {%>
	<%=id%>�� ȯ���մϴ�.
<%}else {%>
	id, pwd�� Ȯ���ϼ���.
<%}%>

<p><p><a href='/edu/jw04/login.html'>�ڷ�</a>
</body>
</html>