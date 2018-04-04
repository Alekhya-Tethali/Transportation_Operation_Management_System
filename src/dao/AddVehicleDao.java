package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import bean.AddVehicleBean;
import database.ConnectionFactory;

public class AddVehicleDao {
	public static boolean addvehbean(AddVehicleBean av1) {
		boolean avmstatus = false;
		int avmi = 0;
		String Ser_Pro,Veh_Regn_No,Veh_Type,Veh_Brand,Veh_Model,Veh_slab,Veh_Photo_Upload,Veh_RC_Upload,Driv_Name,Driv_Aadhar,Alt_Driv_Name,Driv_Photo_Upload,Driv_Licence_Upload,Active,Driv_Mobile_No,Alt_Driv_Mobile_No,active;
		
		Ser_Pro=av1.getSer_Pro();
		Veh_Regn_No=av1.getVeh_Regn_No();
		Veh_Type=av1.getVeh_Type();
		Veh_Brand=av1.getVeh_Brand();
		Veh_Model=av1.getVeh_Model();
		Veh_slab=av1.getVeh_slab();
		Veh_Photo_Upload=av1.getVeh_Photo_Upload();
		Veh_RC_Upload=av1.getVeh_RC_Upload();
		Driv_Name=av1.getDriv_Name();
		Driv_Mobile_No=av1.getDriv_Mobile_No();
		Driv_Aadhar=av1.getDriv_Aadhar();
		Alt_Driv_Name=av1.getAlt_Driv_Name();
		Alt_Driv_Mobile_No=av1.getAlt_Driv_Mobile_No();
		Driv_Photo_Upload=av1.getDriv_Photo_Upload();
		Driv_Licence_Upload=av1.getDriv_Licence_Upload();
		active = av1.getActive();
		System.out.println("serpro is"+Ser_Pro);
		
		Connection con=ConnectionFactory.getConnection();
			System.out.println("Connection Established");
			
			try 
			{
				PreparedStatement pst = con.prepareStatement("INSERT into veh_mst(ser_pro,veh_regn_no,veh_type,veh_brand,veh_model,veh_slab,veh_photo_upload,veh_rc_upload,driv_name,driv_mobile_no,driv_aadhar,alt_driv_name,alt_driv_mobile_no,driv_photo_upload,driv_licence_upload,active) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				System.out.println("Insertion Statement Executed..");
				pst.setString(1,Ser_Pro);
				 pst.setString(2,Veh_Regn_No);
		   		 pst.setString(3,Veh_Type);
		   		 pst.setString(4,Veh_Brand);
		   		 pst.setString(5,Veh_Model);
		   		 pst.setString(6,Veh_slab);
		   		 pst.setString(7,Veh_Photo_Upload);
		   		 pst.setString(8,Veh_RC_Upload);
		         pst.setString(9,Driv_Name);
		         pst.setString(10,Driv_Mobile_No);
		         pst.setString(11,Driv_Aadhar);
		         pst.setString(12,Alt_Driv_Name); 
		         pst.setString(13,Alt_Driv_Mobile_No);
		         pst.setString(14,Driv_Photo_Upload);
		         pst.setString(15,Driv_Licence_Upload);
				pst.setString(16,active);
            System.out.println("set amvi");
				avmi = pst.executeUpdate();
				System.out.println(avmi);
				
				if (avmi > 0) 
				{
					avmstatus = true;
				} else 
				{
					avmstatus = false;
				}
				
			} catch (Exception e) 
			{
				System.out.println("Error in Running insertion Query");
				e.printStackTrace();
			}
		
		return avmstatus;
	}
}
