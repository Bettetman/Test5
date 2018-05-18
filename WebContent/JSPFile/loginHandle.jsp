<%@page import="cn.sicnu.edu.test5.dao.impl.UserDaoimpl"%>
<%@page import="javax.print.attribute.standard.MediaSize.Other"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="cn.sicnu.edu.test5.entity.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆是否成功</title>
</head>
<body>

<%
            request.setCharacterEncoding("utf-8");
			String account =request.getParameter("account");
			String password =request.getParameter("password");
			
			UserDaoimpl userDaoimpl =new UserDaoimpl();
			
			out.print(account);
			out.print(password);
			
			if(account!=null || password!=null)
			{
				out.print(userDaoimpl.isExsitAccount(account));
				//注册美问题
				if(userDaoimpl.isExsitAccount(account))
				{
					//成功
					
					out.print("sg");
					
					if(userDaoimpl.getUserByAccount(account).getPassword().equals(password))
					{
						out.print("<div>match</div>");
			//			session.setAttribute("account", getOnePerson(account,vector));
			//			 request.getRequestDispatcher("test2.html") .forward(request,response);
					}
					else{
						out.print("mimabudui");
			//			response.sendRedirect("sign.html");
					}
					
				
					
				}
				else{
					out.print("bucunzai");
					//失败回到注册界面
		//			response.sendRedirect("login.html");
				}
			}
			else
			{
				out.print("mimasuocuo");
				
				//返回登陆界面
		//		response.sendRedirect("sign.html");
			}
%>
</body>
</html>