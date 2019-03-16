<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body{
		background-image: url("view.jpg");
	
		background-size:cover;
	
		background-position: center;
	
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
.Myclass{
	padding-top: 100px;
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
<% } %>


<form action="./logout" method="post">
<button class="button">Sign-Out</button>
</form>

<form action="./view" method="post">

<div class="Myclass" style="color:blue ;text-align:center;">

<h2>Enter Member's ID to view details:</h2> <input type="text" name="id"><br><br>
	<button class="button"><b>OK</b></button>
	
	<h2><a href = "./update.jsp" style="color:cyan">Go to updation Page</a><br><br>
		<a href = "./insert.jsp" style="color:cyan">Go to insertion Page</a><br><br>
		<a href = "./delete.jsp" style="color:cyan">Go to deletion Page</a><br><br>
		</h2>
</div>
</form>

</body>
</html>