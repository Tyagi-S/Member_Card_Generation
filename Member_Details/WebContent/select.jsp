<html>
<head>
<style>

.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}
.checkmark {
  position: absolute;
  top: 0;
  left: 500px;
  height: 25px;
  width: 25px;
  background-color: #FF0000;
  border-radius: 50%;
}


.container:hover input ~ .checkmark {
  background-color: #ccc;
}
.container input:checked ~ .checkmark {
  background-color: #008000;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

body{
		background-image: url("lemon.png");
		background-size:cover;
	
		background-position: center;

}

}
.MySelect1{
	padding-top: 60px;
}
.MySelect2{
	padding-top: 60px;
}

.button{
  background-color:#00FFFF;
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

.button{
  background-color:#800080;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  }
</style>
</head>
<body>



<%
if(session==null || session.getAttribute("uname")==null || session.getAttribute("pass")==null) {
	request.setAttribute("sess_error", "You need to login before accessing that page");
	request.getRequestDispatcher("./index.jsp").forward(request, response);
}
%>


<form action="./logout" method="post">

<button class="button">Sign-Out</button>

</form>
<div class="MySelect1" style="color:green ;text-align:center;">
<h1 style="color:blue"><u>Mark a Choice:</u></h1>
</div>

<form action="./action" method ="post">

<div class="MySelect2" style="color:green ;text-align:center;">

 <h2> <label class="container">ADD A NEW CLIENT
 			<input type="radio" name="ok" value="insert"/><br>
  	  		<span class="checkmark"></span>
  	  </label>
  
  <label class="container">DELETE A CLIENT
  			<input align="right" type="radio" name="ok" value="delete"/> <br>
 			<span class="checkmark"></span>
  </label> 
  
  
  <label class="container">UPDATE A CLIENT
  			<input align="right" type="radio" name="ok" value="update"/> <br>
  			<span class="checkmark"></span>
  </label>
  
  <label class="container">VIEW A CLIENT
  				<input align="right" type="radio" name="ok" value="view"/> <br><br>
   				<span class="checkmark"></span>
  </label>
   
   </h2>
  <button class="button">OK</button><br><br>
</div>
</form>
</body>
</html>