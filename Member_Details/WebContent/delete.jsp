<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	
		background-image: url("Happy_Acid.png");
		background-size:cover;
	
		background-position: center;
	}
.button{
  background-color:#008000;
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

.container{
	padding-top: 60px;
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
<button class="button" >Sign-Out</button>
</form>

<%
if(request.getAttribute("inv_field")!=null){
%>
<script type="text/javascript">
	alert('Fields are Empty!');
</script>
<% }
	else if(request.getAttribute("inv_ID")!=null){
 %>
 <script type="text/javascript">
	alert('INVALID ID');
</script>
<%  }
	else if(request.getAttribute("success")!=null){
	
%>
 <script type="text/javascript">
	alert('MEMBER SUCCESSFULLY ADDED');
</script>
<% } %>
<form action="./deletion" method="post">
<div class="container" ; style="color:green ;text-align:center;">>
<h1>Enter User ID for the Deletion: </h1><input type="text" name="id" size="40" width="50"><br><br>


	<button class="button">OK</button><br><br>
	<h2><a href = "./view.jsp" style="color:green">Go to View Page</a><br><br>
		<a href = "./update.jsp" style="color:green">Go to Update Page</a><br><br>
		<a href = "./insert.jsp" style="color:green">Go to insertion Page</a><br><br>
		
		</h2>
</div>
</form>
</body>
</html>