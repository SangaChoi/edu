<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page import="java.util.*" %>

<h3>4. ����(. , [] ) ������ ���</h3><p/>

<%-- �Ʒ������� Servlet Controller ��  ȭ�鱸�� ���� ObjectScope �� ���� �� �� ���� ���� --%>
<%
	// 1. page ObjectScope ����
	pageContext.setAttribute("abc",new String("page ObjectScope ����� ���ڿ�"));
	
	// 2. request ObjectScope ����
	request.setAttribute("abc",new String("request ObjectScope ����� ���ڿ�"));
	
	//3.1 session ObjectScope  (size() ==0��)  ArrayList ����
	session.setAttribute("abc",new ArrayList());
	
	// 3.2 session ObjectScope ���� ���� ArrayList ����
	ArrayList arrayList =new ArrayList();
	arrayList.add( new String("ArrayList  ����� ���ڿ�") );
	session.setAttribute("def",arrayList);
	
	// 4. Application ObjectScope ���� ���� HashMap ����
	HashMap hashMap = new HashMap();
	hashMap.put("zzz",new String("HashMap ����� ���ڿ�"));
	application.setAttribute("abc",hashMap);
%>

<!-- 
   	:: EL : ��ü ������ . �� [] �����ڸ� ����
   	:: EL : ObjectScope �� ��� �� �� �ִ� ��ü������ implicit Object ���� 
		page				==>pageScope,
		request			==>requestScope
		session			==> sessionScope
		application	==>applicationScop
-->

1. page ObjectScope<br/>
�� ${pageScope.abc}=${pageScope["abc"]}<br/>

3. session ObjectScope ���� : ����� ArrayList emptry ����<br/>
�� ${empty sessionScope.abc}=${empty ssessionScope["abc"]}<br/>

4.1 session n ObjectScope ���� : ����� ArrayList emptry ����<br/>
�� ${empty sessionScope.def}=${empty sessionScope["def"]}<br/>

4.2 session ObjectScope ����<br/>
�� ${sessionScope.def[0]}=${sessionScope["def"][0]}<br/>

5.1 applcation ObjectScope ���� : ����� HashMap empty ����<br/>
�� ${empty applicationScope.abc}=${empty applicationScope["abc"]}<br/>

5.2 application ObjectScope ����<br/>
�� ${applicationScope.abc.zzz}=${applicationScope["abc"].zzz}<br/>

Object Scope�� ������ �������� �ʰ� EL�� ��� abc ���ٽ�<br/>
${abc}<br/>