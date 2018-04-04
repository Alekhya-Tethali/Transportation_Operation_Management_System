package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Employee;

import database.ConnectionFactory;

public class EmployeeDao {
	
	public static int validateEmployee(Employee e1)
	{
		int status=0;
		String userId,passWord;
		userId=e1.getUserId();
		passWord=e1.getPassWord();
		
		 try
		 {
   Connection con=ConnectionFactory.getConnection();
   
      PreparedStatement pst=con.prepareStatement("select role from employee where empid=? and emppwd=?");
		     
         pst.setString(1, userId );
         pst.setString(2, passWord);
      
  ResultSet rs= pst.executeQuery();
  String type="xxx";
  if(rs.next())
	  type=rs.getString("role");
  System.out.print(type);
  if("admin".equals(type))
  {
	  status=1;
  }
  else if("user".equals(type))
  {
	  status=2;
  }
  }
    catch(Exception e)
		 {
    	 e.printStackTrace();
		 }
		return status;
		
	}

}