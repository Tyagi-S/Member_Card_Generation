import java.io.*;
import java.util.*;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.sql.*; 
public class updation extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String newID = "";
		String newName = "";
		String fhname = "";
		String aadhar = "";
		double mob = 0.0;
		String address = "";
		String desg = "";
		String memID = "";
		
		int exp = 0;
		int exists = 0;
		
		String ID = request.getParameter("id");
		
		
		String choice = request.getParameter("ok");
		
		try
		{
			if(choice.equals("New_ID"))
			{
				newID = request.getParameter("uid").trim();
			}
			else if(choice.equals("New_fhname"))
			{
				fhname = request.getParameter("fnm").trim();
			}
			else if(choice.equals("New_aadhar"))
			{
				aadhar = request.getParameter("aadhar").trim();
			}
			else if(choice.equals("New_mob"))
			{
				mob = Double.valueOf(request.getParameter("mob").trim());
			}
			else if(choice.equals("New_address"))
			{
				address = request.getParameter("adr").trim();
			}
			else if(choice.equals("New_desg"))
			{
				desg = request.getParameter("desg").trim();
			}
			else if(choice.equals("New_mem"))
			{
				memID = request.getParameter("mem").trim();
			}
			else
			{
					 newName = request.getParameter("uname");
			}
		}
		catch(NullPointerException e)
		{
			exp++;
		}
		if(exp!=0)
		{
			request.setAttribute("inv_fields", "INVALID");
			RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
			rd.include(request, response);
		}
		else
		{
			try
			{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","Tyagi");
					Statement st = con.createStatement();
				
					ResultSet result = st.executeQuery("select voterID from clientDB");
					while(result.next())
					{
						if(ID==result.getString(1))
						{
							exists++;
							break;
						}
					}
					result.close();
					if(exists!=0)
					{	
							if(choice.equals("New_ID"))
							{
								//out.println("<html><body><h2>Enter the new  Member ID:<input type=\"text\" name=\"uid\"");
								int rs = st.executeUpdate("update clientDB set voterID='"+newID+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							
							else if(choice.equals("New_fhname"))
							{
								//out.println("<html><body><h2>Enter the new  Member ID:<input type=\"text\" name=\"uid\"");
								int rs = st.executeUpdate("update clientDB set fh_name='"+fhname+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							
							else if(choice.equals("New_address"))
							{
								//out.println("<html><body><h2>Enter the new  Member ID:<input type=\"text\" name=\"uid\"");
								int rs = st.executeUpdate("update clientDB set address='"+address+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							
							else if(choice.equals("New_mob"))
							{
								//out.println("<body><h2>Enter the new  Member ID:<input type=\"text\" name=\\"");
								int rs = st.executeUpdate("update clientDB set mobile="+mob+" where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							
							else if(choice.equals("New_aadhar"))
							{
								//out.println("<html><body><h2>Enter the new  Member ID:<input type=\"text\" name=\"uid\"");
								int rs = st.executeUpdate("update clientDB set aadhar='"+aadhar+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							
							else if(choice.equals("New_desg"))
							{
								
								int rs = st.executeUpdate("update clientDB set designation='"+desg+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							else if(choice.equals("New_mem"))
							{
								
								int rs = st.executeUpdate("update clientDB set memberID='"+memID+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("Updation successful!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
							else
							{
								
								int rs = st.executeUpdate("update clientDB set clientName='"+newName+"' where voterID='"+ID+"'");
								
								out.println("<html><body style=\"color:red ;text-align:center\"><h2>");
								out.println("UPDATION SUCCESSFUL!");
								out.println("</h2></body></html>");
								
								RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
								rd.include(request, response);
							}
					}
					else
					{
						
						request.setAttribute("inv_data", "INVALID");
						
						RequestDispatcher rd = request.getRequestDispatcher("/update.jsp");
						rd.include(request, response);
					}
					con.close();
				}
				catch(Exception e)
				{
					out.println(e);
				}
		}
	}
}
				
			

