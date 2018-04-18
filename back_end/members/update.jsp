<%@page pageEncoding = "UTF-8"%>
<%@page import = "java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");   //使用JDBC連結		
	try
	{
	   String url="jdbc:mysql://127.0.0.1/";
	   String sql;
	   Connection con = DriverManager.getConnection(url, "root", "1234");
	   
	   if(con.isClosed())
		out.print("connection failure");
	   else
	   {
		   			con.createStatement().execute("USE project");
if(session.getAttribute("ID") != null ){
    if(request.getParameter("id")!=null){
	sql = "UPDATE member SET pwd='"+request.getParameter("pwd")+"' WHERE ID='"+session.getAttribute("ID")+"'";
	con.createStatement().execute(sql);	
    sql = "UPDATE member SET ID='"+request.getParameter("id")+"' WHERE ID='"+session.getAttribute("ID")+"'";
	con.createStatement().execute(sql);

	out.print("更新成功!! 請<a href='user.jsp'>按此</a>回會員頁面!!");
	}
	else{
	out.print("更新失敗!! 請填寫完整，<a href='user.jsp'>按此</a>回會員頁面!!");
	}

}
else{
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="id" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>

<%
}
	   }

	   con.close();
	   	} //try   
	
	catch(SQLException sExec)
	{
		out.print("SQL錯誤！"+sExec.toString());
	}
	
}
catch(ClassNotFoundException err){
	out.print("Class錯誤"+err.toString());
}
%>