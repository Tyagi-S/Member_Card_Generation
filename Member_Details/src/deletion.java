import java.io.*;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.sql.*; 
public class deletion extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html");
		String ID = "";
		int exp=0;
		int exists = 0;
		
		PrintWriter out = response.getWriter();
		try 
		{
			 ID = request.getParameter("id").trim();
		}
		catch(NumberFormatException e)
		{
			exp++;
		}
		if(exp!=0)
		{
			request.setAttribute("inv_field", "Empty Fields");
			RequestDispatcher rd = request.getRequestDispatcher("/delete.jsp");
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
							int res = st.executeUpdate("delete from clientDB where voterID='"+ID+"'");
												
							request.setAttribute("success", "Done");
							RequestDispatcher rd = request.getRequestDispatcher("/delete.jsp");
							rd.include(request, response);
						
						}
						else
						{	
							request.setAttribute("inv_ID", "Invalid ID");
							
							RequestDispatcher rd = request.getRequestDispatcher("/delete.jsp");
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

