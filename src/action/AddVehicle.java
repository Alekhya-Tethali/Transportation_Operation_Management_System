package action;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AddVehicleBean;
import dao.AddVehicleDao;

public class AddVehicle extends HttpServlet
{
	public static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		response.setContentType("text/html");	
		PrintWriter out= response.getWriter(); 
		String Ser_Pro="bow";
		   try {
		    Ser_Pro=request.getParameter("vehi_sp_dpdwn"); System.out.println(Ser_Pro);} catch(Exception e) { e.getMessage();}
		   String Veh_Regn_No=request.getParameter("vhreg");
		   String Veh_Type=request.getParameter("vehi_type_dpdwn");
		   String Veh_Brand=request.getParameter("vehi_brand_dpdwn");
		   String Veh_Model=request.getParameter("vehi_model_dpdwn");
		   String Veh_slab=request.getParameter("vehi_slabs_dpdwn");
		   String Veh_Photo_Upload=request.getParameter("vehphoto");
		   String Veh_RC_Upload=request.getParameter("vehrc");
		   String Driv_Name=request.getParameter("driname");
		   String Driv_Mobile_No=request.getParameter("mobno");
		   String Driv_Aadhar=request.getParameter("adhrno");
		   String Alt_Driv_Name=request.getParameter("altdr");
		   String Alt_Driv_Mobile_No=request.getParameter("altdrmob");
		   String Driv_Photo_Upload=request.getParameter("drivphoto");
		   String Driv_Licence_Upload=request.getParameter("drivlicence");
		   String Active=request.getParameter("Active");
		
		AddVehicleBean avmb = new AddVehicleBean(Ser_Pro,Veh_Regn_No,Veh_Type,Veh_Brand,Veh_Model,Veh_slab,Veh_Photo_Upload,Veh_RC_Upload,Driv_Name,Driv_Mobile_No,Driv_Aadhar,Alt_Driv_Name,Alt_Driv_Mobile_No,Driv_Photo_Upload,Driv_Licence_Upload,Active);
		System.out.println("Created object for bean, calling dao");
		boolean avmstatus=AddVehicleDao.addvehbean(avmb);
		System.out.println("Came back frm dao");
		
		if(avmstatus)
		{
			System.out.println("Successful registeration");
			out.print("<script type= 'text/javascript'>"
					+ "alert('Details Added Sucessfully' );"
					+ "</script>");
			request.getRequestDispatcher("Add_Vehicle.jsp").include(request, response);
		}
		else
		{
			System.out.println("Unuccessful registeration");
			out.println("<script> alert('Invalid Details');</script>");
		    request.getRequestDispatcher("Add_Vehicle.jsp").include(request, response);
		} 
	}
}

