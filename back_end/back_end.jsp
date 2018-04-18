<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Back_End</title>
	<script type="text/javascript" src="js/back_end.js"></script>
	<link href="css/back_end.css" rel="stylesheet">
</head>
<body>

<div id="wrap">
	<!--以下header -->
	<div id="header">
		<div class="headleft">
			<p>後台</p>
		</div>
<%
String BID = (String)session.getAttribute("ID");
if(BID!=null){
		out.print("<div class='headright'><ul><li><a href='#'>歡迎回來，"+BID+"</a></li><li><a href='members/logout.jsp'>登出</a></li><a href='../html/index.jsp'>前台</a></li></ul></div>");
}
%>
	</div>
	<!--以上header -->
	
	<!--以下leftbar -->
	<div id="leftbar">
		<div class="leftmenu">
			<ul>
				<li class="left_li_center"><a href="members/showmem.jsp">會員管理</a></li>
				<li class="left_li_center"><a href="product/product.jsp">產品管理</a></li>
				<li class="left_li_center"><a href="order/order.jsp">訂單管理</a></li>
			</ul>
		</div>
	</div>
	<!--以上leftbar -->
	
	<!--以下content -->
	<div id="content">
		<div class="pagetitle">
		<h2>後台</h2>
		</div>
	</div>
	<!--以上content -->

</div>


</body>
</html>