package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;


import bean.Veh_Typebean;

import database.ConnectionFactory;

public class Veh_Typedao {

	public static boolean insertvehicle(Veh_Typebean vt)
	{
		boolean status=false;
		String vehname, active;
	  
	     int i=0;
		vehname=vt.getVehName();
		active=vt.getActive();
		 try
		 {
			 Connection con=ConnectionFactory.getConnection();
             System.out.println("con");
      PreparedStatement pst=con.prepareStatement("insert into vehicle_types_mst(veh_type,active)values(?,?) "); //ON CONFLICT(veh_type) DO NOTHING
      System.out.println("connection insertion"); 
         pst.setString(1, vehname );
         pst.setString(2, active);
         System.out.println("queries");
         i=  pst.executeUpdate();
			if(i>0)
			{	 System.out.println("inserted");
			
				status=true;
			}}
		 
    catch(Exception e)
		 {
    	 e.printStackTrace();
		 }
		return status;
		
	}
	
	
	
}