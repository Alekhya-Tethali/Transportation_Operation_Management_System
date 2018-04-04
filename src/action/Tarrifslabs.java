package action;

import bean.Tarrifslabbean;
import dao.Tarrifslabdao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.*;
import java.util.*;

@WebServlet("/tarrifslabs")
public class Tarrifslabs extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");	
		  
		   PrintWriter out= response.getWriter();
		  
		   String tslab_id=request.getParameter("Slab_Id");
		   String active=request.getParameter("Active");
		   String tslab_type=request.getParameter("Slab_Type");
	       int	tslab_km=Integer.parseInt(request.getParameter("Slab_Km"));
	       int	tslab_duration=Integer.parseInt(request.getParameter("Slab_Duration"));
           int	tslab_amt=Integer.parseInt(request.getParameter("Slab_Amt"));
           int	extra_km=Integer.parseInt(request.getParameter("Extra_Km"));
	       int	extra_hr=Integer.parseInt(request.getParameter("Extra_Hr"));
	       int driver_da=Integer.parseInt(request.getParameter("Driver_Da"));
	       String valid_from=request.getParameter("Valid_From");
	       //String valid_to=request.getParameter("Valid_To");
	     
	                     //   SimpleDateFormat("dd/MM/yyyy").parse(valid_from);
	       //SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
	      // Date date = formatter.parse(valid_from);
	       

        	//ServiceProviderbean sp = new ServiceProviderbean(service_name,order_number,valid_from,valid_upto,sp_address,sp_contact,sp_phno,sp_email);
		 
		   Tarrifslabbean ts = new Tarrifslabbean(tslab_id,active,tslab_type,tslab_km,tslab_duration,tslab_amt,extra_km,extra_hr,driver_da,valid_from);
	
	//boolean status=Tarrifslabdao.tarrifSlabs(ts);
		   boolean status=true;
		   try{
	 status=Tarrifslabdao.tarrifSlabs(ts);
	}
	catch (Exception e)
	{
		System.out.println("er");
	}
   
	if(status)
	{
		
		out.print("<script type= 'text/javascript'>alert('Registered Sucessfully' );</script>");
		request.getRequestDispatcher("tslabs.jsp").include(request, response);
    	
    	out.print("\n<input type='button' value='Print' onclick='window.print()'>");
	}
	else
	{

		 out.println("<script> alert('Invalid Details');</script>");
         request.getRequestDispatcher("tslabs.jsp").include(request, response);
	}
}

}
