package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.*;
import java.util.*;
import java.sql.Time;
//import java.time.LocalTime;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import bean.VehRequestBean;
import dao.VehRequestDao;
public class VehRequest extends HttpServlet {
	
		//private static final long serialVersionUID = -804510296503215396L;
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			  response.setContentType("text/html");	
			  
			  PrintWriter out= response.getWriter();System.out.println("hello");
			  String req_date=request.getParameter("reqdate");
			  String req_type=request.getParameter("Request_Type");
			   String visit_places=request.getParameter("fname1");
				String line_item_code=request.getParameter("lineitem");System.out.println(line_item_code);
				String req_from=request.getParameter("fromdate");
				String req_upto=request.getParameter("uptodate");
				  System.out.println(req_upto);
				String report_place=request.getParameter("reportplace");
				String req_for=request.getParameter("fname");
				String report_hr=request.getParameter("report_hr");
				String report_min=request.getParameter("report_min");
				String upto_hr=request.getParameter("upto_hr");
				String upto_min=request.getParameter("upto_min");
				String duration_hr=request.getParameter("duration_hr");
				String duration_min=request.getParameter("duration_min");
				VehRequestBean e1=new VehRequestBean(req_date,visit_places,line_item_code,req_from,req_upto,report_place,req_for,req_type,report_hr,report_min,upto_hr,upto_min,duration_hr,duration_min);
			  System.out.println("paramters");
				
			  boolean status=true;
			  try{
			  status = VehRequestDao.insertVehreq(e1);
			  }
			  catch(Exception e)
			  {
				  System.out.println(e.getMessage());
			  }
				if(status)
				{  System.out.println("status yes");
					
				out.print("<script type= 'text/javascript'>alert('Registered Sucessfully' );</script>");
				request.getRequestDispatcher("vehrequest.jsp").include(request, response);
		    	
		    	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
				}
				else
				{  System.out.println("status no");
					  out.println("<script> alert('Invalid Details');</script>");
		              request.getRequestDispatcher("vehrequest.jsp").include(request, response);			
				}
			}

		}