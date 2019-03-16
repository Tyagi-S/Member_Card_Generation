<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

body{
	
		background-image: url("flickering-bubbles.png");
		background-size:cover;
	
		background-position: center;

}

.Myclass{
	padding-top: 40px;
}

.button{
  background-color:#008000;
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
<title>Insert title here</title>
</head>
<body bgcolor="	#7FFFD4">

<form action="./logout" method="post">
<button class="button">Sign-Out</button>
</form>

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
	alert('INVALID DATA');
</script>
<% } %>



<form action="./updation" method="post">
<div class="Myclass" style="color:red ;text-align:center;">

<h1><b><u>ENTER THE VOTER'S ID WHICH YOU WANT TO UPDATE:</u></b></h1> <input type="text" name="id" size="60"><br>

<h2><u>SELECT THE FIELD YOU WANT TO UPDATE:</u></h2>
<h3> 

 	  <input type="radio" name="ok" value="New_ID">Change Member's Voter ID:<input type="text" name="uid"><br><br>

	  <input type="radio" name="ok" value="New_Name">Change Member's Name:<input type="text" name="uname"><br><br> 

      <input type="radio" name="ok" value="New_fhname"> Change Member's F/H Name:<input type="text" name="fnm"><br><br>
 
      <input type="radio" name="ok" value="New_aadhar">Change Member's AADHAR number:<input type="text" name="aadhar"><br><br>
    
   	  <input type="radio" name="ok" value="New_address">Change Member's Address:<input type="text" name="adr"><br><br>
	
      <input type="radio" name="ok" value="New_desg">Change Member's designation:<input type="text" name="desg"><br><br>
     
      <input type="radio" name="ok" value="New_mob">Change Member's mobile number:<input type="text" name="mob"><br><br>
      
      <input type="radio" name="ok" value="New_mem">Change Member's Member ID:<input type="text" name="mem"><br><br>


 </h3>
	<button class="button">Update</button><br><br>

		<h2><a href = "./view.jsp" style="color:red">Go to View Page</a><br><br>
		<a href = "./insert.jsp" style="color:red">Go to insertion Page</a><br><br>
		<a href = "./delete.jsp" style="color:red">Go to deletion Page</a><br><br>
		
		</h2>

	<h2>Note: You have to enter the ID and the new value you want to change.</h2>
</div>
</form>

</body>
</html>