<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>

1. pageContext EL request URI : ${pageContext.request.requestURI}<br/>

2. pageContext EL session id : ${pageContext.session.id}<br/>

3. Expression tag 사용 : <%=pageContext.getSession().getId()%><br/>

4. 이름 : <%=request.getParameter("name")%><br/>

5. 주소 : ${param.addr}<br/>

<% String[] sw=request.getParameterValues("sw");%>
6. 선택한 sw : <%=sw[0]%><br/>
6. 선택한 sw : ${paramValues.sw[1]}<br/>
6. 선택한 sw : ${paramValues.sw[2]}<br/>

7. 쿠키에 저장된 JSESSION name : ${cookie.JSESSIONID.name}<br/>
7. 쿠키에 저장된 JSESSION value : ${cookie.JSESSIONID.value}<br/>