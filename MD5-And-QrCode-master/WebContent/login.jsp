<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Function</title>
</head>
<body>
	<%
	String accountNumber=request.getParameter("accountNumber");
	String password=request.getParameter("password");
	String userName="";
	boolean find=false;
	
	try{
		Scanner sc = new Scanner(new File("D:/J_File/MD5-And-QrCode-master/WebContent/images/userlist.txt"));
		while(sc.hasNextLine()){
			String line=sc.nextLine();
			String ss[]=line.split("\\s+");
			if(ss[0].equals(accountNumber)&&ss[1].equals(password)){
				find = true;
				userName=ss[2];
				break;
			}
		} 
		sc.close();
	}catch(Exception e){
	}
	
	if(find){
		session.setAttribute("userName", userName);
		response.sendRedirect("loginSuccessfully.jsp?");
	}else{
		response.sendRedirect("login.html");
	}
%>
</body>
</html>