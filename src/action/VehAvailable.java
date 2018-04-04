package action;

//import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import dao.Tarrifslabdao;
//import dao.VehavailableDao;
//import bean.Tarrifslabbean;
//import bean.VehAvailablebean;

/**
 * Servlet implementation class VehAvailable
 */
@WebServlet("/VehAvailable")
public class VehAvailable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html");	
		  
		   PrintWriter out= response.getWriter();
			String regdno=request.getParameter("regdno");
			String va_loc=request.getParameter("loc");System.out.println(va_loc);
			 System.out.println(regdno);int vsno=0;
		   Connection con=null;
		   
		   try{

				Class.forName("org.postgresql.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres", "admin");
				System.out.println("1");
			     
			       PreparedStatement ps=conn.prepareStatement("select * from veh_mst where veh_regn_no=?");  
			        ps.setString(1,regdno);
			       ResultSet rs=ps.executeQuery();
			     while(rs.next())
			     {
			       vsno=rs.getInt("veh_sno"); System.out.println(vsno);
			     }
		   }
		   catch(Exception e)
		   {
			   System.out.println(e.getMessage());
		   }
			 try
			 {
				 int i=0;System.out.println("111");
				
	
					Class.forName("org.postgresql.Driver");
				    System.out.println("driver connected");
					 con=DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB","postgres","admin");
					 // String query = "insert into veh_available(avail_date,avail_time,duty_assigned) values(sysDate(),sysTime(),'n')";
					 Calendar calendar = Calendar.getInstance();
					    java.sql.Date sysdate = new java.sql.Date(calendar.getTime().getTime());
					    java.sql.Time systime = new java.sql.Time(new java.util.Date().getTime());
					  
					
					    PreparedStatement pst=con.prepareStatement("insert into veh_available(veh_sno,avail_date,avail_time,duty_assigned,avail_location,sms_alert,email_alert) values(?,?,?,?,?,?,?)");
						
				      pst.setInt(1, vsno);
				      pst.setDate(2,sysdate);
				      pst.setTime(3,systime);
				      pst.setString(4,"n");
				      pst.setString(5,va_loc);
				      pst.setString(6,"n");
				      pst.setString(7,"n");
				      i=pst.executeUpdate();
				      if(i>0)
				    	  { System.out.println("in");
				    	  out.print("<script type= 'text/javascript'>alert('Registered Sucessfully' );</script>");
				  		request.getRequestDispatcher("vehicleavail.jsp").include(request, response);
				      	
				      	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
					}
					
					}
					catch(Exception e)
					{ 
					 System.out.println(e.getMessage());
					}
			 }
}