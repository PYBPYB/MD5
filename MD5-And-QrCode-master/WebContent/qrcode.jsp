<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@page import="util.MD5"%>
<%@ page import="util.qrcode.QRTool"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (request.getParameter("address") != null) {
			if (!request.getParameter("address").equals("")) {
				String address = request.getParameter("address");
				String path = "d:";
				String qrcode = MD5.md5(new Date().getTime() + "") + ".jpg";
				QRTool.url2qrcode(address, path, qrcode);
	%>
	<div>
		<img src="<%=qrcode%>" width="400" height="400" />
	</div>
	<%
		} else {
	%>
	<script>
		alert("请输入网址!!!!");
		window.location.href = "loginSuccessfully.jsp";
	</script>
	<%
		}
		}
	%>

</body>
</html>