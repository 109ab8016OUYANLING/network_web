<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM login WHERE id='" +session.getAttribute("id")+"';"; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
	String id="", pwd="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(paperrs1.next()){
	    //name=paperrs1.getString(1);
	    id=paperrs1.getString("id");
		pwd=paperrs1.getString("pwd");
	}

%>
哈囉，<%=id%>，<a href='logout.jsp'>登出</a><br />
請修改會員資料：<br />
<form action="update.jsp" method="POST">
您的姓名：<input type="text" name="id" value="<%=id%>" />
您的密碼：<input type="password" name="pwd" value="<%=pwd%>" />
<input type="submit" name="b1" value="更新資料" />
</form>
<%
}
else{
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="id" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>

<%
}
%>
