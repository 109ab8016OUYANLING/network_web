<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<html>
<head>
<title>register</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/";
		String sql;
		Connection con=DriverManager.getConnection(url,"root","1234");
		boolean sameid = false;
		String ID = (String)session.getAttribute("ID");
		String input_pwd = request.getParameter("pwd");
		String input_name = request.getParameter("name");
		String input_gender = request.getParameter("gender");
		String input_birth = request.getParameter("birth");
		String input_address = request.getParameter("address");
		String input_e_mail = request.getParameter("e_mail");
		String input_tel = request.getParameter("tel");
		
		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			con.createStatement().execute("USE project");
			
           	
			if(ID!=null){
				
					sql="UPDATE member SET pwd= '"+input_pwd+"',name = '"+input_name+"' ,gender = '"+input_gender+"',birth = '"+input_birth+"',address = '"+input_address+"',e_mail='"+input_e_mail+"',tel='"+input_tel+"' WHERE ID = '"+ID+"'";
				
			
			 boolean no= con.createStatement().execute(sql); //執行成功傳回false
				if (!no){
					out.println("<script>alert('修改成功');</script>");
					response.setHeader("Refresh", "0; URL=introduce.jsp") ;
				}
					
				else
					out.println("新增失敗");  
			}
			
		}
		con.close();
	}
	catch(SQLException sExec){
		out.println("SQL錯誤"+sExec.toString());
	}
}
catch(ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}
%>
</body>
</html>