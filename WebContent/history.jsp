<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<title>��� ��ǰ ����</title>







</head>
<body>
	<���� �� ��ǰ>
<br>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		if (history != null) {
			String[] h = history.split(",");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
					String prodNo=h[i].substring(0,5);
					String fileName=h[i].substring(5);
%>


<a href="/product/getProduct?prodNo=<%=prodNo%>&menu=search"
	target="rightFrame">
	<img src="/images/uploadFiles/<%=fileName%>" style="width:80px;"><br/></a>
<br>
<%
				}
			}
		}
	}
%>

</body>
</html>