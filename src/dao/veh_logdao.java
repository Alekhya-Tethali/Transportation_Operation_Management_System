package dao;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import bean.veh_logbean;

import database.ConnectionFactory;

public class veh_logdao {
	
	public static boolean insertveh_log_book(veh_logbean e1) throws ParseException
	{
		boolean status=false;
		int opgkm,clgkm,claimkm,actualkm,lesskm,i=0,vehid;
		String logdate,otime,ctime,dtime,log_date="";
		opgkm=e1.getOpgkm();
		clgkm=e1.getClgkm();
		claimkm=e1.getClaimkm();
		lesskm=e1.getLesskm();
		actualkm=e1.getActualkm();
		logdate=e1.getLogdate();
		vehid=e1.getVehId();
		otime=e1.getOtime();
		ctime=e1.getCtime();
		dtime=e1.getDtime();
		//System.out.print(logdate);
		for(int j=0;j<logdate.length();j++)
		{
			
			if(logdate.charAt(j)=='/')
			{
				log_date=log_date+'-';
			}
			else
				log_date=log_date+logdate.charAt(j);
		}

			java.util.Date Log_date=new SimpleDateFormat("MM-dd-yyyy").parse(log_date);
		
			

		
		java.sql.Date Log_Date1=new java.sql.Date(Log_date.getTime());
		System.out.print(Log_Date1);
		
		java.util.Date OTime=new SimpleDateFormat("hh:mm").parse(otime);
		java.sql.Time oTime=new java.sql.Time(OTime.getTime());
		java.util.Date CTime=new SimpleDateFormat("hh:mm").parse(ctime);
		java.sql.Time cTime=new java.sql.Time(CTime.getTime());
		java.util.Date DTime=new SimpleDateFormat("hh:mm").parse(dtime);
		java.sql.Time dTime=new java.sql.Time(DTime.getTime());

			 try
		 {
   Connection con=ConnectionFactory.getConnection();
   
   
      PreparedStatement pst=con.prepareStatement("insert into veh_log_book(opg_km,clg_km,claim_km,less_km,actual_km,log_date,veh_id,opg_time,clg_time,duration) values(?,?,?,?,?,?,?,?,?,?)");
		     
         pst.setInt(1, opgkm);
         pst.setInt(2, clgkm);
         pst.setInt(3, claimkm);
         pst.setInt(4, lesskm);
         pst.setInt(5, actualkm);
         pst.setDate(6, Log_Date1);
         pst.setInt(7, vehid);
		pst.setTime(8,oTime);
		pst.setTime(9,cTime);
		pst.setTime(10, dTime);
         i=pst.executeUpdate();
         if(i>0)
        	 status=true;
         else
        	 status=false;
		 
		 }
    catch(Exception e)
		 {
    	 e.printStackTrace();
		 }
		return status;
		
	}

}


