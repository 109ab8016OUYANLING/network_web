<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>totalproduce</title>
		<link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="../css/wuchi.css">
    <script src="../js/check.js"></script>
	</head>
	<body>
<div id="header">
				
<header>
<div>			
	<ul class="block">
				<% request.setCharacterEncoding("UTF-8");%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");   //使用JDBC連結		
	try
	{
	   String url="jdbc:mysql://127.0.0.1/";
	   String sql;
	   Connection con = DriverManager.getConnection(url, "root", "1234");
		String search = request.getParameter("search");
	   
	   if(con.isClosed())
		out.print("connection failure");
	   else
	   {
			con.createStatement().execute("USE project");
			if(session.getAttribute("ID") != null ){
			sql = "SELECT * FROM member WHERE ID='" +session.getAttribute("ID")+"';"; 
			ResultSet paperrs1 =con.createStatement().executeQuery(sql);
			String id="", pwd="";
			//讀出id, pwd當成使用者要更改時的內定值
				while(paperrs1.next()){
	    
				id=paperrs1.getString("ID");
		
				}
			out.print("<li>"+id+"</li>");
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
          <li><a href="../html/shopcar.jsp">購物清單</a></li>
        </ul>
      </nav>
   
    </header>
</div>
<hr>
<div id="product">
<ul class="promar">
<%
			
			sql = "SELECT  * FROM product WHERE name LIKE '%"+search+"%' ";
			ResultSet tmp = con.createStatement().executeQuery(sql);
			
			int i = 2;
			while(tmp.next())
			{
			if(tmp.getString("YN").equals("Y")){	
%>
				
					
						<li class="nochan"><form action="produce.jsp" method="post"><button><a><img src="<%=tmp.getString("img")%>" alt="1" />
							<ul class="proleft">
								<li class="col"><h3><%=tmp.getString("name")%></h3></li>
								<li class="coll"><h3>NT$<%=tmp.getString("price")%></h3></li>
								<li><input type="hidden" name="pronum" value="<%=tmp.getString("No")%>"></li>
								<li><input class="txt1" type="submit" name="submit" value="加入購物車"></li>
							</ul>
							</a>
							</button>
							</form>
						</li>
						

					
					
				
<%			}	

 				
			
			}

		    con.close();
	   }
	} //try   
	
	catch(SQLException sExec)
	{
		out.print("SQL錯誤！"+sExec.toString());
	}
	
}
catch(ClassNotFoundException err){
	out.print("Class錯誤"+err.toString());
}
%>
</ul>
</div>
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
			</section>
		</div>
	</body>
</html>