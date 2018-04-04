package action;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.Veh_Typebean;

import dao.Veh_Typedao;

public class Veh_Type extends HttpServlet 
{
	private static final long serialVersionUID = -804510296503215396L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
			  try {
				   PrintWriter out= response.getWriter();
				   String vehiclename=request.getParameter("vehicletype");
					String veh_active=request.getParameter("Active");
					Veh_Typebean vt=new Veh_Typebean(vehiclename,veh_active);
			       
			boolean status=Veh_Typedao.insertvehicle(vt);
			
			if(status)
			{
				out.print("<script type= 'text/javascript'>alert('inserted Sucessfully' );</script>");
				request.getRequestDispatcher("vehicletypes.jsp").include(request, response);
		    	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
		    	
			}
			else
			{
				 out.println("<script> alert('not inserted');</script>");
		         request.getRequestDispatcher("vehicletypes.jsp").include(request, response);
			}
				  }
				  catch(NumberFormatException e)
				  {
					  System.out.println("Number Exception");
				  }
		}
		}