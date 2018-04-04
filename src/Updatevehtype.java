
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
@WebServlet("/Updatevehtype")
public class Updatevehtype extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatevehtype() {
        super();
        // TODO Auto-generated constructor stub
    }

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
			   String reply=(String) request.getParameter("submitvehtype");
			   int id=Integer.parseInt(reply);
			   Class.forName("org.postgresql.Driver").newInstance();
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
			   String query = "select * from vehicle_types_mst where veh_type_sno=?";
			
			   PreparedStatement st = conn.prepareStatement(query);
			   st.setInt(1,id);
			   ResultSet rs = st.executeQuery();
			  if(rs.next())
			  {
				  String status=rs.getString("active");
				  int vehsno=rs.getInt("veh_type_sno");
				  String vehname=rs.getString("veh_type");
				  request.setAttribute("status", status);
			      request.setAttribute("vehsno", vehsno);
				  request.setAttribute("vehname", vehname);
				  request.getRequestDispatcher("populateformvehtype.jsp").include(request, response);
				  
			
			  }
	}
catch(Exception e)
		{
	     System.out.println(e.getMessage()+"update");
		}
	
	}

}