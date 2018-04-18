<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
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
			<a href="../back_end.html"><p>後台</p></a>
		</div>
		<div class="headright">
			<ul>	
				<li><a href="#">名稱</a></li>
			</ul>
		</div>
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
		<% request.setCharacterEncoding("UTF-8");%>
			<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/";
		String sql;
		Connection con=DriverManager.getConnection(url,"root","1234");
		int n=1;
		String k;
		String No = request.getParameter("num");
		String input_ID = request.getParameter("a1");
		String input_pwd = request.getParameter("a2");
		String input_name = request.getParameter("a3");
		String input_gender = request.getParameter("a4");
		String input_birth = request.getParameter("a5");
		String input_address = request.getParameter("a6");
		String input_e_mail = request.getParameter("a7");
		String input_tel = request.getParameter("a8");
		String modify = request.getParameter("submit");
		int si=-1,sp=-1,sn=-1,sa=-1,se=-1,st=-1;
		
		boolean idcorrect=false,pwdcorrect = false;
		if( input_ID == null ){
				
		}
		else{
			si=input_ID.indexOf(' ');
			sp=input_pwd.indexOf(' ');
			sn=input_name.indexOf(' ');
			sa=input_address.indexOf(' ');
			se=input_e_mail.indexOf(' ');
			st=input_tel.indexOf(' ');
			
		
		}
		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			
			con.createStatement().execute("USE project");
			if( input_ID == null ){
				
			}
			else if( idcorrect == true || pwdcorrect == true ){
				out.println("<script>alert('帳號密碼請為英數混和唷!');</script>");
			}
			else if( si!=-1){
				out.println("<script>alert('帳號有空白唷!');</script>");
			}
			else if( sp!=-1){
				out.println("<script>alert('密碼有空白唷!');</script>");
			}
			else if( sn!=-1){
				out.println("<script>alert('名稱有空白唷!');</script>");
			}
			else if( sa!=-1){
				out.println("<script>alert('住址有空白唷!');</script>");
			}
			else if( st!=-1){
				out.println("<script>alert('電話有空白唷!');</script>");
			}
			else if( se!=-1){
				out.println("<script>alert('e-mail有空白唷!');</script>");
			}
			else if ( modify.equals("delete") ){
				sql="DELETE FROM member WHERE No = '"+No+"' ";
				con.createStatement().executeUpdate(sql);
				
				sql = "SELECT  * FROM member";
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
				sql="UPDATE member SET ID= '"+input_ID+"',pwd = '"+input_pwd+"' ,name = '"+input_name+"',gender = '"+input_gender+"',birth = '"+input_birth+"',address = '"+input_address+"',e_mail = '"+input_e_mail+"',tel = '"+input_tel+"' WHERE No = '"+No+"'";

						
			  con.createStatement().execute(sql); //執行成功傳回false
			  out.print("上一次修改NO."+No);
			 }
			 
			sql = "SELECT  ID, pwd, name, gender, birth,address, e_mail, tel FROM member";
			ResultSet tmp = con.createStatement().executeQuery(sql);
%>
<table class="showtable" >
<tr class="showtrbg">
<td>NO.</td><td>會員帳號</td>	<td>會員密碼</td>	<td>名稱</td>	<td>性別</td>	<td>生日</td>	<td>住址</td>	<td>e-mail</td>	<td>電話</td><td>修改</td><td>刪除</td>
</tr>

<%			
			while(tmp.next())
			{
				
				if(n%2!=0){
				out.print("<tr class='showtrgray'>");
				out.print("<form action='showmem.jsp' method='POST'>");
				out.print("<td>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				for(int i=1; i<=8; i++)
				{
					if ( i==4 ){
						out.print("<td><select name='a"+i+"'><option value='"+tmp.getString(i)+"'>"+tmp.getString(i)+"</option><option value='男'>男</option><option value='女'>女</option></select></td>");
					}
					else if (i==5){
						out.print("<td><input type='date' name='a"+i+"' value='"+tmp.getString(i)+"' min='1900-01-01' max='2017-06-17'></td>");
					}
					else{
					out.print("<td><input class='godlike' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
					}

 				}
				out.print("<td><input type='submit' name='submit' value=' 修改 ' /></td>");
				out.print("<td><input type='submit' name='submit' value='delete' /></td>");
				out.print("</form>");
				out.print("</tr>");
				}
				else{
				out.print("<tr class='showtrbg2'>");
				out.print("<form action='showmem.jsp' method='POST'>");
				out.print("<td>"+n+"<input type='hidden' name='num' value='"+n+"'></td>");
				
				for(int i=1; i<=8; i++)
				{
					if ( i==4 ){
						out.print("<td><select name='a"+i+"'><option value='"+tmp.getString(i)+"'>"+tmp.getString(i)+"</option><option value='男'>男</option><option value='女'>女</option></select></td>");
					}
					else if (i==5){
						out.print("<td><input type='date' name='a"+i+"' value='"+tmp.getString(i)+"' min='1900-01-01' max='2017-06-17'></td>");
					}
					else{
					out.print("<td><input class='godlike' type='text' name='a"+i+"' value='"+tmp.getString(i)+"' required></td>");
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
		con.close();
	}
	catch(SQLException sExec){
		out.println("SQL錯誤"+sExec.toString());
	}
}
catch(ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}
%>
		</div>
	</div>
	<!--以上content -->

</div>


</body>
</html>