package action;
import java.io.IOException;

import java.io.PrintWriter;
import java.lang.*;
import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Locale;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.veh_logbean;
import dao.veh_logdao;
public class veh_log extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -804510296503215396L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
		  PrintWriter out= response.getWriter();
		   String Clgkm=request.getParameter("Clg.km");
			String Opgkm=request.getParameter("Opg.km");
			String Claimkm=request.getParameter("Claim.km");
			String Lesskm=request.getParameter("Less.km");
			String Actualkm=request.getParameter("Actual.km");
			String Logdate=request.getParameter("Log.Date");
			String Vehid=request.getParameter("Veh.ID");
			String Ohour=request.getParameter("O.hour");
			String Ominute=request.getParameter("O.minute");
			String Otime=Ohour+":"+Ominute;
			String Chour=request.getParameter("C.hour");
			String Cminute=request.getParameter("C.minute");
			String Ctime=Chour+":"+Cminute;
			String Dhour=request.getParameter("D.hour");
			String Dminute=request.getParameter("D.minute");
			String Dtime=Dhour+":"+Dminute;
		
		
		System.out.print(Otime);
				
			
            int Opg_km=Integer.parseInt(Opgkm);
			int Clg_km=Integer.parseInt(Clgkm);
			int Claim_km=Integer.parseInt(Claimkm);
			int Less_km=Integer.parseInt(Lesskm);
			int Actual_km=Integer.parseInt(Actualkm);
			int Veh_id=Integer.parseInt(Vehid);
			
			veh_logbean e1=new veh_logbean(Opg_km,Clg_km,Claim_km,Less_km,Actual_km,Logdate,Veh_id,Otime,Ctime,Dtime);
		  
			
			boolean status=true;
			try {
				status = veh_logdao.insertveh_log_book(e1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status)
			{
				out.println("<script> alert('valid Details');</script>");
				   request.getRequestDispatcher("vehicle_log.jsp").forward(request, response);
				   
			}
			else
			{
				  out.println("<script> alert('Invalid Details');</script>");
	              request.getRequestDispatcher("vehicle_log.jsp").include(request, response);			
			}
		}

	}


