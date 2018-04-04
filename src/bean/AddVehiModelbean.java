package bean;
public class AddVehiModelbean 
{
	String vehi_brand_selected;
	String vehi_model, vehi_model_active;

	public AddVehiModelbean(String vehi_brand_selected, String vehi_model, String vehi_model_active) 
	{
		 this.vehi_brand_selected=vehi_brand_selected;
		 this.vehi_model=vehi_model;
		 this.vehi_model_active=vehi_model_active;
	}

	public String getVehi_brand_selected() 
	{
		return vehi_brand_selected;
	}
	
	public String getVehi_model()
	{
		System.out.println("Bean return function");
		return vehi_model;
	}
	public String getVehi_model_active()
	{
		return vehi_model_active;
	}
}