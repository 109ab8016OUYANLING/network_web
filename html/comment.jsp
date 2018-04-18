<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>comment</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
    <script src="../js/check.js"></script>
</head>
<body>
<div id="header">
				
<header>
<div>			
	<ul class="block">
<%String ID = (String)session.getAttribute("ID");
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
		<table class="border">
	<%
		if(ID!=null){
		sql="select * from guestbook"; 
           ResultSet rs=con.createStatement().executeQuery(sql);
           rs.last();
           int total_content=rs.getRow();
           out.println("</br>");
           int page_num=(int)Math.ceil((double)total_content/5.0); 
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "1";  
           Integer current_page=Integer.valueOf(page_string);   

           out.println("<hr>");
           int start_record=(current_page-1)*5;
           sql="SELECT * FROM guestbook  WHERE name='"+ID+"'";
         
           rs=con.createStatement().executeQuery(sql);
                      while(rs.next())
                {

  
	%>
	<div class="comment">

	<tr>
   <td>商品名稱：<%=rs.getString("subject")%></td>
    <td>商品評論：<%=rs.getString("content")%></td>
    <td>評論日期：<%=rs.getString("putdate")%></td>
    </tr>

<%
	}}
	else{
		out.println("<script>alert('請先登入!');</script>");
				response.setHeader("Refresh", "0; URL=user.html") ;
	}
%>

	</table>
	</br></br></br>
</div>	
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