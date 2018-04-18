<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>introduce</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
    <script src="../js/check.js"></script>
</head>
<body>
<div id="header">
				
<header>
<div>			
	<ul class="block">
<%
String ID = (String)session.getAttribute("ID");
if(session.getAttribute("ID") != null ){
			sql = "SELECT * FROM member WHERE ID='" +session.getAttribute("ID")+"';"; 
			ResultSet paperrs1 =con.createStatement().executeQuery(sql);
			String id="", pwd="";
			//讀出id, pwd當成使用者要更改時的內定值
				while(paperrs1.next()){
	    
				id=paperrs1.getString("ID");
		
				}
				if(id.equals("wuchi")){
			out.print("<li><a href='../back_end/back_end.jsp'>"+id+"</a></li>");
			}
			else{
				out.print("<li><a href='introduce.jsp'>"+id+"</a></li>");
			}
			out.print("<li>|</li>");
			out.print("<li><a href='../back_end/members/logout.jsp'>登出</a></li>");
			}
			else{
				out.print(" <li ><a href='../html/user.html'> 會員登入</a> </li>");
			}
%>
        <li >｜</li>
        <li><a href="../html/register.jsp">  加入會員</a></li>
        <li >｜</li>
        <li ><a href="../html/record.jsp">訂單查詢</a></li>
        <li >｜</li>
        <li ><a href="../html/introduce.jsp">會員中心</a></li>
        <li >｜</li>
        <li ><a href="../html/shopcar.jsp"><img src="../img/0002.png" width="50" height="50"></a></li>
      </ul>
    </div>
    <div class="search">
     <form action="searchpfront.jsp" method="POST">
	 <img src="../img/0003.png" width="35" height="35" >
		<input type="text" name="search" placeholder="Search..">
	</form>
	</div>   
      <nav>
        <ul class="asdy">
          <li><a href="../html/index.jsp">主頁</a></li>
          <li><a href="../html/aboutus.jsp">關於我們</a></li>
          <li><a href="../html/totalproduce.jsp">探索麵包</a></li>
          <li><a href="">購物清單</a></li>
        </ul>
      </nav>
   
    </header>
</div>
    <hr>
	<div>
	<div class="comm ">
	<nav >
	<ul >
	<li><a href="../html/introduce.jsp"> 使用者資訊</a></li>
    <li><a href="../html/record.jsp"> 消費紀錄</a></li>
	<li><a href="../html/comment.jsp">評分紀錄　商品評論</a></li>
	</ul>
	</nav>
	</div>
    <h1 class="int1"> 使用者資訊</h1>
<%
			sql = "SELECT * FROM member WHERE ID = '"+ID+"'";
			ResultSet tmp = con.createStatement().executeQuery(sql);
			while(tmp.next())
			{
%>
    <form name="form2" method="post" action="fixmem.jsp">
			<div class="" >
				<p class="int">名字:<input name="name" type="text" size="25" class="inputsize" value="<%=tmp.getString("name")%>" required></p><br><br>
				<p class="int">密碼:<input name="pwd" type="password" size="25"  class="inputsize" value="<%=tmp.getString("pwd")%>" required></p><br><br>
				<p class="int">生日:<input type='date' name='birth' value='<%=tmp.getString("birth")%>' min='1900-01-01' max='2017-06-17'></p><br><br>

				<p class="int">地址:<input name="address" type="text" size="25"  class="inputsize" value="<%=tmp.getString("address")%>" required></p><br><br>
				<p class="int">電子信箱:<input name="e_mail" type="email" size="20"  class="inputsize" value="<%=tmp.getString("e_mail")%>" required></p><br><br>
				<p class="int">手機號碼:<input name="tel" type="text" size="20"  class="inputsize" required value="<%=tmp.getString("tel")%>"></p><br><br>
				<%
				if(tmp.getString("gender").equals("男")){
					%>
					<p class="int">性別:<input name="gender" type="radio" value="男"checked >男生<input name="gender" type="radio" value="女">女生</p><br><br>
				<%}
				
				else{
					%>
					<p class="int">性別:<input name="gender" type="radio" value="男">男生<input name="gender" type="radio" value="女" checked>女生</p><br><br>
				<%}
				%>
				
				
			</div>
			<p align="center"><button type="submit" style="width:120px;height:30px;font-size:15px;" >修改資料</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp
			</form>
<%
			}

%>
</div>	
<div id="footer">
			<section class="contact">
				<header>	
					<h3>聯絡資訊</3>
				</header>
				<p>
					桃園市中壢區中北路200號<br>
					(03)2659999
				</p>
			</section>
			<section class="dp">
				<ul class="icons">
					<li><a href="" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				</ul>
				<div class="copyright">
					版權所有 &copy; 拷貝一定吉
				</div>
			</section>
		</div>
	

   
</body>
</html>