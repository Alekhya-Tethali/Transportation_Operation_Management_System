package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Vehbrandbean;

import database.ConnectionFactory;

public class VehbrandDao {
	public static boolean insertvehbrand(Vehbrandbean vb)
	{
		boolean status=false;
		String vehbrand, active;
	  
	     int i=0;
		vehbrand=vb.getVehBrand();
		active=vb.getActive();
		 try
		 {
			 Connection con=ConnectionFactory.getConnection();
             System.out.println("con");
      PreparedStatement pst=con.prepareStatement("insert into brands_mst(brand,active)values(?,?) ");//ON CONFLICT(brand) DO NOTHING
      System.out.println("connection insertion"); 
         pst.setString(1, vehbrand );
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
