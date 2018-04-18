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
		String no = request.getParameter("no");
		int count = Integer.parseInt(no);
		int n = 1;
			
			
				sql = "SELECT * FROM shopcar WHERE ID='"+input_ID+"'";
				Statement s = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet tmp = s.executeQuery(sql);
				while(tmp.next())
				{
					if(n==count){
						tmp.deleteRow();
						out.println(tmp.getRow());
					}
					n++;
				}
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
				if (tmp != null) tmp.close();
				if (s != null) s.close();
			
				out.println("<script>alert('刪除成功');</script>");
				response.setHeader("Refresh", "0; URL=../../html/shopcar.jsp") ;
			

%>
</body>
</html>