package bean;

public class Vehbrandbean {

	private String vehbrand, active;
	
	 public Vehbrandbean(String vehbrand, String active)
	 {
		 this.vehbrand=vehbrand;
		 this.active=active;
	 }

	public String getVehBrand() {
		 System.out.println("bean");
		return vehbrand;
	}

	 
	public String getActive() {
		return active;
	}
}
