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
	    String input_ID = request.getParameter("ID");
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
			
           	sql = "SELECT * FROM member WHERE ID=?";   
			PreparedStatement pstmt = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,input_ID);   
			ResultSet paperrs = pstmt.executeQuery();
			if(!paperrs.next()){
				sql="select * from member";
				ResultSet rs=con.createStatement().executeQuery(sql);
				int n;
				rs.last();
				n=rs.getRow()+1;
			sql = "INSERT member(No,ID,pwd,name,gender,birth,address,e_mail,tel) " +
                                 "VALUES ('"+n+"','"
								 +input_ID+"','"+input_pwd+"','"
								 +input_name+"','"+input_gender+"','"+input_birth+"','"
								 +input_address+"','"+input_e_mail+"','"+input_tel+"')";
			 boolean no= con.createStatement().execute(sql); //執行成功傳回false
				if (!no){
					out.println("<script>alert('創建成功');</script>");
					response.setHeader("Refresh", "0; URL=../../html/user.html") ;
				}
					
				else
					out.println("新增失敗");  
			}
			else{
				out.println("<script>alert('帳號重複');</script>");
				response.setHeader("Refresh", "0; URL=../../html/register.jsp") ;
				
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