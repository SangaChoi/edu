<%@ page contentType="text/html; charset=EUC-KR"%>

<%session.setAttribute("client", new jw09.Client()); %>

name : ${sessionScope.client.name}<br/>
addr : ${client.addr}<br/>
age : ${client.age}<br/>

info �迭�� empty : ${empty client.info}<br/>
info �迭�� index0 value : ${sessionScope.client.info[0]}<br/>
info �迭�� index1 value : ${client.info[1]}<br/>