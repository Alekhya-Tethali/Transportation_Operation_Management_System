
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ConnectionFactory;

/**
 * Servlet implementation class updatequery
 */
@WebServlet("/updatequeryvehbrand")
public class updatequeryvehbrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
			  try {
				   PrintWriter out= response.getWriter();
				   String vehiclename=request.getParameter("vehiclebrand");
					String veh_active=request.getParameter("Active");
					int veh_sno=Integer.parseInt(request.getParameter("sno"));
					Connection con=ConnectionFactory.getConnection();
		      PreparedStatement pst=con.prepareStatement("update brands_mst set brand=?,active=? where brand_sno=?");
		      System.out.println("connection insertion"+veh_sno); 
		      try {
		      pst.setString(1, vehiclename ); 
		      pst.setString(2, veh_active ); 
		      pst.setInt(3, veh_sno );
		      }catch(Exception e)
		      {
		    	  System.out.println(e.getMessage());
		      }
		      int i= pst.executeUpdate();
				if(i>0)
				{	 
					out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
					request.getRequestDispatcher("vehbrand.jsp").include(request, response);
				}
				else
				{
					out.print("<script type= 'text/javascript'>alert('not updated' );</script>");
					request.getRequestDispatcher("vehbrand.jsp").include(request, response);
			    	
				}
				
			
			  }catch(Exception e) {
				  System.out.println(e.getMessage());
			  }
	}
}