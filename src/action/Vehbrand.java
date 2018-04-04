package action;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.Vehbrandbean;

import dao.VehbrandDao;

public class Vehbrand extends HttpServlet 
{
	//private static final long serialVersionUID = -804510296503215396L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
			  try {
				   PrintWriter out= response.getWriter();
				   String vehiclebrand=request.getParameter("vehiclebrand");
					String veh_active=request.getParameter("Active");
					Vehbrandbean vb=new Vehbrandbean(vehiclebrand,veh_active);
			       
			boolean status=VehbrandDao.insertvehbrand(vb);

			if(status)
			{
				out.print("<script type= 'text/javascript'>alert('inserted Sucessfully' );</script>");
				request.getRequestDispatcher("vehbrand.jsp").include(request, response);
			}
			else
			{
				 out.println("<script> alert('not inserted');</script>");
		         request.getRequestDispatcher("vehbrand.jsp").include(request, response);
			}
				  }
				  catch(NumberFormatException e)
				  {
					  System.out.println("Number Exception");
				  }
		}
		}



