<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("EUC_KR");%>

1. c:forEach 이용 Array 전송되는 ParamValues 출력<br/>
<c:forEach var="i" items="${paramValues.sw}" begin="0" step="1">
ㅇ 선택하신 SW는 : ${i}<br/>
</c:forEach><br/>

2. c:forEach 이용 Array 전송되는 ParamValues 출력<br/>
<c:forEach var="i" items="${paramValues.sw}">
ㅇ 선택하신 SW는 : ${i}<br/>
</c:forEach><br/>

3. c:forEach 이용 Map으로 전송되어 오는 Param<br/>
<c:forEach var="i" items="${param}">
ㅇ${i.key} : ${i.value}<br/>
</c:forEach><br/>

4. c:forEach 이용 Map으로 전송되어 오는 Param<br/>
<c:forEach var="i" items="${param}">
	<c:if test="${!empty param.name }">
ㅇ${param.name}님의 나이는 ${param.age}입니다.<br/>
	</c:if>
</c:forEach><br/>

5. c:forEach 이용 Map으로 전송되어 오는 Param<br/>
<c:forEach var="i" items="${param}">
<c:if test="${i.key=='name'}">
ㅇ${param.name}님의 나이는 ${param.age}입니다.<br/>
	</c:if>
</c:forEach><br/>
