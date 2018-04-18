<%

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use project";
con.createStatement().execute(sql);

//連資料庫用的
%>
