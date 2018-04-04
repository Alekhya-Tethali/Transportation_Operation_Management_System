package dao;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.PreparedStatement;


import bean.ServiceProviderbean;
import database.ConnectionFactory;
import java.sql.PreparedStatement;
public class ServiceProviderDao {

	public static boolean insertService(ServiceProviderbean sp) throws ParseException
	{
		boolean status=false;
		String service_name,  order_number ;
	    String valid_from,valid_upto,sp_address,sp_email,sp_contact,sp_phno;
	     int i=0;
		service_name=sp.getService_name();
		valid_from=sp.getValid_from();
		order_number=sp.getOrder_number();
	    valid_upto=sp.getValid_upto();
		sp_address=sp.getSp_address();
		sp_phno=sp.getSp_phno();
		sp_contact=sp.getSp_contact();
		sp_email=sp.getSp_email();
		java.util.Date valid_From=new SimpleDateFormat("dd-MM-yyyy").parse(valid_from);
		java.sql.Date valid_From1=new java.sql.Date(valid_From.getTime());
		java.util.Date valid_Upto=new SimpleDateFormat("dd-MM-yyyy").parse(valid_upto);
		java.sql.Date valid_Upto1=new java.sql.Date(valid_Upto.getTime());
		 try
		 {
			 Connection con=ConnectionFactory.getConnection();
   
      PreparedStatement pst=con.prepareStatement("insert into sp_mst(sp_name,po_no,valid_from,valid_upto,ad_1,cont_person_name,tel_no,email)values(?,?,?,?,?,?,?,?)");
		     
         pst.setString(1, service_name );
         pst.setString(2, order_number);
         pst.setDate(3, valid_From1);
         pst.setDate(4, valid_Upto1);
         pst.setString(5, sp_address);
         pst.setString(6, sp_contact);
         pst.setString(7, sp_phno);
         pst.setString(8, sp_email);
        
      
         i=  pst.executeUpdate();
			if(i>0)
			{	
				status= true;
			}
			else
			{
				status=false;
			}
		 }
    catch(Exception e)
		 {
    	System.out.println("errorDao");
    	 e.printStackTrace();
		 }
		return status;
		
	}
	
	
}