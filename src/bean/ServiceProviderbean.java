




package bean;

public class ServiceProviderbean {

	String service_name,  order_number ;
    
	String valid_from,valid_upto,sp_address,sp_contact,sp_email, sp_phno;
	 public ServiceProviderbean(String service_name, String order_number,String valid_from,String valid_upto,String sp_address,String sp_contact,String sp_phno,String sp_email) {
		 this.service_name=service_name;
		 this.order_number=order_number;
		this.valid_from=valid_from;
		this.valid_upto=valid_upto;
		this.sp_address=sp_address;
		this.sp_contact=sp_contact;
		this.sp_phno=sp_phno;
		this.sp_email=sp_email;
		
	 }

	public String getService_name() {
		return service_name;
	}

	 
	public String getOrder_number() {
		return order_number;
	}

	public String getValid_from() {
		return valid_from;
	}
	
	public String getValid_upto() {
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
		 public String getSp_phno()
		 {
			 return sp_phno;
		 }
		 public String getSp_email()
		 {
			 return sp_email;
		 }
		 
		/* public void setService_name(String service_name) {
				this.service_name = service_name;
			}

			public void setOrder_number(String order_number) {
				this.order_number = order_number;
			}

			public void setValid_from(String valid_from) {
				this.valid_from = valid_from;
			}

			public void setValid_upto(String valid_upto) {
				this.valid_upto = valid_upto;
			}

			public void setSp_address(String sp_address) {
				this.sp_address = sp_address;
			}

			public void setSp_contact(String sp_contact) {
				this.sp_contact = sp_contact;
			}

			public void setSp_email(String sp_email) {
				this.sp_email = sp_email;
			}

			public void setSp_phno(String sp_phno) {
				this.sp_phno = sp_phno;
			}*/
	 }