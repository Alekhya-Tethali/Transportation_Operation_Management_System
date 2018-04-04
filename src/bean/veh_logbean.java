package bean;

import java.sql.Date;
import java.time.LocalTime;

public class veh_logbean{
	
	private int Opg_km,Clg_km,Claim_km,Less_km,Actual_km,Veh_id;
	private String Logdate,Otime,Ctime,Dtime;
	
	 public  veh_logbean(int Opg_km, int Clg_km,int Claim_km,int Less_km,int Actual_km,String Logdate,int Veh_id,String Otime,String Ctime,String Dtime){
		 this.Opg_km=Opg_km;
		 this.Clg_km=Clg_km;
		 this.Claim_km=Claim_km;
		 this.Less_km=Less_km;
		 this.Actual_km=Actual_km;
		 this.Logdate=Logdate;
		 this.Veh_id=Veh_id;
		 this.Otime=Otime;
		 this.Ctime=Ctime;
		 this.Dtime=Dtime;

		
	 }
		

	public int getOpgkm() {
		return Opg_km;
	}

	 
	public int getClgkm() {
		return Clg_km;
	}
	public int getClaimkm() {
		return Claim_km;
	}
	public int getLesskm() {
		return Less_km;
	}
	public int getActualkm() {
		return Actual_km;
	}
	public int getVehId() {
		return Veh_id;
	}
	
	public String getLogdate() {
		return Logdate;
	}
	public String getOtime() {
		return Otime;
	}
	public String getCtime() {
		return Ctime;
	}
	public String getDtime() {
		return Dtime;
	}
}
