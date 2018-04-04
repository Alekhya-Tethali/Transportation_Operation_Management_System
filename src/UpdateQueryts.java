



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import database.ConnectionFactory;

/**
 * Servlet implementation class updatequery
 */
@WebServlet("/UpdateQueryts")
public class UpdateQueryts extends HttpServlet {
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
				   String tslab_id=request.getParameter("Slab_Id");
				   String tslab_type=request.getParameter("Slab_Type");
				   int tslab_duration=Integer.parseInt(request.getParameter("Slab_Duration"));
					int tslab_km=Integer.parseInt(request.getParameter("Slab_Km"));
					int tslab_amt=Integer.parseInt(request.getParameter("Slab_Amt"));
					int textra_km=Integer.parseInt(request.getParameter("Extra_Km"));
					int textra_hr=Integer.parseInt(request.getParameter("Extra_Hr"));
					int tdriver_da=Integer.parseInt(request.getParameter("Driver_Da"));
					int t_sno=Integer.parseInt(request.getParameter("t_sno"));
					String tactive=request.getParameter("Active");
                    String tslab_validfrom=request.getParameter("Valid_From");
					
					java.util.Date tsvalid_from = new SimpleDateFormat("dd-MM-yyyy").parse(tslab_validfrom);
					
					System.out.println(tsvalid_from);

					//java.sql.Date sqlDate = new java.sql.Date(tsvalid_from.getTime());
					java.sql.Date tsDatefrom = new java.sql.Date(tsvalid_from.getTime());
					
					
					
					//Connection con=ConnectionFactory.getConnection();
					 Class.forName("org.postgresql.Driver").newInstance();
					   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
					
					PreparedStatement pst=conn.prepareStatement("update slabs_mst set slab_id=?,slab_km=?,slab_duration=?,slab_amt=?,extra_km=?,extra_hour=?,driv_da=?,active=?,slab_type=?,valid_from=? where slab_sno=?");
		      System.out.println("connection insertion"+t_sno); 
		      try {
		    	  pst.setString(1, tslab_id );
		          pst.setInt(2, tslab_km);
		          pst.setInt(3, tslab_duration);
		          pst.setInt(4, tslab_amt);
		          pst.setInt(5,textra_km);
		          pst.setInt(6, textra_hr);
		          pst.setInt(7, tdriver_da);
		          pst.setString(8,tactive);
		          pst.setString(9, tslab_type);
		          pst.setDate(10,tsDatefrom);
		          pst.setInt(11, t_sno);
		      }catch(Exception e)
		      {
		    	  System.out.println(e.getMessage());
		      }
		      int i= pst.executeUpdate();
				if(i>0)
				{	 
					out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
					request.getRequestDispatcher("tslabs.jsp").include(request, response);
			    	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
				}
				else
				{
					out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
					request.getRequestDispatcher("tslabs.jsp").include(request, response);
			    	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
				}
				
			
			  }catch(Exception e) {
				  System.out.println(e.getMessage());
			  }
	}
}
