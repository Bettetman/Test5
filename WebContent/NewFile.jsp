<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>     
<%@ page import="java.sql.*" %>     
<%@ page import="javax.naming.*" %>     
<%@ page import="javax.sql.DataSource" %>
<html>     
<head>     
<title>JNDI!</title>    
</head>    
  <body>      
   Tomcat连接池测试,获取数据源 <br>     
    <%     
        try {      
            //初始化查找命名空间
            Context ctx = new InitialContext();  
            //参数java:/comp/env为固定路径   
            Context envContext = (Context)ctx.lookup("java:/comp/env"); 
            out.print("1<br>");
            //参数jdbc/mysqlds为数据源和JNDI绑定的名字
            DataSource ds = (DataSource)envContext.lookup("jdbc/JDBCpool"); 
           out.print("2<br>");
            Connection conn = ds.getConnection();     
             Statement stat = conn.createStatement();
            ResultSet re =stat.executeQuery("select * from users ");
            if (re.next())
            {
            	out.print(re.getInt(1));
            	out.print(re.getString(2));
            	out.print(re.getString(3));
            	out.print(re.getString(4));
            	
            } 
            conn.close();     
            out.println("<span style='color:red;'>JNDI测试成功<span>");     
        } catch (NamingException e) {     
            e.printStackTrace();     
        } catch (SQLException e) {     
            e.printStackTrace();     
        }     
    %>     
  </body>     
</html>