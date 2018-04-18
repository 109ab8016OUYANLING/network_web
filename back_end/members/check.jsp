<html>
<head>
<%@page pageEncoding = "UTF-8"%>
<%@page import = "java.sql.*"%>
</head>
<body>
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

           if(request.getParameter("id") != null && request.getParameter("password") != null)
		   {
			   sql = "SELECT * FROM member WHERE ID=? AND pwd=?";
			   
			   PreparedStatement pstmt = null;
			   pstmt = con.prepareStatement(sql);
			   pstmt.setString(1,request.getParameter("id"));
			   pstmt.setString(2,request.getParameter("password"));
			   
			   ResultSet paperrs = pstmt.executeQuery();
			   
			   if(paperrs.next())
			   {
				   session.setAttribute("ID",request.getParameter("id"));
					if(	request.getParameter("id").equals("wuchi")	){
				    response.sendRedirect("../back_end.jsp");
					}
					else{
				   response.sendRedirect("../../html/totalproduce.jsp");
				   }
			   }
			   
			   else
				   out.print("帳號密碼錯誤！<a href='../../html/user.html'>按此</a>重新登入");
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
</body>
</html>