<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="client" value="<%=new jw09.Client()%>" scope="session"/>

1.session ObjectScope 저장된 client 객체의 name : ${sessionScope.client.name}<br/>
2.session ObjectScope 저장된 client 객체의 addr : ${client.addr}<br/>
3.session ObjectScope 저장된 client 객체의 age : ${client.age}<br/>
4.session ObjectScope 저장된 client 객체의 info 배열은 empty : ${empty client.info}<br/>
5.1 info 배열의 index 0 value : ${sessionScope.client.info[0]}<br/>
5.2 info 배열의 index 1 value : ${client.info[1]}<br/><hr/>

<h3>#스크립트렛 이용 ObjectScope에 저장된 Bean 접근</h3>
<%
jw09.Client c=(jw09.Client)session.getAttribute("client");
out.println("이름 : "+c.getName()+"<br/>");
out.println("주소 : "+c.getAddr());
%><br/><hr/>

<c:set var="test" value="${client}" scope="session"/>

<h3>#EL 이용 ObjectScope에 저장된 Bean 접근</h3>
1.session ObjectScope에 저장된 client 객체 name : ${client.name}<br/>
1.session ObjectScope에 저장된 test 객체 name : ${test.name}<br/>

<c:set target="${test}" property="name" value="이순신"/>
2.session ObjectScope에 저장된 client 객체 name : ${client.name}<br/>
2.session ObjectScope에 저장된 test 객체 name : ${test.name}<br/><hr/>

remove 전 client 객체는 empty : ${empty sessionScope.client}<br/>
<c:remove var="client" scope="session"/>
remove 후 clinet 객체 empty : ${empty client}<br/><hr/>
remove 하지 않은 test 객체 empty : ${empty test}<br/><hr/>