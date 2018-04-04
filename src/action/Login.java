package action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Employee;
import dao.EmployeeDao;
public class Login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -804510296503215396L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
		   PrintWriter out= response.getWriter();
		   String name=request.getParameter("username");
			String password=request.getParameter("password");
			Employee e1=new Employee(name,password);
			
			int status=EmployeeDao.validateEmployee(e1);
			if(status==1)
			{
				HttpSession session=request.getSession();  
				session.setAttribute("username",name);
		        session.setAttribute("password",password);
				out.println("<script> alert('valid Details');</script>");
				   request.getRequestDispatcher("homepage.jsp").forward(request, response);
				   
			}
			else if(status==2)
			{
				HttpSession session=request.getSession();  
				session.setAttribute("username",name);
		        session.setAttribute("password",password);
				out.println("<script> alert('valid Details');</script>");
				   request.getRequestDispatcher("vehrequest.jsp").forward(request, response);
				   
			}
			else
			{
				
				  out.println("<script> alert('Invalid Details');</script>");
	              request.getRequestDispatcher("login.html").include(request, response);			
			}
		}

	}

