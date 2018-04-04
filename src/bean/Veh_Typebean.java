package bean;

public class Veh_Typebean {
	
	private String vehname, active;
	
	 public Veh_Typebean(String vehname, String active)
	 {
		 this.vehname=vehname;
		 this.active=active;
	 }

	public String getVehName() {
		 System.out.println("bean");
		return vehname;
	}

	 
	public String getActive() {
		return active;
	}

}