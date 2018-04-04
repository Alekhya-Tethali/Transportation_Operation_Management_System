
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServiceProvider")

public class UpdateServiceProvider extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServiceProvider() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");	
		try {
			  // PrintWriter out= response.getWriter();
			   String reply=(String) request.getParameter("Submit123");
			   int sp_sno=Integer.parseInt(reply);
			   Class.forName("org.postgresql.Driver");
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
			   String query = "select * from sp_mst where sp_sno=?";
			
			   PreparedStatement st = conn.prepareStatement(query);
			   st.setInt(1, sp_sno);
			   ResultSet rs = st.executeQuery();
			  if(rs.next())
			  {
				 System.out.println("000");
				  String sp_name=rs.getString("sp_name");
				  String po_number=rs.getString("po_no");
				  String tel_no=rs.getString("tel_no");
				  request.setAttribute("sp_sno", sp_sno);
				  
				  request.setAttribute("sp_name",sp_name);
			      request.setAttribute("po_number",po_number);
				  request.setAttribute("tel_no", tel_no);
				  request.getRequestDispatcher("serviceproviderpopulate.jsp").include(request, response);
				  
			
			  }
	}
catch(Exception e)
		{
	     System.out.println(e.getMessage());
		}
	
	}


}
