<%@page import="cn.sicnu.edu.test5.dao.impl.UserDaoimpl"%>
<%@page import="cn.sicnu.edu.test5.entity.User"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="cn.sicnu.edu.test5.entity.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
</head>
<body>

<% 
		request.setCharacterEncoding("utf-8");
		String name =request.getParameter("name");
		String account =request.getParameter("account");
		String password =request.getParameter("password");
		String email =request.getParameter("email");
		String describe =request.getParameter("personaldes");	
		UserDaoimpl userDaoimpl =new UserDaoimpl();
		if(name!=null ||account!=null ||password!=null ||email!=null ||describe!=null)
		{
				User user =new User(account,name,password,email,describe);
		     
				 if(!userDaoimpl.isExsitAccount(account))
				 {
					    userDaoimpl.insertAUser(user);
						//这儿实现成功注册和跳到登陆界面
					    request.getRequestDispatcher("signSuccess.html") .forward(request,response);
				         
				 }
				 else{
					//这儿实现失败的代码和返回注册界面
					String errorInformation = "你的账号可能已经被注册了";
					application.setAttribute("error", errorInformation);
					 response.sendRedirect("sign.html");
				 }
			
		}
		else{
			//这儿注册信息有问题和返回注册界面
			 String errorInformation = "你输入的信息可能有问题";
			application.setAttribute("error", errorInformation);
			 response.sendRedirect("sign.html");
		}     
%> 


</body>
</html>