<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page isELIgnored="false" %>

문자 : ${"홍길동"}<br/>

문자+숫자 : ${"1"+2}<br/>


<%--문자+숫자 : ${"홍"+2}<br/>--%>

10==10 : ${10==10}<br/>

조건 ? true:false = ${10>100 ? "10이 100보다 크다 true" : "10이 100보다 작다 false"}<br/>

${empty null}<br/>
${empty " "}<br/>
${empty ""}<br/>