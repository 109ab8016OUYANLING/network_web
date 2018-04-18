<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<html>
<head>
<title>register</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
		String input_ID = (String)session.getAttribute("ID");
		String arr_name []  = new String[12];	
		String arr_num []  = new String[12];
		/*
		arr_num [0] = request.getParameter("q1");
		arr_num [1] = request.getParameter("q2");
		arr_num [2] = request.getParameter("q3");
		arr_name [0] = request.getParameter("na1");
		arr_name [1] = request.getParameter("na2");
		arr_name [2] = request.getParameter("na3");
		*/
		int No = Integer.valueOf(request.getParameter("No"));
		int n = 0;
		int np;
		if(input_ID==null){
			out.println("<script>alert('請先登入');</script>");
			response.setHeader("Refresh", "0; URL=user.html") ;
		}
		else{
			
		
			  for(int i = 0 ; i < No ; i++){
				  n=i+1;
				 arr_name[i]= request.getParameter("na"+n);
				 arr_num[i]= request.getParameter("q"+n);

				sql="UPDATE shopcar SET num = '"+arr_num[i]+"' WHERE name = '"+arr_name[i]+"' AND ID='"+input_ID+"'";
				con.createStatement().execute(sql); //執行成功傳回false
	

			}
				response.setHeader("Refresh", "0; URL=../../html/order.jsp") ;
		}
%>
</body>
</html>
