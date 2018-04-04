package dao;
import java.sql.DriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;  
import java.util.Date;  

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import bean.Tarrifslabbean;

import java.sql.PreparedStatement;
public class Tarrifslabdao {
	public static boolean tarrifSlabs(Tarrifslabbean ts)throws ParseException
	{
		boolean status=false;
		String tslab_id,tactive,tslab_type,tslab_validfrom,tslabvalidfrom="" ;
	   // String valid_from,valid_upto,sp_address,sp_email,sp_contact;
	  int tslab_km,tslab_amt,tslab_duration,textra_km,textra_hr,tdriver_da;
	     int i=0;
	     
		tslab_id=ts.getSlab_Id();
		tslab_duration=ts.getSlab_Duration();
		tslab_amt=ts.getSlab_Amt();
		tslab_km=ts.getSlab_Km();
	    tactive=ts.getActive();
		textra_km=ts.getExtra_Km();
	    textra_hr=ts.getExtra_Hr();
		tdriver_da=ts.getDriver_da();
		tslab_type=ts.getSlab_Type();
		tslab_validfrom=ts.getValid_from();
		//sp_contact=sp.getSp_contact();
		//sp_email=sp.getSp_email();
		for(int j=0;j<tslab_validfrom.length();j++)
		{
			
			if(tslab_validfrom.charAt(j)=='/')
			{
				tslabvalidfrom=tslabvalidfrom+'-';
			}
			else
				tslabvalidfrom=tslabvalidfrom+tslab_validfrom.charAt(j);
		}
java.util.Date tsvalid_from = new SimpleDateFormat("MM-dd-yyyy").parse(tslabvalidfrom);
		
		//System.out.println(tsvalidfrom);

		//java.sql.Date sqlDate = new java.sql.Date(tsvalid_from.getTime());
		java.sql.Date tsDatefrom = new java.sql.Date(tsvalid_from.getTime());
		 Connection con=null;
		 System.out.println("in dao0");
		 try
		 {
			 System.out.println("in dao1");
			// Connection con=ConnectionFactory.getConnection();
		       Class.forName("org.postgresql.Driver");
		       System.out.println("driver connected");
			 con=DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB","postgres","admin");
      PreparedStatement pst=con.prepareStatement("insert into slabs_mst(slab_id,slab_km,slab_duration,slab_amt,extra_km,extra_hour,driv_da,active,slab_type,valid_from) values(?,?,?,?,?,?,?,?,?,?)");
      System.out.println("in dao2");
      
         pst.setString(1, tslab_id );
         pst.setInt(2, tslab_km);
         pst.setInt(3, tslab_duration);
         pst.setInt(4, tslab_amt);
         pst.setInt(5,textra_km);
         pst.setInt(6, textra_hr);
         pst.setInt(7, tdriver_da);
         pst.setString(8,tactive);
         pst.setString(9, tslab_type);
         pst.setDate(10, tsDatefrom);
        /* pst.setString(4, valid_upto);
         pst.setString(5, sp_address);
         pst.setString(6, sp_contact);
         pst.setInt(7, sp_phno);
         pst.setString(8, sp_email);
        */
        
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
    
    	System.out.print(e.getMessage());
		 }
		return status;
		
	}
}
