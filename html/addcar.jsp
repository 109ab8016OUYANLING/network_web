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
		String input_img = request.getParameter("img");
		String input_name = request.getParameter("name");
		String input_price = request.getParameter("price");
		String input_num = request.getParameter("quantity");
		String ID = (String)session.getAttribute("ID");
		String ck="";
		boolean che=false;
		int n = 0;
			sql="select * from shopcar WHERE ID='"+input_ID+"' AND name ='"+input_name+"'";
			ResultSet check=con.createStatement().executeQuery(sql);
			if(ID==null){
				out.println("<script>alert('請先登入!^^');</script>");
				response.setHeader("Refresh", "0; URL=../../html/user.html") ;
			}
			else{
				while(check.next()){
				ck=check.getString("name");
				}
				if(ck.equals(input_name)){
				 
				 out.println("<script>alert('已加入購物車囉!^^');</script>");
				 response.setHeader("Refresh", "0; URL=../../html/totalproduce.jsp") ;
				}
				else{
				sql="select * from shopcar";
				ResultSet rs=con.createStatement().executeQuery(sql);
				int np;
				rs.last();
				np=rs.getRow()+1;
				sql = "INSERT shopcar(No,ID,img,name,price,num) " +
                  "VALUES ('"+np+"','"+input_ID+"','"+input_img+"','"+input_name+"','"+input_price+"','"+input_num+"')";
				con.createStatement().execute(sql); //執行成功傳回false
				out.println("<script>alert('加入成功');</script>");
				response.setHeader("Refresh", "0; URL=../../html/totalproduce.jsp") ;
				}
			}

%>
</body>
</html>