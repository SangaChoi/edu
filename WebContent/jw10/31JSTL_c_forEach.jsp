<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>::c:forEach 이용 구구단 출력</h3>

<c:forEach var="i" begin="2" end="9" step="2">
	[${i}]단을 출력합니다.<br/>
	<c:forEach var="j" begin="1" end="10" step="1">
		${i}*${j}=${i*j }<br/>
	</c:forEach>
	<br/>
</c:forEach>

<%
java.util.Vector vector=new java.util.Vector();
vector.add("A");
vector.add("B");
vector.add("C");
vector.add("D");

System.out.println("===================");
for(Object obj:vector){
System.out.println((String)obj);
}
System.out.println("===================");
%>

<c:forEach var="i" items="<%=vector%>" begin="0" step="1" end="10">
::Vector 저장정보 추출 : ${i }<br/>
</c:forEach><br/>

<c:forEach var="i" items="<%=vector%>" begin="1" step="1">
::Vector 저장정보 추출 : ${i }<br/>
</c:forEach><br/>

<c:forEach var="i" items="<%=vector%>" begin="0" step="2">
::Vector 저장정보 추출 : ${i }<br/>
</c:forEach><br/>

<c:forEach var="i" items="<%=vector%>" begin="0" step="1" end="1">
::Vector 저장정보 추출 : ${i }<br/>
</c:forEach><hr/>

<h3>4. key=value 형식의 map의 value 접근</h3><br/>
<%
java.util.HashMap hm=new java.util.HashMap();
hm.put("a","A");
hm.put("b","B");
hm.put("c","C");
hm.put("d","D");
%>

<c:forEach var="i" items="<%=hm %>">
::HashMap에 저장된 내용은 : ${i.key }=${i.value }<br/>
</c:forEach><br/><hr/>

<h3>5. EL/c:set, c:if를 동시 사용</h3><br/>
<c:set var="aaa" value="<%=hm %>"/>
<c:forEach var="i" items="${aaa}">
<c:if test="${i.key=='a'}">
::key a의 value : ${i.value}
</c:if>
</c:forEach>



















