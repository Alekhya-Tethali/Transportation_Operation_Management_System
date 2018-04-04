<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="customstyles.css" rel="stylesheet" />
<style>
@media (max-width: 320px) { .container{
				width: 220px;
			            }
		           }
@media (min-width: 320px) { .container {
				width: 320px;
			            }
		           }
@media (min-width: 481px) { .container{
				width: 481px;
			            }
		           }
@media (min-width: 641px) { .container{
				width: 641px;
			            }
		           }
@media (min-width: 961px) { .container{
				width: 961px;
			            }
		           }
@media (min-width: 1000px) { .container{
				width: 1000px;
			            }
		           }
		        </style>
</head>
  <body>
  <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> -->
<div class="container">
	<div class="row">
		<div class="col-md-1" img-responsive><img src="nrsc.png" alt="logo" width="70" height="70" border="2"></div>
		<div class="col-md-9">
			<div class="customdiv"><b>National Remote Sensing Centre<br>Transport Operations Management System</b></div>
		</div>
		<div class="col-md-1" img-responsive><img src="photo.png" alt="Photo" width="70" height="70"></div>
		<div class="col-md-1">
			<button class="btn"><a href="login.html">Logout</a></button>
		</div>
	</div>
	</br>

	 <div class="row">
            <div class="col-xs-12">
		        <div class="dropdown">
                   <button class="dropbtn">Vehicle</button>
                               <div class="dropdown-content">
                                         <a href="service.jsp">service provider</a>
		  								 <a href="Add_Vehicle.jsp">add vehicle</a>
		  								 <a href="vehicle_log.jsp">daily log</a>
		  								 <a href="VehicleAddModelJSP.jsp">add vehicle model</a>
					 					 <a href="vehbrand.jsp">add vehicle brand</a>
					  					 <a href="vehicletypes.jsp">add vehicle type</a>
		  								 <a href="#">routes</a>
                                         <a href="tslabs.jsp">tariff slabs</a>	 		
 	          				   </div>
                </div>
    			<div class="dropdown">
		   			<button class="dropbtn">Operations</button>
					
                               <div class="dropdown-content">
                                         	<a href="vehrequest.jsp">vehicle request</a>
				         				
					 						<a href="#">approval</a>
											
					 						<a href="#">allotment</a>
                                        			
 				 			   </div>
                </div>
                <div class="dropdown">
		  			<button class="dropbtn">Billing</button>
                               <div class="dropdown-content">
									 <a href="#">diesel prices</a>
					 					<a href="#">fuel bills</a>
					 					
					 					<a href="#">defect reporting</a>
					  					
                                         <a href="#">defect repair approval</a>
   					
 								 </div>
                </div>
				<div class="dropdown">
		    		<button class="dropbtn">Reports</button>
                               <div class="dropdown-content">
									 	<a href="#">daily mileage</a>
									
					 					<a href="#">requests for hiring</a>
										
					 					<a href="#">request for pickup/drop</a>
										
                                         <a href="#">routes</a>
   					 					<a href="#">RTA rules</a>
 				 				</div>
                 </div>
				   <button class="dropbtn">Query</button>
                   <button class="dropbtn">Sys Admin</button>
 		
	     </div>
	</div>
<br>
</div>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Availability</title>

<%! 

String userva_loc;
%>

<%
System.out.println("1");

//String va_loc = request.getParameter("loc");
//String sql = "select * from veh_available";

try{

	Class.forName("org.postgresql.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres", "admin");
	System.out.println("1");
     
       PreparedStatement ps=conn.prepareStatement("select * from veh_mst");  
        
       ResultSet rs=ps.executeQuery();System.out.println("2");
       
      
      while(rs.next())
          { %><center>
    	  <table>
            <col width="15%">
            <col width="30%">
            <col width="40%">
    	  <tr>

    	  <td><form name="form1" action="VehAvailable" method="post">
    		  
    		  <p id="demo">
    		  <input type="hidden" value="<%=rs.getString(2)%>" name="regdno">
    		  <%=rs.getString(2)%></p>
    		 <%
    		  System.out.println("33");
    		 %>
    		      <div class="row">
    		       
    		        
    		      <select id="loc"  name="loc">   		    
                   <option value="" selected disabled hidden>AVAILABLE</option>
                   <option value="shadnagar">shadnagar</option>
                    <option value="balnagar">balnagar</option> 
                     <option value="jeedimetla">jeedimetla</option>
                </select>
    		         <input type="submit" name="ok" value="ok">    		 <br>
    		        
                </div>
    		  </form><td>
    	  <td><% if(rs.next()){%>
    	  <form name="form1" action="VehAvailable" method="post">
    		  
    		  <p id="demo">
    		  <input type="hidden" value="<%=rs.getString(2)%>" name="regdno">
    		  <%=rs.getString(2)%></p>
    		 <%
    		  System.out.println("33");
    		 %>
    		      <div class="row">
    		       
    		        
    		      <select id="loc"  name="loc">   		    
                   <option value="" selected disabled hidden>AVAILABLE</option>
                   <option value="shadnagar">shadnagar</option>
                    <option value="balnagar">balnagar</option> 
                     <option value="jeedimetla">jeedimetla</option>
                </select>
    		         <input type="submit" name="ok" value="ok">    		 <br>
    		        
                </div>
    		  </form><%}
    	  else
    	  {
    	  break;
    	  }%></td>
    	  <td><% if(rs.next()){%>
    	  <form name="form1" action="VehAvailable" method="post">
    		  
    		  <p id="demo">
    		  <input type="hidden" value="<%=rs.getString(2)%>" name="regdno">
    		  <%=rs.getString(2)%></p>
    		
    		      <div class="row">
    		       
    		        
    		      <select id="loc"  name="loc">   		    
                   <option value="" selected disabled hidden>AVAILABLE</option>
                   <option value="shadnagar">shadnagar</option>
                    <option value="balnagar">balnagar</option> 
                     <option value="jeedimetla">jeedimetla</option>
                </select>
    		         <input type="submit" name="ok" value="ok">    		 <br>
    		        
                </div>
    		  </form><%}
    	  else
    	  {
    	  break;
    	  }%></td>
    	  
    	  

    	  </tr>

    	  </table></center>
      
    		  
    		  <% 
			
	        }
      String vloc=request.getParameter("loc");System.out.println(vloc);

       } 

catch(Exception e)
{
	System.out.println(e.getMessage());
}
       %>

</body>

</html>