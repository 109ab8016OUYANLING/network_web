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
			<h2>訂單一覽</h2>
		</div>
		
		<div class="showsearch">
			<form action="../search/searchp.jsp" method="POST">
				<input type="text" name="search" placeholder="Search..">
			</form>
		</div>
		<div class="newp">
		<h3>訂單新增</h3>
			<form action="order.jsp" method="POST">
			<table class="showtable" >
				<tr class="showtrbg">
					<td>顧客</td><td>圖片路徑</td>	<td>名稱</td>	<td>價格</td>	<td>數量</td>  <td>新增</td>
				</tr>
				<tr class="showtrbg">
					<td><input class="np" type="text" name="pID" placeholder="ID.."></td> 
					<td><input class="np" type="text" name="psrc" placeholder="Src.."></td>	
					<td><input class="np" type="text" name="pname" placeholder="Name.."></td>	
					<td><input class="np" type="text" name="pprice" placeholder="Price.."></td>	
					<td><input class="np" type="text" name="pnum" placeholder="Num.."></td> 
					<td><input class="np" type="submit" name="newp" value="add"></td>
				</tr>
			</table>
			</form>
		</div>
		
		<div class="showall">
		<h3>所有訂單</h3>

<%


		int n=1;
		String k;
		String No = request.getParameter("num");
		String input_ID = request.getParameter("a2");
		String input_img = request.getParameter("a3");
		String input_name = request.getParameter("a4");
		String input_price = request.getParameter("a5");
		String input_num = request.getParameter("a6");
		String modify = request.getParameter("submit");

		String pID = request.getParameter("pID");
		String psrc = request.getParameter("psrc");
		String pname = request.getParameter("pname");
		String pprice = request.getParameter("pprice");
		String pnum = request.getParameter("pnum");
		String newp = request.getParameter("newp");
		
		
		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			
			con.createStatement().execute("USE project");
			if( input_img == null ){
				
			}
			else if ( modify.equals("delete") ){
				sql="DELETE FROM book WHERE ID = '"+input_ID+"' AND name ='"+input_name+"' ";
				con.createStatement().executeUpdate(sql);
				
				sql = "SELECT  * FROM product";
				Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(sql);
				
				rs.last();
				int Cols = rs.getRow();
				int counti= Integer.valueOf(No);
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
			}
			else{
				sql = "SELECT  * FROM book";
				Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(sql);
				
				int counti= Integer.valueOf(No);
					rs.absolute(counti); //移到第n筆記錄
					rs.updateString("ID", input_ID);
					rs.updateString("img", input_img); 
					rs.updateString("name", input_name); 
					rs.updateString("price", input_price); 
					rs.updateString("num", input_num); 
					rs.updateRow();
					
				
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
			
						
			  con.createStatement().execute(sql); //執行成功傳回false
			  out.print("上一次修改NO."+No);
			 }
			 
			if ( newp!=null ){
				sql="select * from book";
				ResultSet rs=con.createStatement().executeQuery(sql);
				int np;
				rs.last();
				np=rs.getRow()+1;
				sql = "INSERT book(ID,img,name,price,num) " +
                  "VALUES ('"+pID+"','"+psrc+"','"+pname+"','"+pprice+"','"+pnum+"')";
				con.createStatement().execute(sql); //執行成功傳回false
 
			}
			  
			sql = "SELECT * FROM book";
			ResultSet tmp = con.createStatement().executeQuery(sql);
%>
<table class="showtable" >
<tr class="showtrbg">
<td>NO.</td><td>顧客</td><td>圖片</td><td>圖片路徑</td>	<td>名稱</td>	<td>價格</td>	<td>數量</td> <td>修改</td><td>刪除</td>
</tr>

<%			
			while(tmp.next())
			{
				
				if(n%2!=0){
				out.print("<tr class='showtrgray'>");
				out.print("<form action='order.jsp' method='POST'>");
				out.print("<td class='no'>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				for(int i=2; i<=6; i++)
				{
					if(i==3){
					out.print("<td class='pimg'><img class='pimg' src='"+tmp.getString(i)+"' ></td><td class='pimg'><input  class='godlike' style='font-size:20px' type='text'  name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==6||i==5|| i==2){
					out.print("<td class='god'><input class='god'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else{
					out.print("<td class='godlo'><input class='godlike'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
	
					
 				}
				out.print("<td><input class='godlike' type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input class='godlike' type='submit' name='submit' value='delete' /></td>");
				out.print("</form>");
				out.print("</tr>");
				}
				else{
				out.print("<tr class='showtrbg2'>");
				out.print("<form action='order.jsp' method='POST'>");
				out.print("<td>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				
				for(int i=2; i<=6; i++)
				{
					if(i==3){
					out.print("<td class='pimg'><img class='pimg' src='"+tmp.getString(i)+"' ></td><td class='pimg'><input  class='godlike' style='font-size:20px' type='text'  name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else if(i==6||i==5 || i==2){
					out.print("<td class='god'><input class='god'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
					else{
					out.print("<td class='godlo'><input class='godlike'style='font-size:20px' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}
 				}
				out.print("<td><input class='godlike' type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input class='godlike' type='submit' name='submit' value='delete' /></td>");
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