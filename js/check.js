 function chkinput()
 {
 var id=window.document.form1.id.value;
 re = /\W/;
 if(id=="")
 {
 alert("請輸入帳號!!");
 document.form1.id.focus();
 return false;
 }
 else if(re.test(id))
 {
 alert("只允許輸入英文及數字");
 document.form1.id.focus();
 return false;
 }
 
 var pwd=window.document.form1.password.value;
 re = /\W/;
 if(pwd=="")
 {
 alert("請輸入密碼!!");
 document.form1.password.focus();
 return false;
 }
 else if(re.test(pwd))
 {
 alert("只允許輸入英文及數字");
 document.form1.password.focus();
 return false;
 }
 return true;
 }