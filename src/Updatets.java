



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Update
 */
@WebServlet("/Updatets")
public class Updatets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");	
		try {
			   PrintWriter out= response.getWriter();
			   String reply=(String) request.getParameter("Submit123");
			   int id=Integer.parseInt(reply);
			   Class.forName("org.postgresql.Driver").newInstance();
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
			   String query = "select * from slabs_mst where slab_sno=?";
			
			   PreparedStatement st = conn.prepareStatement(query);
			   st.setInt(1,id);
			   ResultSet rs = st.executeQuery();
			  if(rs.next())
			  {
				  String ts_status=rs.getString("active");
				  int ts_sno=rs.getInt("slab_sno");
				  String ts_id=rs.getString("slab_id");
				  String ts_slabtype=rs.getString("slab_type");
				  int ts_extrakm=rs.getInt("extra_km");
				  int ts_slabkm=rs.getInt("slab_km");
				  int ts_duration=rs.getInt("slab_duration");
				  int ts_slabamt=rs.getInt("slab_amt");
				  int ts_extrahr=rs.getInt("extra_hour");
				  int ts_driverda=rs.getInt("driv_da");
				  Date ts_validfrom=rs.getDate("valid_from");
				  request.setAttribute("ts_status",ts_status);
			      request.setAttribute("ts_sno",ts_sno);
				  request.setAttribute("ts_id",ts_id);
				  request.setAttribute("ts_slabtype",ts_slabtype);
				  request.setAttribute("ts_extrakm",ts_extrakm);
				  request.setAttribute("ts_slabkm", ts_slabkm);
				  request.setAttribute("ts_duration",ts_duration);
				  request.setAttribute("ts_slabamt",ts_slabamt);
				  request.setAttribute("ts_extrahr",ts_extrahr);
				  request.setAttribute("ts_driverda",ts_driverda);
				  request.setAttribute("ts_validfrom",ts_validfrom);
				  
				  request.getRequestDispatcher("populateformts.jsp").include(request, response);
				  
			
			  }
	}
catch(Exception e)
		{
	     System.out.println("updte page"+e.getMessage());
		}
	
	}

}
