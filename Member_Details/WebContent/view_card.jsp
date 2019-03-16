<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<% String str =  String.valueOf( request.getAttribute("adr"));
	String substr = "";
	String substr1="";
	int exp = 0;
	if(str.length()>11)
	{
		substr = str.substring(0,11);
		substr1=str.substring(11);
		exp++;
	}

%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.centered {
  position: absolute;
  top: 215px;
  color: black;
  margin-left: 510px;
}

.centered1 {
  position: absolute;
  top: 96px;
  color: black;
  margin-left: 510px;
}

.centered2 {
  position: absolute;
  top: 134px;
  color: black;
  margin-left: 510px;
}

.centered3 {
  position: absolute;
  top: 175px;
  color: black;
  margin-left: 510px;
}

.centered4 {
  position: absolute;
  top: 253px;
  color: black;
  margin-left: 510px;
}

.centered5 {
  position: absolute;
  top: 292px;
  color: black;
  margin-left: 510px;
}
.centered7 {
  position: absolute;
  top: 295px;
  color: black;
  margin-left: 964px;
}

.centered6 {
  position: absolute;
  top: 330px;
  color: black;
  margin-left: 510px;
}
</style>
</head>
<body>
<img src="ID_CARD4-0.jpg" alt="Snow" style="width:60%;margin-left:20%;">
<div class="centered"><h1><% out.println(request.getAttribute("mob"));%></h1></div>
  
  <div class="centered1"><h1><% out.println(request.getAttribute("name"));%></h1></div>

 <div class="centered2"><h1><% out.println(request.getAttribute("fname"));%></h1></div>
  
  <div class="centered3"><h1><% out.println(request.getAttribute("desg"));%></h1></div>
  
   <div class="centered4"><h1><% out.println(request.getAttribute("id"));%></h1></div>
  
   <div class="centered5"><h1><% out.println(request.getAttribute("aadhar"));%></h1></div>
   
    <div class="centered7"><h2><% out.println(request.getAttribute("mem"));%></h2></div>
  
   <div class="centered6"><h1><%if(exp!=0)
   								{
									out.println(substr);%><br>
									<%out.println(substr1);	   		
   								}
   								else
   								{
  								 out.println(str);
  								}
  								 %></h1></div>
</body>
</html> 