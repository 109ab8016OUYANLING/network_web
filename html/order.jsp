<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<html>
<head>
<title>register</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
		String input_ID = (String)session.getAttribute("ID");
		ResultSet pronum,rss;
		int sum=0,sn=0,pn=0;
		int amount2=0;
		int Cols=1;
		int counti;
		String name="";
				
				/*sql="ALTER TABLE book DROP No";
					con.createStatement().executeUpdate(sql);*/
				sql = "INSERT INTO book(ID,img,name,price,num) SELECT ID,img,name,price,num FROM shopcar WHERE ID='"+input_ID+"'";
				con.createStatement().executeUpdate(sql);
				//加到訂單
					
				/*sql="ALTER TABLE book ADD No int(10)";
				con.createStatement().executeUpdate(sql);
				
				sql="SELECT * FROM book";
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet bk = st.executeQuery(sql);
				bk.last();
				Cols = bk.getRow();
				counti= 1;
				
				while( counti <= Cols){
					bk.absolute(counti); //移到第n筆記錄
					bk.updateInt("No", counti); 
					
					bk.updateRow();
					counti++;
				}
				sql="ALTER TABLE book ADD No PRIMARY KEY(SID)";
				con.createStatement().executeUpdate(sql);*/
					
					sql="SELECT * From shopcar where ID='"+(String)session.getAttribute("ID")+"'";
					rss=con.createStatement().executeQuery(sql);
					String amount="";
					int left=0;
					while(rss.next())
					{
					name=rss.getString("name");
					amount=rss.getString("num");
					sql="select * from product where name='"+name+"'";
					pronum=con.createStatement().executeQuery(sql);

					amount2=Integer.parseInt(amount);
					while(pronum.next())
					{
					left=Integer.parseInt(pronum.getString("num"));
					left=left-amount2;
				
					sql = "UPDATE product SET num ='"+Integer.toString(left)+"' WHERE name='"+name+"'";
					con.createStatement().execute(sql);
					}
					
					}
					

			
				sql = "DELETE FROM shopcar WHERE ID='"+input_ID+"'";
				con.createStatement().executeUpdate(sql);
				//刪除購物車資料
				sql = "SELECT  * FROM shopcar";
				Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(sql);
				
				rs.last();
				Cols = rs.getRow();
				counti= 1;
				String countii="";
				while( counti <= Cols){
					rs.absolute(counti); //移到第n筆記錄
					rs.updateInt("No", counti); 
					
					rs.updateRow();
					counti++;
				}
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				
			
				out.println("<script>alert('結帳成功');</script>");
				response.setHeader("Refresh", "0; URL=../../html/index.jsp") ;
			

%>
</body>
</html>