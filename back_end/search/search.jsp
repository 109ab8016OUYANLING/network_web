<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Back_End</title>
	<script type="text/javascript" src="../js/back_end.js"></script>
	<link href="../css/back_end.css" rel="stylesheet">
	<link href="../css/showmem.css" rel="stylesheet">
</head>
<body>

<div id="wrap">
	<!--以下header -->
	<div id="header">
		<div class="headleft">
			<a href="../back_end.jsp"><p>後台</p></a>
		</div>
<%
String BID = (String)session.getAttribute("ID");
if(BID!=null){
		out.print("<div class='headright'><ul><li><a href='#'>"+BID+"</a></li><li><a href='../members/logout.jsp'>登出</a></li></ul></div>");
}
%>
	</div>
	<!--以上header -->
	
	<!--以下leftbar -->
	<div id="leftbar">
		<div class="leftmenu">
			<ul>
				<li class="left_li_center"><a href="../members/showmem.jsp">會員管理</a></li>
				<li class="left_li_center"><a href="../product/product.jsp">產品管理</a></li>
				<li class="left_li_center"><a href="../order/order.jsp">訂單管理</a></li>
			</ul>
		</div>
	</div>
	<!--以上leftbar -->
	
	<!--以下content -->
	<div id="content">
		<div class="pagetitle">
			<h2>會員一覽</h2>
		</div>
		
		<div class="showsearch">
			<form action="../search/search.jsp" method="POST">
				<input type="text" name="search" placeholder="Search..">
			</form>
		</div>
		
		<div class="showall">
<%
		int n = 1;
		String nn="";
		String search = request.getParameter("search");

		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			
			con.createStatement().execute("USE project");

			 
			sql = "SELECT  No,ID, pwd, name, gender, birth,address, e_mail, tel FROM member WHERE ID LIKE '%"+search+"%' ";
			ResultSet tmp = con.createStatement().executeQuery(sql);
%>
<table class="showtable" >
<tr class="showtrbg">
<td>NO.</td><td>會員帳號</td>	<td>會員密碼</td>	<td>名稱</td>	<td>性別</td>	<td>生日</td>	<td>住址</td>	<td>e-mail</td>	<td>電話</td><td>修改</td><td>刪除</td>
</tr>

<%			
			while(tmp.next())
			{
				nn=tmp.getString(1);
				if(n%2!=0){
				  out.print("<tr class='showtrgray'>");
				  out.print("<form action='../members/showmem.jsp' method='POST'>");
				  out.print("<td>"+n+"<input type='hidden' name='num' value='"+nn+"'></td>");
				for(int i=2; i<=9; i++)
				{
					if ( i==5 ){
						out.print("<td><select name='a"+(i-1)+"'><option value='"+tmp.getString(i)+"'>"+tmp.getString(i)+"</option><option value='男'>男</option><option value='女'>女</option></select></td>");
					}
					else if (i==6){
						out.print("<td><input type='date' name='a"+(i-1)+"' value='"+tmp.getString(i)+"' min='1900-01-01' max='2017-06-17'></td>");
					}
					else{
					out.print("<td><input class='godlike' type='text' name='a"+(i-1)+"' value='"+tmp.getString(i)+"' required></td>");
					}

 				}
				out.print("<td><input type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input type='submit' name='submit' value='delete' /></td>");
				out.print("</form>");
				out.print("</tr>");
				}
				else{
				out.print("<tr class='showtrbg2'>");
				out.print("<form action='../members/showmem.jsp' method='POST'>");
				out.print("<td>"+n+"<input type='hidden' name='num' value='"+nn+"'></td>");
				
				for(int i=2; i<=9; i++)
				{
					if ( i==5 ){
						out.print("<td><select name='a"+(i-1)+"'><option value='"+tmp.getString(i)+"'>"+tmp.getString(i)+"</option><option value='男'>男</option><option value='女'>女</option></select></td>");
					}
					else if (i==6){
						out.print("<td><input type='date' name='a"+(i-1)+"' value='"+tmp.getString(i)+"' min='1900-01-01' max='2017-06-17'></td>");
					}
					else{
					out.print("<td><input class='godlike' type='text' name='a"+(i-1)+"' value='"+tmp.getString(i)+"' required></td>");
					}
 				}
				out.print("<td><input type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input type='submit' name='submit' value='delete' /></td>");
				out.print("</form>");
				
				out.print("</tr>");
					
				}
				n++;
			}

%>
</table>
<%
			

		}

%>
		</div>
	</div>
	<!--以上content -->

</div>


</body>
</html>