<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Register</title>
		<link rel="stylesheet" href="../css/style.css">
		
	</head>
	<body>
	<div id="header">
				
<header>
<div>			
	<ul class="block">
        <li ><a href="../html/user.html"> 會員登入</a> </li>
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
          <li><a href="../html/shopcar.jsp">購物清單</a></li>
        </ul>
      </nav>
   
    </header>
</div>
		<% request.setCharacterEncoding("UTF-8");%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/";
		String sql;
		Connection con=DriverManager.getConnection(url,"root","1234");
        	
		
	}
	catch(SQLException sExec){
		out.println("SQL錯誤"+sExec.toString());
	}
}
catch(ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}		
%>
		<hr>
		<form name="form2" method="post" action="../back_end/members/register.jsp">
			<div class="div" >
				<p align="center">名字:<input name="name" type="text" size="25" class="inputsize" required></p><br><br>
				<p align="center">帳號:<input name="ID" type="text" size="25"  class="inputsize" required></p><br><br>
				<p align="center">密碼:<input name="pwd" type="password" size="25"  class="inputsize" required></p><br><br>
				<p align="center">生日:<input type='date' name='birth' value='2017-01-01' min='1900-01-01' max='2017-06-17'></p><br><br>

				<p align="center">地址:<input name="address" type="text" size="25"  class="inputsize" required></p><br><br>
				<p align="center">電子信箱:<input name="e_mail" type="email" size="20"  class="inputsize" required></p><br><br>
				<p align="center">手機號碼:<input name="tel" type="text" size="20"  class="inputsize" required></p><br><br>
				<p align="center">性別:<input name="gender" type="radio" value="男"checked >男生<input name="gender" type="radio" value="女">女生</p><br><br>
			</div>
			<p align="center"><button type="submit">確定送出</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				&nbsp&nbsp&nbsp&nbsp&nbsp<input type="reset" value="清除資料"></p>
			</form>
		
		<hr>
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
		</body>
	</html>