<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>about</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/check.js"></script>
  </head>
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
%>       <li >｜</li>
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
    <hr>
<div id="aboust">
      <div>
        <img id="img-responsive" src="../img/shuenchi.jpg" width="100%" height=850><br>
        <h3 class="abouts">吳劭祺</h3>
        <a href="https://www.facebook.com/hjkl543210?fref=ts"><img class="imgab" src="../img/fb.jpg" width=50></a>
      </div>
      <div>
        <img id="img-responsive" src="../img/oli.jpg" width="110%" height=850>
        <h3 class="abouts">歐晏綾</h3>
        <a href="https://www.facebook.com/profile.php?id=100000313980824&fref=ts"><img class="imgab" src="../img/fb.jpg" width=50></a>
      </div>
      <div>
        <img id="img-responsive" src="../img/lee.jpg" width="110%" height=850>
        <h3 class="abouts">李育儕</h3>
        <a href="https://www.facebook.com/profile.php?id=100003961315574&ref=br_rs"><img class="imgab" src="../img/fb.jpg" width=50></a>
      </div>
      <div>
        <img id="img-responsive" src="../img/yucha.jpg" width="110%" height=850>
        <h3 class="abouts">黃榆傑</h3>
       <a href="https://www.facebook.com/profile.php?id=100003381971407&fref=ts"> <img class="imgab" src="../img/fb.jpg" width=50></a>
      </div>
</div>
    <hr></hr>
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