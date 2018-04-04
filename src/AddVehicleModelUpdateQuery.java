
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updatequery
 */
@WebServlet("/AddVehicleModelUpdateQuery")
public class AddVehicleModelUpdateQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		try {
			PrintWriter out = response.getWriter();
			String model_brand = request.getParameter("vehi_brand_dpdwn");
			String model_modelentered = request.getParameter("vehiclemodel");
			String model_status = request.getParameter("Active");
			int id_modelsno = Integer.parseInt(request.getParameter("id_modelsno"));
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			PreparedStatement pst = conn.prepareStatement("update models_mst set brand=?,model=?,active=? where model_sno=?");
			System.out.println("connection insertion" + id_modelsno);
			try {
				pst.setString(1, model_brand);
				pst.setString(2, model_modelentered);
				pst.setString(3, model_status);
				pst.setInt(4, id_modelsno);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			int i = pst.executeUpdate();
			if (i > 0) {
				out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
				request.getRequestDispatcher("VehicleAddModelJSP.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			} else {
				out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
				request.getRequestDispatcher("VehicleAddModelJSP.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
