
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

@WebServlet("/updatequeryaddveh")
public class updatequeryaddveh extends HttpServlet {
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
			String ser_provider = request.getParameter("vehi_sp_dpdwn");
			String vhreg = request.getParameter("vehreg");
			 System.out.println(vhreg+"updatequery");

			String drivname = request.getParameter("driname");
			String veh_status = request.getParameter("Active");
			int id_vehsno = Integer.parseInt(request.getParameter("id_vehsno"));
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			PreparedStatement pst = conn.prepareStatement("update veh_mst set serpro=?,vehregnno=?,drivname=?,active=? where vehsno=?");
			System.out.println("connection insertion" + id_vehsno);
			try {
				pst.setString(1, ser_provider);
				pst.setString(2, vhreg);
				pst.setString(3, drivname);
				pst.setString(4, veh_status);
				pst.setInt(5, id_vehsno);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			int i = pst.executeUpdate();
			if (i > 0) {
				out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
				request.getRequestDispatcher("Add_Vehicle.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			} else {
				out.print("<script type= 'text/javascript'>alert('updated Sucessfully' );</script>");
				request.getRequestDispatcher("Add_Vehicle.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
