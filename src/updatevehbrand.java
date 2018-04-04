

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
@WebServlet("/updatevehbrand")
public class updatevehbrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatevehbrand() {
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
			System.out.println("entered try");
			   String reply=(String) request.getParameter("Submit123");
			   System.out.println("got param"+reply);
			   int id=Integer.parseInt(reply);
			   System.out.println("got id");
			   Class.forName("org.postgresql.Driver").newInstance();
			   System.out.println("class.forname over");
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
			   System.out.println("connection done");
			   String query = "select * from brands_mst where brand_sno=?";
			   System.out.println("select query done");
			   PreparedStatement st = conn.prepareStatement(query);
			   st.setInt(1,id);
			   ResultSet rs = st.executeQuery();
			   System.out.println("Result set updated ");
			  if(rs.next())
			  {
				  String status=rs.getString("active");
				  int vehsno=rs.getInt("brand_sno");
				  String vehname=rs.getString("brand");
				  request.setAttribute("state", status);
			      request.setAttribute("veh_sno", vehsno);
				  request.setAttribute("veh", vehname);
				  System.out.println("set all attributes successfully ");
				  request.getRequestDispatcher("populateformvehbrand.jsp").include(request, response);
				  
			
			  }
	}
catch(Exception e)
		{
	     System.out.println(e.getMessage()+"error loading next page");
		}
	
	}

}