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
				<li>searchbox</li>
				<li><a href="#">來信</a></li>		
				<li><a href="#">名稱</a></li>
			</ul>
		</div>
	</div>
	<!--以上header -->
	
	<!--以下leftbar -->
	<div id="leftbar">
		<div class="leftmenu">
			<ul>
				<li class="left_li_center"><a href="#">會員管理</a>
				</li>
				<li class="left_li_center"><a href="#">產品管理</a></li>
				<li class="left_li_center"><a href="#">訂單管理</a></li>
				<li class="left_li_center"><a href="#">購物車</a></li>
				<li class="left_li_center"><a href="#">留言板</a></li>
				<li class="left_li_center"><a href="#">訪客計數器</a></li>
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
			<form action="search.jsp" method="POST">
				<input type="text" name="search" placeholder="Search..">
			</form>
		</div>
		
		<div class="showall">
			<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/";
		String sql;
		Connection con=DriverManager.getConnection(url,"root","1234");
		int n=1;
		String input_ID = request.getParameter("a1");
		String input_pwd = request.getParameter("a2");
		String input_name = request.getParameter("a3");
		
		String input_gender = request.getParameter("a4");
		String input_birth = request.getParameter("a5");
		String input_address = request.getParameter("a6");
		String input_e_mail = request.getParameter("a7");
		String input_tel = request.getParameter("a8");
		
		if(con.isClosed())
			out.println("連線建立失敗");
		else {
			
			con.createStatement().execute("USE project");
						sql = "INSERT member(ID,pwd,nickname,name,gender,birth,address,e_mail,tel) " +
                                 "VALUES ('"
								 +input_ID+"','"+input_pwd+"','"
								 +input_name+"','"+input_gender+"','"+input_birth+"','"
								 +input_address+"','"+input_e_mail+"','"+input_tel+"')";
			 boolean no= con.createStatement().execute(sql); //執行成功傳回false
			sql = "SELECT  ID, pwd, name, gender, birth,address, e_mail, tel FROM member";
			ResultSet tmp = con.createStatement().executeQuery(sql);
%>
<table class="showtable" >
<tr class="showtrbg">
<td>NO.</td><td>會員帳號</td>	<td>會員密碼</td>	<td>名稱</td>	<td>性別</td>	<td>生日</td>	<td>住址</td>	<td>e-mail</td>	<td>電話</td><td>修改</td>
</tr>

<%			
			while(tmp.next())
			{
				
				if(n%2!=0){
				out.print("<tr class='showtrgray'>");
				out.print("<td>"+n+"</td>");
				out.print("<form action='showmem.jsp' method='POST'>");
				for(int i=1; i<=8; i++)
				{

					out.print("<td><input class='godlike' type='text' name='a"+i+"' value='"+tmp.getString(i)+"'></td>");

 				}
				out.print("<td><input type='submit' name='submit' value='修改' /></td>");
				out.print("</form>");
				out.print("</tr>");
				}
				else{
				out.print("<tr class='showtrbg2'>");
				out.print("<form action='showmem.jsp' method='POST'>");
				out.print("<td>"+n+"</td>");
				for(int i=1; i<=8; i++)
				{

					out.print("<td><input class='godlike' type='text' name='a"+i+"' value='"+tmp.getString(i)+"'></td>");

 				}
				out.print("<td><input type='submit' name='submit' value='修改' /></td>");
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
		out.println("SQL錯誤");
	}
}
catch(ClassNotFoundException err) {
	out.println("class錯誤");
}
%>
		</div>
	</div>
	<!--以上content -->

</div>


</body>
</html>