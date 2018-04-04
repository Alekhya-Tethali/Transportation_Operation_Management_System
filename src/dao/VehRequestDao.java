package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date; 

import bean.VehRequestBean;
//import database.ConnectionFactory;

public class VehRequestDao {
	
	
		
		public static boolean insertVehreq(VehRequestBean e1)throws ParseException
		{System.out.println("helo dao");
			boolean status=false;
			String report_hr,report_min,upto_hr,upto_min,duration_hr,duration_min,req_date,req_type,visit_places,line_item_code,req_from,req_upto,report_place,req_for;
			int i=0;
			req_date=e1.getreq_date();
			visit_places=e1.getvisit_places();
			line_item_code=e1.getline_item_code();
			req_from=e1.getreq_from();
			req_upto=e1.getreq_upto();			System.out.println(req_date);
			report_place=e1.getreport_place();
			req_for=e1.getreq_for();
			req_type=e1.getreq_type();
			report_hr=e1.getreport_hr();
			report_min=e1.getreport_min();
			upto_hr=e1.getupto_hr();
			upto_min=e1.getupto_min();
			duration_hr=e1.getduration_hr();
			duration_min=e1.getduration_min();
		  String report_time=report_hr+":"+report_min;
		  String upto_time=upto_hr+":"+upto_min;
		  String duration_time=duration_hr+":"+duration_min;
			System.out.println("hi");
			java.util.Date request_from = new SimpleDateFormat("dd-MM-yyyy").parse(req_from);
			java.sql.Date vreq_from=new java.sql.Date(request_from.getTime());
			System.out.println("hi");
			java.util.Date request_upto = new SimpleDateFormat("dd-MM-yyyy").parse(req_upto);
			java.sql.Date vreq_upto=new java.sql.Date(request_upto.getTime());
			System.out.println(vreq_upto);
			java.util.Date request_date = new SimpleDateFormat("dd-MM-yyyy").parse(req_date);
			java.sql.Date vreq_date=new java.sql.Date(request_date.getTime());
			System.out.println("hi");
			System.out.println(report_time);
			
			
			java.util.Date rep_time=new SimpleDateFormat("hh:mm").parse(report_time);
			java.sql.Time vreport_time=new java.sql.Time(rep_time.getTime());
			
			System.out.println(vreport_time);
			java.util.Date up_time=new SimpleDateFormat("hh:mm").parse(upto_time);
			java.sql.Time vupto_time=new java.sql.Time(up_time.getTime());
			java.util.Date dur_time=new SimpleDateFormat("hh:mm").parse(duration_time);
			java.sql.Time vduration_time=new java.sql.Time(dur_time.getTime());
			System.out.println("hellooo");
			try
			 {
				System.out.println("line_item_code");
	 //  Connection con=ConnectionFactory.getConnection();
			 Class.forName("org.postgresql.Driver");
		       System.out.println("driver connected");
			  Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB","postgres","admin");
	   System.out.println("paramter coonnn");
	      PreparedStatement pst=con.prepareStatement("insert into veh_request(req_date,req_for,req_from,report_place,visit_places,req_type,line_item_code,req_upto,report_time) values(?,?,?,?,?,?,?,?,?)");
	      System.out.println("inserted");  
	   //    pst.setDate(1,vreq_date); 
	      pst.setDate(1,vreq_date);
	      pst.setString(2, req_for);
	      
	      pst.setDate(3, vreq_from);
	      pst.setString(4, report_place);
	       pst.setString(5, visit_places);
	       pst.setString(6,req_type);
	       pst.setString(7, line_item_code);
	      pst.setDate(8, vreq_upto);
	      pst.setTime(9,vreport_time);
		    i=pst.executeUpdate();
		    System.out.println("paramters query");
	         if(i>0)
	        	 status=true;
	         else
	        	 status=false;
			 
			 }
	    catch(Exception e)
			 {
	    	 e.printStackTrace();
	    	 e.getMessage();
			 }
			return status;
			
		}

	}


