<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="jw04.UserVO" %>

<%
		request.setCharacterEncoding("EUC_KR");
		//response.setContentType("text/html;charset=EUC_KR");
		//PrintWriter out = res.getWriter();
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		//HttpSession session=request.getSession(true);
		
		UserVO userVO=(UserVO)session.getAttribute("userVO");
		System.out.println("session�� ����� userVO ���� Ȯ�� : "+userVO);
		
		
		
		if(!(id==null || id.equals(""))) {
			userVO=new UserVO();
			userVO.setId(id);
			userVO.setPwd(pwd);
			
			jw04.UserDataSourceDao userDataSourceDao=new jw04.UserDataSourceDao();
			userDataSourceDao.getUser(userVO);
		}
%>
		
		<html>
		<head></head>
		<body>
		<h2>Login ȭ��</h2>
		
		<%if(userVO !=null && userVO.isActive()) {%>
			<%=userVO.getId()%>�� ȯ���մϴ�.
			<%session.setAttribute("userVO", userVO);%>
		<%}else {%>
			Login ���� id, pwd�� Ȯ���ϼ���.
		<%} %>
		
		<p><p><a href='/edu/jw07/loginBeanDataSourceSessionJSP.html'>�ڷ�</a>
		</body>
		</html>