<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Function</title>
</head>
<body>
	<%
		String userName = request.getParameter("userName");
		String accountNumber = request.getParameter("accountNumber");
		String password = request.getParameter("password");
		boolean successFlag = true;
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		try {
			Scanner sc = new Scanner(new File("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt"));
			while (sc.hasNextLine()) {
				String line = sc.nextLine();
				String ss[] = line.split("\\s+");
				if (ss[0].equals(accountNumber)) {
					successFlag = false;
					break;
				}
			}
			sc.close();
		} catch (Exception e) {
		}
		if (successFlag) {
			if (accountNumber.matches(regex)) {
				try {
					PrintWriter pw = new PrintWriter(new FileWriter("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt", true));
					pw.println(accountNumber + " " + password + " " + userName);
					pw.close();
					%>
					<script>
						alert("注册成功，返回登陆界面");
						window.location.href = "login.html";
					</script>
					<%
				} catch (Exception e) {
				}
			} else {
			%>
			<script>
				alert("请输入正确的邮箱");
				window.location.href = "Register.html";
			</script>
			<%
			}
		} else {
			%>
			<script>
				alert("此邮箱已经被注册，返回登陆界面");
				window.location.href = "login.html";
			</script>
			<%
		}
	%>
</body>
</html>