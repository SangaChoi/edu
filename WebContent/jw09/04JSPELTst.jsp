<%@ page contentType="text/html; charset=EUC-KR"%>

<%session.setAttribute("client", new jw09.Client()); %>

name : ${sessionScope.client.name}<br/>
addr : ${client.addr}<br/>
age : ${client.age}<br/>

info 배열은 empty : ${empty client.info}<br/>
info 배열의 index0 value : ${sessionScope.client.info[0]}<br/>
info 배열의 index1 value : ${client.info[1]}<br/>