<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="../back_end/members/config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<%String ID =(String)session.getAttribute("ID");%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<title>produce</title>
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/wuchi.css">
	<link href="../css/star.css" type="text/css" rel="stylesheet"/>
<style>
#starttwo .star_score { background:url(../img/starky.png);}
#starttwo .star_score a:hover{ background:url(../img/starsy.png);left:0;}
#starttwo .star_score a.clibg{ background:url(../img/starsy.png);left:0;}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
  $("#quantity").keyup(function(){
    if(isNaN($(this).val())||parseInt($(this).val())<1){
      $(this).val("1");
      $("#totalPrice").html($("#price").val());
      return;
    }
    var total=parseFloat($("#price").val())*parseInt($(this).val());
    $("#totalPrice").html(total.toFixed(2));
  })
   
  $("#add").click(function(){
     numAdd();
  });
   
  $("#del").click(function(){
    numDec();
  });
})
/*商品數量+1*/
function numAdd(){
  var num_add = parseInt($("#quantity").val())+1;
  if($("#quantity").val()==""){
    num_add = 1;
  }
  $("#quantity").val(num_add);
  var total = parseFloat($("#price").val())*parseInt($("#quantity").val());
  $("#totalPrice").html(total.toFixed(2));
}
/*商品數量-1*/
function numDec(){
  var num_dec = parseInt($("#quantity").val())-1;
  if(num_dec<1){
    //購買數量必須大於或等於1
    alert("數量要大於1");
  }
  else{
    $("#quantity").val(num_dec);
    var total = parseFloat($("#price").val())*parseInt($("#quantity").val());
    $("#totalPrice").html(total.toFixed(2));
  }
}
</script>
</head>
<body>

<div id="header">
				
<header>
<div>			
	<ul class="block">
        <%			if(session.getAttribute("ID") != null ){
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
<section id="close">

<%

		String no = request.getParameter("pronum");
		int inven=0;
	   
	   if(con.isClosed())
		out.print("connection failure");
	   else
	   {
			con.createStatement().execute("USE project");
			
			
			
			
			sql = "SELECT * FROM product WHERE No = '"+no+"'";
			
			ResultSet tmp = con.createStatement().executeQuery(sql);
			while(tmp.next()){
				inven=Integer.valueOf(tmp.getString("num"));
%>
<div class="pawn">
<img src="<%=tmp.getString("img")%>" width="300" height="300">
</div>
<div class="insidein">
<h1 class="pawnname"><%=tmp.getString("name")%></h1>
<p class="pawnindtroce">
<ul>
	<li><%=tmp.getString("intro")%></li>
</ul>

  <br><span style="color: #ff8c00"><strong>保存及食用方式<br /></span>
 
  <ul>
	<li>為保新鮮，Pasadena 全程以冷藏宅配；
收到後您可取所需份量，放置於室溫下後直接食用、
或是以烤箱回烤後食用。
其餘麵包建議盡快放入冷凍保存，以避免水分的流失；
每次食用再取用所需份量退冰，
回烤前請先於麵包上噴一些水以避免過乾，
放入烤箱以180度烘烤3分鐘左右。
不建議使用微波，可能會使麵包過乾失去風味。</li>
</ul>
</p>

<div class="pawnnum">
<h2 class="price">售價$<%=tmp.getString("price")%></h2>
<h2 class="price">庫存:<%=tmp.getString("num")%></h2>
<form action="addcar.jsp" method="post">
<input class="amount"  type="number" step="1" min="1" max="<%=inven%>" name="quantity" value="1" title="數量"  size="4" pattern="[0-9]*" inputmode="numeric" required/>
<input  type="hidden" name="ID" value="<%=ID%>"  />
<input  type="hidden" name="img" value="<%=tmp.getString("img")%>"  />
<input  type="hidden" name="name" value="<%=tmp.getString("name")%>"  />
<input  type="hidden" name="price" value="<%=tmp.getString("price")%>"  />
<input  type="hidden" name="num" value="<%=tmp.getString("num")%>"  />
<input id="btn_buy" class="pawnbutton" type="submit" name="addcar" value="放入購物車"  />
</form>
</div>
 <div class="inside">
                      <p class="score"> 商品評分</p>
                  <div id="starttwo">

                    <div class="star_score"></div>
                  </div>
                  <script type="text/javascript" src="../js/startScore.js"></script>
                  <script>
                    scoreFun($("#startone"))
                    scoreFun($("#starttwo"),{
                    fen_d:22,//每一個a的寬度
                    ScoreGrade:5//a的個数 
                    })
                  </script>
                </div>

</div>
</section>
<div id="board">
  <form name="form1" method="post" action="add.jsp" class="lac">
    <input type="hidden" name="name" value="<%=session.getAttribute("ID")%>"><br>
    <input type="hidden" name="subject" value="<%=tmp.getString("name")%>"><br>
    內容：<textarea rows=5 name="content"></textarea><br>
    <input type="submit" name="Submit" value="送出">
    <input type="Reset" name="Reset" value="重新填寫">
</form>
</div>
<%
		
		  sql="select * from guestbook"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs.last();
           int total_content=rs.getRow();
           out.println("</br>");
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位


           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "1";  //無留言時將頁數指標訂為1        
           Integer current_page=Integer.valueOf(page_string);//將page_string轉成整數           

           out.println("<hr>");
         //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM guestbook ORDER BY no DESC LIMIT ";//LIMIT是限制傳回筆數
           sql+=start_record+",5";

           rs=con.createStatement().executeQuery(sql);
       
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
                if ( rs.getString("subject").equals(tmp.getString("name")) ){
                 //out.println("留言主題:"+rs.getString(4)+"<br>");
         out.println("留言主題:"+rs.getString("subject")+"<br>");
                 //out.println("訪客姓名:"+rs.getString(2)+"<br>");
         out.println("訪客姓名:"+rs.getString("name")+"<br>");
                 //out.println("留言內容:"+rs.getString(5)+"<br>");
         out.println("留言內容:</br>"+rs.getString("content")+"<br>");
                 //out.println("留言時間:"+rs.getString(6)+"<br><hr>");
         out.println("留言時間:"+rs.getString("putdate")+"<br><hr>");
        // out.println("IP:"+rs.getString("ip")+"<br><hr>");
        }
          }
		
		       
		
			}
	   }


%>
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
					<li><a href="aboutus.jsp" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="aboutus.jsp" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				</ul>
				<div class="copyright">
					版權所有 &copy; 拷貝一定吉
				</div>


</body>
</html>