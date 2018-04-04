package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AddVehiModelbean;
import bean.AddVehiModelbean;
import dao.AddVehiModelDao;

public class AddVehiModel extends HttpServlet
{
	public static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Entered AddVehiModel.java");
		response.setContentType("text/html");	
		PrintWriter out= response.getWriter();
		String vehi_brand_selected = request.getParameter("vehi_brand_dpdwn");
		String vehi_model = request.getParameter("vehiclemodel");
		String vehi_model_active=request.getParameter("Active");
		
		AddVehiModelbean avmb = new AddVehiModelbean(vehi_brand_selected, vehi_model, vehi_model_active);
		System.out.println("Created object for bean, calling dao");
		boolean avmstatus=AddVehiModelDao.insertModel(avmb);
		System.out.println("Came back frm dao");
		if(avmstatus)
		{
			System.out.println("Successful registeration");
			out.print("<script type= 'text/javascript'>alert('Vehicle Model Added Sucessfully' );</script>");
			request.getRequestDispatcher("VehicleAddModelJSP.jsp").include(request, response);
		}
		else
		{
			System.out.println("Unuccessful registeration");
			out.println("<script> alert('Invalid Details');</script>");
		    request.getRequestDispatcher("VehicleAddModelJSP.jsp").include(request, response);
		} 
	}
}


