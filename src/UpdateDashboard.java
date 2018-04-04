


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
@WebServlet("/UpdateDashboard")
public class UpdateDashboard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	    System.out.println("before post");
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int vehsno=0;
		Time allot_time=null;
		Date allot_date = null;
		int vehtypesno=0;
		int allot_sno=0,reqsno=0;
		System.out.println("inpost");
		response.setContentType("text/html");	
		try {  System.out.println("here in update 1");
			   
			   String reply=(String) request.getParameter("Submit123");
			   int id_sno=Integer.parseInt(reply);
			   System.out.println("here in update 2");
			   PrintWriter out= response.getWriter();
			   Class.forName("org.postgresql.Driver").newInstance();
			   Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
			   System.out.println("here in update 3");
			   String query1="update veh_request set allotted=? where req_sno=?";
			  
			   System.out.println("here in update 4");
			   PreparedStatement st = conn.prepareStatement(query1);
			   st.setString(1,"y");
			   st.setInt(2,id_sno);
			   st.executeUpdate();
			   System.out.println("here in update 5");
			   String query3="select req_sno,allotted_by,report_time,req_date from veh_request";
			   String query4="select veh_sno,veh_type_sno from veh_mst";
			   
			   String query2="insert into veh_request_allot(req_sno,req_veh_sno,allot_date,allot_time,veh_type_sno,veh_sno) values(?,?,?,?,?,?)";
			   System.out.println("here in update 6");
			   PreparedStatement st2 = conn.prepareStatement(query3);
			   PreparedStatement st3 = conn.prepareStatement(query4);
			   ResultSet rs=st2.executeQuery();
			   PreparedStatement st1= conn.prepareStatement(query2);
			   System.out.println("here in update 7");
			   
			   while(rs.next())
			   { 
				   allot_sno=rs.getInt("req_sno");
				   reqsno=rs.getInt("allotted_by");
				   allot_time=rs.getTime("report_time");
				   allot_date=rs.getDate("req_date");
			   }
			   System.out.println("here in update 8");
			   ResultSet rs1=st3.executeQuery();
			   while(rs1.next())
			   { 
				   vehsno=rs1.getInt("veh_sno");
				   vehtypesno=rs1.getInt("veh_type_sno");
			   }
			   System.out.println("here in update 9");
			  
			   st1.setInt(1,allot_sno);
			   st1.setInt(2,reqsno);
			   st1.setDate(3,allot_date); System.out.println("here in update 10");
			   st1.setTime(4,allot_time);
			   st1.setInt(5,vehtypesno);
			   st1.setInt(6,vehsno);
			   
			   st1.execute();
			 /* if(rs.next())
			  {
				  String r=rs.getString("req_sno"); 
				  int req_sno=Integer.parseInt(r);
				  String user_name=rs.getString("user_name"); 
				  
				  System.out.println(user_name + "hi");
				  
				  String req_from=rs.getString("req_from");
				  String trip_hours=rs.getString("trip_hours");
				  request.setAttribute("req_sno", req_sno);
				  request.setAttribute("user_name", user_name);
			      request.setAttribute("req_from", req_from);
				  request.setAttribute("trip_hours",trip_hours);
				  
				*/ 
			   
			   out.println("<script> alert('approved');</script>");
			   request.getRequestDispatcher("dashboardtrial.jsp").include(request, response);
				  
			
			  //}
	}
catch(Exception e)
		{
	     System.out.println(e.getMessage());
		}
	
	}

}