<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Back_End</title>
	<script type="text/javascript" src="../js/back_end.js"></script>
	<link href="../css/back_end.css" rel="stylesheet">
	<link href="../css/pro.css" rel="stylesheet">
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
			<h2>產品一覽</h2>
		</div>
		
		<div class="showsearch">
			<form action="../search/searchp.jsp" method="POST">
				<input type="text" name="search" placeholder="Search..">
			</form>
		</div>
		<div class="newp">
		<h3>產品新增</h3>
			<form action="../product/product.jsp" method="POST">
			<table class="showtable" >
				<tr class="showtrbg">
					<td>圖片路徑</td>	<td>名稱</td>	<td>價格</td>	<td>庫存</td> <td>介紹</td> <td>新增</td>
				</tr>
				<tr class="showtrbg">
					<td><input class="np" type="text" name="psrc" placeholder="Src.."></td>	
					<td><input class="np" type="text" name="pname" placeholder="Name.."></td>	
					<td><input class="np" type="text" name="pprice" placeholder="Price.."></td>	
					<td><input class="np" type="text" name="pnum" placeholder="Num.."></td> 
					<td><input class="np" type="text" name="pcontent" placeholder="content.."></td> 
					<td><input class="np" type="submit" name="newp" value="add"></td>
				</tr>
			</table>
			</form>
		</div>
		<div class="showall">
<%
		int n = 1;
		String checked="";
		String nn="";
		String search = request.getParameter("search");
		int len = search.length();
		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			
			con.createStatement().execute("USE project");

			 
			sql = "SELECT No,img,name,price,num,YN FROM product WHERE name LIKE '%"+search+"%' ";
			ResultSet tmp = con.createStatement().executeQuery(sql);
%>
<table class="showtable" >
<tr class="showtrbg">
<td>NO.</td><td>圖片</td><td>圖片路徑</td>	<td>名稱</td>	<td>價格</td>	<td>庫存</td> <td>修改</td><td>刪除</td> <td>上架</td>
</tr>

<%			
			while(tmp.next())
			{
				
				if(n%2!=0){
				out.print("<tr class='showtrgray'>");
				out.print("<form action='../product/product.jsp' method='POST'>");
				out.print("<td class='no'>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				for(int i=2; i<=6; i++)
				{
					if(i==2){
					out.print("<td class='pimg'><img class='pimg' src='"+tmp.getString(2)+"' ></td><td class='pimg'><input  class='godlike' style='font-size:20px' type='text'  name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==4||i==5){
					out.print("<td class='god'><input class='god'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==6){
						checked=tmp.getString("YN");
					}
					else{
					out.print("<td class='godlo'><input class='godlike'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
	
					
 				}
				out.print("<td><input class='godlike' type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input class='godlike' type='submit' name='submit' value='delete' /></td>");
				if(checked.equals("Y")){
				out.print("<td><input type='checkbox' name='YN' value='"+tmp.getString("No")+"' checked></td>"); 
				}
				else{
				out.print("<td><input type='checkbox' name='YN' value='"+tmp.getString("No")+"'></td>"); 
				}
				out.print("</form>");
				out.print("</tr>");
				}
				else{
				out.print("<tr class='showtrbg2'>");
				out.print("<form action='../product/product.jsp' method='POST'>");
				out.print("<td>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				
				for(int i=2; i<=6; i++)
				{
					if(i==2){
					out.print("<td class='pimg'><img class='pimg' src='"+tmp.getString(2)+"' ></td><td class='pimg'><input  class='godlike' style='font-size:20px' type='text'  name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==4||i==5){
					out.print("<td class='god'><input class='god'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==6){
						checked=tmp.getString("YN");
					}
					else{
					out.print("<td class='godlo'><input class='godlike'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
 				}
				out.print("<td><input class='godlike' type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input class='godlike' type='submit' name='submit' value='delete' /></td>");
				if(checked.equals("Y")){
				out.print("<td><input type='checkbox' name='YN' value='"+tmp.getString("No")+"' checked></td>"); 
				}
				else{
				out.print("<td><input type='checkbox' name='YN' value='"+tmp.getString("No")+"'></td>"); 
				}
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