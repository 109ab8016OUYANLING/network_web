<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%@include file="../back_end/members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<link rel="stylesheet" href="../stylesheets/main.css" />
		<link rel="stylesheet" href="../stylesheets/font-awesome.min.css">
		<link rel="stylesheet" href="../css/wuchi.css">
				<!--script-->
			<script src="../jq/jquery.min.js"></script>
			<script src="../jq/jquery.dropotron.min.js"></script>
			<script src="../jq/jquery.scrolly.min.js"></script>
			<script src="../jq/jquery.onvisible.min.js"></script>
			<script src="../jq/skel.min.js"></script>
			<script src="../jq/util.js"></script>
			<script src="../jq/main.js"></script>
			<script src="../jq/move.js"></script>
	</head>
	<body>
<!--title-->
			<div id="header">
				<div class="inner">
					<header>
						<h1><a href="index.jsp">Taiwan胖</a></h1>
						<hr />
						<p>歡迎在此挑選喜歡的麵包</p>
					</header>
				</div>
<!--nav-->				
				<nav id="nav">
					<ul>
						<li><a href="../html/index.jsp">首頁</a></li>
						<li>
							<a href="">會員專區</a>
							<ul>
								<li><a href="../html/register.jsp">註冊</a></li>
								<li><a href="../html/user.html">登入</a></li>
								<li><a href="../html/record.jsp"">瀏覽訂單</a></li>
								<li><a href="../html/shopcar.jsp">購物清單</a></li>
								
							</ul>
						</li>
						<li><a href="../html/totalproduce.jsp">商品</a></li>
						<li><a href="../html/aboutus.jsp">關於我們</a></li>
					</ul>
				</nav>
			</div>
<!--title2-->
		<section id="banner">
			<header>
			<img src='../images/logo.png' class='image logo'>
			<h2>Welcome to <strong>Taiwan胖</strong>!</h2>
			<p>您可以在此挑選您喜歡的麵包</p>
			</header>
		</section>
<table width="100%" border="0" cellpacing="1" bgcolor="#cccccc">
<tr>
<td><font size="5">
<marquee scrollamount="6">
<%
		   ResultSet rs,rss;
           con.createStatement().execute(sql);
           sql = "select count(*) from randad" ;
           rs=con.createStatement().executeQuery(sql);
           rs.next();
           String a = rs.getString(1);
           int count1 = Integer.parseInt(a);
           //設定亂數ran
           Random ran=new Random();
           // current_adid亂數決定值為1-3,//nextInt(3)產生0到2的亂數
           int current_adid=ran.nextInt(count1)+1;
//Step 4: 執行 SQL 指令, 只有一筆資料             
           sql="select * from randad where adid= " + current_adid;
           rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
           // 產生廣告需要的連結, 圖片, 替代文字
          while (rs.next()) //只有一筆資料
           {
				out.println("<a href="+rs.getString(3)+">");
				out.println(rs.getString(2)+"</a>");
           }
%>
</marquee>
</font>
</td>
</tr>
</table>
<!--hot-->
		<section class="carousel">
		<div class="reel">
<%
			sql="SELECT * FROM product WHERE YN='Y' ";
			rss=con.createStatement().executeQuery(sql);
			while(rss.next()){
				out.println("<article>");
				out.println("<form action='produce.jsp' method='post'><button class='inde'><a href='produce.jsp' class='image product'><img width='100%' src='"+rss.getString("img")+"'/></a>");
				out.println("<header>");
				out.println("<h3><a href='#'>"+rss.getString("name")+"</a></h3>");				
				out.println("</header>");
				out.println("<input type='hidden' name='pronum' value='"+rss.getString("No")+"'>");	
				out.println("<input type='submit' name='submit' value='加入購物車'></button></form></article>");
			}
%>

		</div>
		</section>

<!--main-->
	<div id="abgneBlock">
		<ul class="list">
			<li><a href="totalproduce.jsp"><img src="../images/001.jpg"></a></li>
			<li><a href="totalproduce.jsp"><img src="../images/002.png"></a></li>
			<li><a href="totalproduce.jsp"><img src="../images/003.jpg"></a></li>
			<li><a href="totalproduce.jsp"><img src="../images/004.png"></a></li>
			<li><a href="totalproduce.jsp"><img src="../images/005.jpg"></a></li>
		</ul>
	</div>
<%
 	Integer count=0;
					sql = "select * from counter";
         		  	rs = con.createStatement().executeQuery(sql);
         		  	rs.next();
        		   	a = rs.getString(1);
        		   	count = Integer.parseInt(a) ;
			if(session.isNew()){
					count+=1;
				sql = "update counter set count=" + count ;
				if( !con.createStatement().execute(sql) ){
         	 	 	sql = "select * from counter";
         		  	 rs = con.createStatement().executeQuery(sql);
         		  	rs.next();
        		   	 a = rs.getString(1);
        		   	count = Integer.parseInt(a) ;
        		   	out.print("你是第"+count+"個訪客");
        	   	
				}

        		   	

           }
		   
           else {
         	 	 	sql = "select * from counter";
         		  	rs = con.createStatement().executeQuery(sql);
         		  	rs.next();
        		   	 a = rs.getString(1);
        		   	count = Integer.parseInt(a) ;
        		   	out.print("你是第"+count+"個訪客");
        	   	
           }
%>
<!--footer-->
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