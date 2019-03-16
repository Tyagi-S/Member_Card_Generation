import java.io.*;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.sql.*; 
public class validation extends HttpServlet
{  
  
		public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
		{  

			PrintWriter out = response.getWriter();  
			response.setContentType("text/html");
			
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			
			 
		      
		     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		      
			
			try
			{
				Class.forName("oracle.jdbc.OracleDriver");
				
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","Tyagi");
				Statement st = con.createStatement();
										
				ResultSet res = st.executeQuery("select * from Admin");
				
				
				while(res.next())
				{
					if(uname.equals(res.getString(2))&& pass.equals(res.getString(3)))
					{
						 HttpSession session=request.getSession();
						  
						 session.setAttribute("uname",uname);
					     session.setAttribute("pass",pass); 
					      
						RequestDispatcher rd = request.getRequestDispatcher("/select.jsp");
						rd.forward(request, response);
					}
					else
					{
						//out.println("Invalid Credentials");
						/*out.println("<html><body><p><h1 style=\"color:yellow\">");
						out.println("Invalid Username or Password entered!");
						out.println("</h1></p></body></html>");*/
						request.setAttribute("inv_data", "INVALID USERNAME OR PASSWORD!");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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