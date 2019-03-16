import java.io.*;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.sql.*; 
public class view extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ID = "";
		
		//String Phone="";
		int exp=0;
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
			request.setAttribute("inv_fields","Empty Fields!");
			RequestDispatcher rd = request.getRequestDispatcher("/view.jsp");
			rd.include(request, response);
		}
		else
		{
				
				try
				{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","Tyagi");
						Statement st = con.createStatement();
												
						ResultSet res = st.executeQuery("select * from clientDB where voterID= '"+ID+"'");
						while(res.next())
						{
							if( ID.equals(res.getString(5)))
							{
								
								String  name = res.getString(1);
								request.setAttribute("name", name);
								
								String fname = res.getString(2);
								request.setAttribute("fname", fname);
								
								
								String  desg = res.getString(3);
								request.setAttribute("desg", desg);
								
								
								String mob = String.valueOf(res.getString(4));
								request.setAttribute("mob", mob);
								
								String  voterID = res.getString(5);
								request.setAttribute("id", voterID);
								
								
								String  aadhar = res.getString(6);
								request.setAttribute("aadhar", aadhar);
																
								String  adr = res.getString(7);
								request.setAttribute("adr", adr);
								
								String  memID = res.getString(8);
								request.setAttribute("mem", memID);
							
								RequestDispatcher rd = request.getRequestDispatcher("/view_card.jsp");
								rd.forward(request,response);
								exp++;
								break;
							}
						}
						if(exp==0)
						{
							request.setAttribute("inv_data","INVALID");
							
							RequestDispatcher rd = request.getRequestDispatcher("/view.jsp");
							rd.include(request,response);
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

