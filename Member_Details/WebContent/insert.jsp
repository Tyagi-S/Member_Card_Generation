
<html>
<head>
<style>
body{
	
		filter:brightness(50%);
		background-image: url("insert_pic.png");
	
		background-size:cover;
	
		background-position: center;

}


.Myclass{
	padding-top: 40px;
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
</style>

</head>
<body>
<%
if(session==null || session.getAttribute("uname")==null || session.getAttribute("pass")==null) {
	request.setAttribute("sess_error", "You need to login before accessing this page");
	request.getRequestDispatcher("./index.jsp").forward(request, response);
}
%>
<%
	if(request.getAttribute("inv_fields")!=null){
%>
<script type="text/javascript">
	alert('Fields are Empty!');
</script>
<% }
	else if(request.getAttribute("inv_data")!=null){
 %>
 <script type="text/javascript">
	alert('INVALID ID');
</script>
<% }
	else if(request.getAttribute("taken")!=null){
 %>
<script type="text/javascript">
	alert(' VOTER ID ALREADY TAKEN. PLEASE ENTER A DIFFERENT VOTER ID');
</script>
<% } %>

<form action="./logout" method="post">
<button class="button">Sign-Out</button>
</form>


	<form action="./insertion" method="post">
	<div class="Myclass" style="color:cyan ;text-align:center;">
	
	<h1 style="text-align:top"><u>Enter the Client's Details Here</u></h1><br><br>
	
		<b style="font-size:25px">Enter the voterID of the client:</b><input type="text" name="id"><br><br>
		<b style="font-size:25px">Enter the client Name:</b><input type="text" name="nm"><br><br>
		<b style="font-size:25px">Enter the client's Father/mother's Name:</b><input type="text" name="fnm"><br><br>
		<b style="font-size:25px">Enter the client's designation:</b><input type="text" name="desg"><br><br>
		<b style="font-size:25px">Enter the client's mobile number:</b><input type="text" name="mob"><br><br>
		<b style="font-size:25px">Enter the client's AADHAR number:</b><input type="text" name="aadhar"><br><br>	
		<b style="font-size:25px">Enter the client's Member ID:</b><input type="text" name="mem"><br><br>		
		<li><b style="font-size:25px">Enter the client's address:</b><input type="text" name="adr"><br><br>
		
		
		
		<button class="button"><b>OK</b></button><br><br>
		<h2><a href = "./view.jsp" style="color:cyan">Go to View Page</a><br><br>
		<a href = "./update.jsp" style="color:cyan">Go to Update Page</a><br><br>
		<a href = "./delete.jsp" style="color:cyan">Go to deletion Page</a><br><br>
			</h2>
		
		<h2>Note:In userID field there should be no spaces in between the numbers. UserID can't be negative and should be less than or equal to the value
		"2147483647". UserName shouldn't be empty.</h2><br><br>
	</div>
		</form>
		</span>

</body>
</html>