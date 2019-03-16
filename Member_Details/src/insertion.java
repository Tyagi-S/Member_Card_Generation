import java.io.*;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.sql.*; 
public class insertion extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int exp = 0;
		
		String ID = "";
		String name = "";
		String fhname = "";
		String desg = "";
		double mob = 0;
		String aadhar = "";
		String address = "";
		String memID = "";
		
		try 
		{	
			 ID = request.getParameter("id").trim();
			 
			 name = request.getParameter("nm").trim();
			 
			 fhname= request.getParameter("fnm").trim();
			 
			 desg= request.getParameter("desg").trim();
			 
			 mob = Double.valueOf(request.getParameter("mob").trim());
			 
			 aadhar= (request.getParameter("aadhar").trim()).replaceAll("\\s","");
			 
			 address= request.getParameter("adr").trim();
			 
			 memID= request.getParameter("mem").trim();
			 
		}
		catch(NumberFormatException e)
		{
			
			exp++;
		}
		if(exp!=0)
		{
			request.setAttribute("inv_fields","Empty");
			
			RequestDispatcher rd = request.getRequestDispatcher("/insert.jsp");
			rd.include(request, response);
		}
		else
		{
				int i=0;
				
				try
				{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","Tyagi");
						Statement st = con.createStatement();
						ResultSet resultSet = st.executeQuery("select voterID from clientDB");
						while(resultSet.next())
						{
							if(ID.equals(resultSet.getString(1)))
							{
								request.setAttribute("taken","present already");
								
								RequestDispatcher rd = request.getRequestDispatcher("/insert.jsp");
								rd.include(request, response);
								i++;
								break;
							}
						}
						if(i!=0)
						{
							i=0;
							con.close();
						}
						else
						{
								resultSet.close();
								if(memID!=null && name!=null && ID!=null && fhname!=null && address!=null && aadhar!=null && desg!=null && request.getParameter("mob")!=null){
												
										int res = st.executeUpdate("insert into clientDB values('"+name+"','"+fhname+"','"+desg+"',"+mob+",'"+ID+"','"+aadhar+"','"+address+"','"+memID+"')");
										
										out.println("<html><body style=\"color:red ;text-align:center\"><h1> ");
										out.println("Successful Insertion!");
										out.println("</h1></body></html>");
										
										RequestDispatcher rd = request.getRequestDispatcher("/insert.jsp");
										rd.include(request, response);
								}
								else
								{
									request.setAttribute("inv_data", "INVALID");
									
									RequestDispatcher rd = request.getRequestDispatcher("/insert.jsp");
									rd.include(request, response);
									
								}
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
