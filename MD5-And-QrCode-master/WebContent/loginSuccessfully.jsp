<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@page import="util.MD5"%>
<%@ page import="util.qrcode.QRTool"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
<style type="text/css">
.item {
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<%
	String userName = (String) session.getAttribute("userName");
%>
<body>
	<div class="item">
		<h1 style="color: red;">
			登陆成功，您的用户名是：<%=userName%></h1>
		<h2>您可以使用二维码转换网址的功能了！</h2>
		<form action="loginSuccessfully.jsp">
			<input
				style='width: 550px; height: 40px; background: none; border-radius: 9px; border-color: red; outline: none; padding-left: 10px;'
				type="text" name="address" placeholder="  请输入要转换成二维码的网址" size=50>
			<br> <br> <br> <input
				style='height: 40px; width: 100px; background: none; border-radius: 10px; border-color: red; outline: none;'
				type="submit" value="确定转换"> <input
				style='height: 40px; width: 100px; background: none; border-radius: 10px; border-color: red; outline: none;'
				type="button" value="修改密码"
				onclick="javascrtpt:window.location.href='changePassword.html'">
			<input
				style='height: 40px; width: 100px; background: none; border-radius: 10px; border-color: red; outline: none;'
				type="button" value="注销登陆"
				onclick="javascrtpt:window.location.href='logout.jsp'">
		</form>
		<%
			if (request.getParameter("address") != null) {
				if (!request.getParameter("address").equals("")) {
					String address = request.getParameter("address");
					String path = new File(request.getRealPath("loginSuccessfully.jsp")).getParent();
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

	</div>
</body>
</html>