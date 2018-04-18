<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<html>
<head>
<title>register</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
		String input_ID = request.getParameter("ID");
		
			
			
				sql = "DELETE FROM shopcar WHERE ID='"+input_ID+"'";
				con.createStatement().executeUpdate(sql);

				sql = "SELECT  * FROM shopcar";
				Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(sql);
				
				rs.last();
				int Cols = rs.getRow();
				int counti= 1;
				String countii="";
				while( counti <= Cols){
					rs.absolute(counti); //移到第n筆記錄
					rs.updateInt("No", counti); 
					
					rs.updateRow();
					counti++;
				}
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				
			
				out.println("<script>alert('刪除成功');</script>");
				response.setHeader("Refresh", "0; URL=../../html/shopcar.jsp") ;
			

%>
</body>
</html>