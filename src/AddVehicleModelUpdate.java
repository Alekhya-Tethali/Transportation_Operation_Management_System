

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
@WebServlet("/AddVehicleModelUpdate")
public class AddVehicleModelUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVehicleModelUpdate() {
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
			   String reply=(String) request.getParameter("Submit123");
			   int id_modelsno=Integer.parseInt(reply);
			   Class.forName("org.postgresql.Driver").newInstance();
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			   String query = "select * from models_mst where model_sno=?";
			
			   PreparedStatement st = conn.prepareStatement(query);
			   st.setInt(1, id_modelsno);
			   ResultSet rs = st.executeQuery();
			  if(rs.next())
			  {
				 
				  String model_brand=rs.getString("brand");
				  String model_modelentered=rs.getString("model");
				  String model_status=rs.getString("active");
				  request.setAttribute("id_modelsno", id_modelsno);
				  request.setAttribute("model_brand", model_brand);
			      request.setAttribute("model_modelentered", model_modelentered);
				  request.setAttribute("model_status", model_status);
				  request.getRequestDispatcher("AddVehicleModelPopulateForm.jsp").include(request, response);
				  
			
			  }
	}
catch(Exception e)
		{
	     System.out.println(e.getMessage());
		}
	
	}

}
