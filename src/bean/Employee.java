package bean;

public class Employee {
	
	private String userId, passWord,role;
	
	 public  Employee(String userId, String passWord){
		 this.userId=userId;
		 this.passWord=passWord;
	 }

	public String getUserId() {
		return userId;
	}

	 
	public String getPassWord() {
		return passWord;
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}