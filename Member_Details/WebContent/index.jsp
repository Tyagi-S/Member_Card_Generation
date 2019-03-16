<html>

<head>

<style>

	body, html {
  height: 90%;
  margin: 0;
}
.button{
  background-color:#FF0000;
  border: none;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;

}

.Myclass {

  background-image: url("ID_CARD_BACK-0.jpg");

  
  height: 100%; 

  
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
	
	padding-top: 200px;
	padding-left: 700px;
	}

</style>

</head>
<body>

<% 
	if(request.getAttribute("inv_data")!=null){
 %>
<script type="text/javascript">
	alert('Username or Password is Incorrect');
</script>

<% }
	else if(request.getAttribute("sess_error")!=null) {
%>
<script type="text/javascript">
	alert('You Need To login before accessing this page');
</script>
<% }	%>
<form action="./validation" method="post">

<div class="Myclass" style="color:red ;text-align:center;">

<h1 style="font-size:50px;" >Login To access the client!</h1><br>
<b style="font-size:25px;"> UserName: <input type="text" name="uname"></b><br>
<b style="font-size:25px;"> Password: <input type="password" name="pass"></b><br>
 <button class="button" style="padding: 15px 32px; margin-top:50px">Log In</button><br> 

 </div>
</form>
</body>
</html> 
