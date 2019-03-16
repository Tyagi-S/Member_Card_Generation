import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*; 
public class action extends HttpServlet
{  
		public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
		{  
			response.setContentType("text/html");

			PrintWriter out = response.getWriter();
			String val = request.getParameter("ok");
			
			HttpSession session = request.getSession(false);
			
			if(session!=null && session.getAttribute("uname")!=null)
			{
				if(val.equals("insert"))
				{
					getServletContext().getRequestDispatcher("/insert.jsp").forward(request,response);
				}
				else if(val.equals("delete"))
				{
					getServletContext().getRequestDispatcher("/delete.jsp").forward(request,response);
				}
				else if(val.equals("update"))
				{
					getServletContext().getRequestDispatcher("/update.jsp").forward(request,response);
				}
				else
				{
					getServletContext().getRequestDispatcher("/view.jsp").forward(request,response);
				}
			}
			else
			{
				request.setAttribute("sess_error", "You need to login before accessing that page");
				request.getRequestDispatcher("./index.jsp").forward(request, response);
			}
		}
}  

