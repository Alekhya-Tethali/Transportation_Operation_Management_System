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

@WebServlet("/UpdateQuerySP")
public class UpdateQuerySP extends HttpServlet{
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
			String sp_name = request.getParameter("sp_name");
			String po_number = request.getParameter("po_number");
			String tel_no= request.getParameter("tel_no");
			int sp_sno = Integer.parseInt(request.getParameter("sp_sno"));
			//int tel_no= Integer.parseInt(tel_no_temp);

			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres","admin");
			PreparedStatement pst = conn.prepareStatement("update sp_mst set sp_name=?,po_no=?,tel_no=? where sp_sno=?");
			//System.out.println("connection insertion" + sp_sno);
			try {
				pst.setString(1, sp_name);
				pst.setString(2, po_number);
				pst.setString(3, tel_no);
				pst.setInt(4, sp_sno);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			int i = pst.executeUpdate();
			if (i > 0) {
				out.print("<script type= 'text/javascript'>alert(' sp updated Sucessfully' );</script>");
				request.getRequestDispatcher("service.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			} else {
				out.print("<script type= 'text/javascript'>alert(' sp updated Sucessfully' );</script>");
				request.getRequestDispatcher("service.jsp").include(request, response);
				out.print("\n<input type='button' value='Print' onclick='window.print()'>");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
