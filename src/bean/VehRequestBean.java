package bean;
//import java.time.LocalTime;


public class VehRequestBean {

		private String report_hr,report_min,upto_hr,upto_min,duration_hr,duration_min,req_date,req_type,visit_places,line_item_code,req_from,req_upto,report_place,req_for;
		
		
		 public  VehRequestBean(String req_date,String visit_places,String line_item_code,String req_from,String req_upto,String report_place,String req_for,String req_type,String report_hr,String report_min,String upto_hr,String upto_min,String duration_hr,String duration_min){
			 System.out.println("bean");
			this.req_date=req_date;
			 this.visit_places=visit_places;
			 this.line_item_code=line_item_code;
			 this.req_from=req_from;
			 this.req_upto=req_upto; 
			 this.report_place=report_place;
			 this.req_for=req_for;
			 this.req_type=req_type;
			 this.report_hr=report_hr;
			 this.report_min=report_min;
			 this.upto_hr=upto_hr;
			 this.upto_min=upto_min;
			 this.duration_hr=duration_hr;
			 this.duration_min=duration_min;
			  System.out.println("status this");
			
		 }
		public String getreq_date() {
				return req_date;
		}
		public String getvisit_places() {
			return visit_places;
		}

	public String  getline_item_code() {
			return line_item_code;
		}
		
		public String getreq_from() {
			return req_from;
		}
		public String getreq_type() {
			return req_type;
		}
		public String getreq_upto() {
			return req_upto;
		}
		public String getreq_for() {
			return req_for;
		}
		public String getreport_place() {
			return report_place;
		}

		public String getreport_hr() {
			return report_hr;
		}
		public String getreport_min() {
			return report_min;
		}
		public String getupto_hr() {
			return upto_hr;
		}
		public String getupto_min() {
			return upto_min;
		}
		public String getduration_hr() {
			return duration_hr;
		}
		public String getduration_min() {
			return duration_hr;
		}
	}

