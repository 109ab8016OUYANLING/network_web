<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<html>
<head>
<title>add</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%!
String newline( String str ) {
	int index = 0 ;
	while (( index = str.indexOf("\n")) != -1 ) {
	  str = str.substring(0,index) + "</br>" + str.substring( index+1 ) ;
	}
	return (str) ;
}
%>

<%
try {
//Step 1: ���J��Ʈw�X�ʵ{�� 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: �إ߳s�u 	
        String url="jdbc:mysql://127.0.0.1/";
        String sql="";
        String ip = request.getRemoteAddr();
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("�s�u�إߥ���");
        else {
//Step 3: ��ܸ�Ʈw   
           sql="use project";
           con.createStatement().execute(sql);
           
           String new_name=request.getParameter("name");
           String new_subject=request.getParameter("subject");
           String new_content=request.getParameter("content");
		   String ID =(String)session.getAttribute("ID");
		   if(ID==null){
			   out.println("<script>alert('Please loging first!');</script>");
			   response.setHeader("Refresh", "0; URL=user.html") ;
		   }
		   else{
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
           new_content = newline( new_content ) ;
//Step 4: ���� SQL ���O	
           sql="insert guestbook (name, subject, content, putdate, ip) ";
           sql+="value ('" + new_name + "', ";
           sql+="'"+new_subject+"', ";
           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"',";   
           sql+="'"+ip+"')";
//out.println(sql);
           con.createStatement().execute(sql);
		   
//Step 6: �����s�u
           con.close();
//Step 5: ��ܵ��G 
          //������̷ܳs�����
           response.sendRedirect("totalproduce.jsp");
		   }
       }
    }
    catch (SQLException sExec) {
           out.println("SQL���~"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class���~"+err.toString());
}
%>
</body>
</html>
