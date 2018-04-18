<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>shopcar</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/wuchi.css">

</head>
<body>
<<div id="header">
				
<header>
<div>			
	<ul class="block">
	<% request.setCharacterEncoding("UTF-8");%>
<%
    if(session.getAttribute("ID") != null ){
		sql = "SELECT * FROM member WHERE ID='" +session.getAttribute("ID")+"';"; 
		ResultSet paperrs1 =con.createStatement().executeQuery(sql);
		String id="";
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
<div class="ccar">
<form name="form" method="post"  action="addcar2.jsp">
	<table id="tab" class="ctable">
		<tr class="ctr">
			<th>No.</th><th >商品圖片</th><th>商品名稱</th><th>價格</th><th>數量</th><th>動作</th>
		</tr>
		
<%
			int n = 0,inventory=0,i=1;
			int sum = 0,n1=0;
			String name="";
			String ID =(String)session.getAttribute("ID");
			
			if(session.getAttribute("ID") != null ){
			
			ResultSet rs;
			sql = "SELECT * FROM shopcar WHERE ID='"+ID+"'";
			ResultSet tmp = con.createStatement().executeQuery(sql);

			
			while(tmp.next())
			{
			sql = "SELECT * FROM product WHERE name ='"+tmp.getString("name")+"'";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()){
				inventory=Integer.valueOf(rs.getString("num"));
			}
			name=tmp.getString("name");
			n=Integer.valueOf(tmp.getString("num"));
			n1=Integer.valueOf(tmp.getString("price"));
%>
	   

		<tr class="ctr">
			<td><%=i%></td> 
			<td><img src="<%=tmp.getString("img")%>" width="200px" height="200px" alt="1" />  </td> 
			<%out.print("<td>"+tmp.getString("name")+" <input  type='hidden' name='na"+i+"' value='"+name+"'> </td>");%> 
			
			<td><%=tmp.getString("price")%></td> 
			
			<%
			out.print("<td><input class='amount'  type='number' step='1' min='1' max='"+inventory+"' name='q"+i+"' value='"+n+"' title='數量'  size='4' pattern='[0-9]*' inputmode='numeric' id='textfield' onchange='Total()' required/></td> ");
			%>

		</tr>
<%
			
			sum+=(n*n1);
			i++;
			}
			i--;
			 }
			 else{
				 out.print("登入方能查看購物車");
			 }
%>
		<tr  class="ctr">
			 <td>總計:</td> <td id="sum" colspan="3"><span class="style10" id="span1"> <%=sum%></span> </td> <td>元</td>
			<td>
			<input  type="hidden" name="No" value="<%=i%>">
			<input  type="hidden" name="ID" value="<%=ID%>">
			<input type="submit" name="finish" value="結帳">
			
			</td>
		</tr>

	</table>
</form>

</div>
 <form name="form1" method="post"  action="delallcar.jsp">
<input  type="hidden" name="ID" value="<%=ID%>">
<input class="shoppbutton2" type="submit" name="delete" value="清除購物車">

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






<script>
	function Total(){ 
	
		var num = document.getElementsByClassName("amount");
		var number ;
		var price;
		//document.write(price);
		var total = 0 ;
		
		
		 
		for( i = 0 ; i < num.length ; i ++ ) {

			number = num[i].value;
			price = document.getElementById('tab').rows[i+1].cells[3].innerHTML;
			(number!="")?number=parseInt(number,10):number=0 ; 
			(price!="")?price=parseInt(price,10):price=0 ;
			total += price * number ;


		}
		document.getElementById('span1').innerHTML = total ; 
	} 
</script> 

	
</body>
</html>
