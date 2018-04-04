<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Vehicle Types</title>
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
          table {
	border-collapse: collapse;
	width: 100%;
}

td {
	text-align: left;
	padding: 8px;
}
th {background-color: #3366cc;
	text-align: left;
	padding: 8px;
	color:#ffffff;
}

tr:nth-child(even) {
	background-color: #93A6CB;
}

tr:nth-child(odd) {
	background-color: #d9d9d9;
}
div.dbtab {
	height: 180px;
	overflow: auto;
}

        button {
    background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
}
</style>
</head>
<body>
<script>
function validateForm() {
    var x = document.forms["insert"]["vehicletype"].value;
    if (x == "") {
        alert("Name must be filled out");
 
        return false;
    }
    if((document.insert.Active[0].checked==false)&&(document.insert.Active[1].checked==false))
 {
  document.insert.Active[0].focus();
  alert("check the radio button");
  return false;
 }
 else 
    return true;

}
</script>  
<div class="container">
<form action="serve" method="post">
 <div class="row">
   <div class="col-md-1" img-responsive><img src="nrsc.png" alt="logo" width="90" height="70" border="2"></div>
	  <div class="col-md-9">
			<div class="customdiv"><b>National Remote Sensing Center<br>Transport Operations Management System</b></div>
	  </div>
		<div class="col-md-1" img-responsive><img src="photo.png" alt="Photo" width="70" height="70"></div>
		   <div class="col-md-1">
			<button class="btn btn-primary btn-md">&nbsp;&nbsp;Logout&nbsp;&nbsp;</button>
		   </div>
  </div>

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

<center><h3><b>Vehicle Types</b></h3></center><br>
<%String vehname=(String)request.getAttribute("vehname");%>
<%String num=String.valueOf(request.getAttribute("vehsno")); %>
<% int vehsno=Integer.parseInt(num);%>
<%String status=(String)request.getAttribute("status");%>
<center>
<form name="insert" action="updatequeryvehtype" method="POST" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle Types:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <input type="text" name="vehicletype" value=<%=vehname %> style="border:1px solid black;height:10px; width:auto;">

  <br>
  <br>
Active: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%if(status.equals("Y")){ 
 out.write("<input type=radio name=Active value=Y checked> Yes &nbsp;&nbsp;&nbsp; <input type=radio name=Active value=N> No<br>");
 } 
  else {
	  out.write("<input type=radio name=Active value=Y > Yes &nbsp;&nbsp;&nbsp; <input type=radio name=Active value=N checked> No<br>");
  } %>
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" value="Update">
<input type="text" style="visibility:hidden" name="sno" value=<%=vehsno%>>
</form>
</center>
<form method="post" action="Updatevehtype">
<div class="dbtab">
<table>
<tr><th>sno</th><th>type</th><th>active</th><th>Update</th></tr>
<%
try {
Class.forName("org.postgresql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
String query = "select * from vehicle_types_mst order by veh_type_sno";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<%int idsno=rs.getInt("veh_type_sno");%>
<td><%=idsno %></td>
<td><%=rs.getString("veh_type")%></td>
<td><%=rs.getString("active")%></td>


<td><button type="submit" name="submitvehtype" value=<%=idsno%>><u>Update</u></button></td>

</tr>
<%
}
}
catch(Exception e){System.out.println("Exception"+e.getMessage());}
%>
</table>
</div>
</form>
</body>
</html>