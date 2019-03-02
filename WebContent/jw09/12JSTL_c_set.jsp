<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="client" value="<%=new jw09.Client()%>" scope="session"/>

1.session ObjectScope ����� client ��ü�� name : ${sessionScope.client.name}<br/>
2.session ObjectScope ����� client ��ü�� addr : ${client.addr}<br/>
3.session ObjectScope ����� client ��ü�� age : ${client.age}<br/>
4.session ObjectScope ����� client ��ü�� info �迭�� empty : ${empty client.info}<br/>
5.1 info �迭�� index 0 value : ${sessionScope.client.info[0]}<br/>
5.2 info �迭�� index 1 value : ${client.info[1]}<br/><hr/>

<h3>#��ũ��Ʈ�� �̿� ObjectScope�� ����� Bean ����</h3>
<%
jw09.Client c=(jw09.Client)session.getAttribute("client");
out.println("�̸� : "+c.getName()+"<br/>");
out.println("�ּ� : "+c.getAddr());
%><br/><hr/>

<c:set var="test" value="${client}" scope="session"/>

<h3>#EL �̿� ObjectScope�� ����� Bean ����</h3>
1.session ObjectScope�� ����� client ��ü name : ${client.name}<br/>
1.session ObjectScope�� ����� test ��ü name : ${test.name}<br/>

<c:set target="${test}" property="name" value="�̼���"/>
2.session ObjectScope�� ����� client ��ü name : ${client.name}<br/>
2.session ObjectScope�� ����� test ��ü name : ${test.name}<br/><hr/>

remove �� client ��ü�� empty : ${empty sessionScope.client}<br/>
<c:remove var="client" scope="session"/>
remove �� clinet ��ü empty : ${empty client}<br/><hr/>
remove ���� ���� test ��ü empty : ${empty test}<br/><hr/>