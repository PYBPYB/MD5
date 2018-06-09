<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ChangePassword Function</title>
</head>
<%
	String userName = (String) session.getAttribute("userName");
%>
<body>
	<%
		String oldPassword = request.getParameter("oldPassword");
		String password = request.getParameter("password");
		boolean successFlag = false;
		try {
			Scanner sc = new Scanner(new File("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt"));
			while (sc.hasNextLine()) {
				String line = sc.nextLine();
				String ss[] = line.split("\\s+");
				if (ss[2].equals(userName) && ss[1].equals(oldPassword)) {
					successFlag = true;
					break;
				}
			}
			sc.close();
		} catch (Exception e) {
		}
		if (successFlag) {
			try {
				Scanner sc = new Scanner(new File("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt"));
				PrintWriter pw = new PrintWriter(
						new FileWriter("D:/J_File/MD5-And-QrCode-master/WebContent/images/swap.txt", false));
				while (sc.hasNextLine()) {
					String line = sc.nextLine();
					String ss[] = line.split("\\s+");
					if (ss[2].equals(userName) && ss[1].equals(oldPassword)) {
						pw.println(ss[0] + " " + password + " " + ss[2]);
					} else {
						pw.println(line);
					}
				}
				sc.close();
				pw.close();
			} catch (Exception e) {
			}
			try {
				Scanner scc = new Scanner(new File("D:/J_File/MD5-And-QrCode-master/WebContent/images/swap.txt"));
				PrintWriter pww = new PrintWriter(
						new FileWriter("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt", false));
				while (scc.hasNextLine()) {
					String line = scc.nextLine();
					pww.println(line);
				}
				scc.close();
				pww.close();
			} catch (Exception e) {
			}
	%>
	<script>
		alert("修改成功，返回登陆界面");
		window.location.href = "login.html";
	</script>
	<%
		} else {
	%>
	<script>
		alert("密码错误，请输入正确的密码");
		window.location.href = "changePassword.html";
	</script>
	<%
		}
	%>
</body>
</html>