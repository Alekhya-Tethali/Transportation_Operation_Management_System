package bean;

public class Tarrifslabbean {
	int tslab_km,tslab_duration,tslab_amt,extra_km,extra_hr,driver_da;
	String tslab_id,active,valid_from,valid_upto,tslab_type;
  //  String valid_from,valid_upto,sp_address,sp_contact,sp_email;int sp_phno;
	public Tarrifslabbean(String tslab_id,String active,String tslab_type,int tslab_km,int tslab_duration,int tslab_amt,int extra_km,int extra_hr,int driver_da,String valid_from) {
		// public Tarrifslabbean(String tslab_id) {
		 this.tslab_id=tslab_id;
		 this.active=active;
		 this.tslab_type=tslab_type;
		 this.tslab_km=tslab_km;
		 this.tslab_duration=tslab_duration;
		 this.tslab_amt=tslab_amt;
		 this.extra_km=extra_km;
		 this.extra_hr=extra_hr;
		 this.driver_da=driver_da;
		this.valid_from=valid_from;
		//this.valid_to=valid_to;
		
		 System.out.println("in bean");
		
	 }

	public String getSlab_Id() {

		return tslab_id;
	}
	public String getSlab_Type() {

		return tslab_type;
	}

	 
	public int getSlab_Km() {
		return tslab_km;
	}
	public int getSlab_Amt() {
		return tslab_amt;
	}
	public int getSlab_Duration() {
		return tslab_duration;
	}
	public int getExtra_Km() {
		return extra_km;
	}
	public int getExtra_Hr() {
		return extra_hr;
	}
	public String getActive() {
		return active;
	}
	public int getDriver_da() {
		return driver_da;
	}
	public String getValid_from() {
		return valid_from;
	}
	
	/*public String getValid_upto() {
		return valid_upto;
	}
		 public String getSp_address()
		 {
			 return sp_address;
		 }
		 public String getSp_contact()
		 {
			 return sp_contact;
		 }
		 public int getSp_phno()
		 {
			 return sp_phno;
		 }
		 public String getSp_email()
		 {
			 return sp_email;
		 }*/
}
