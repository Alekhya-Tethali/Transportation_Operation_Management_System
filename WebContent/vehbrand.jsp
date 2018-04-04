<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<title>Vehicle Brand</title>
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
			<button class="btn"><a href="Login.html">Logout</a></button>
		</div>
	</div>
<script>
function validateForm() {
    var x = document.forms["insert"]["vehiclebrand"].value;
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
<body>
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
<h3 align="center"> Vehicle Brands </h3> <br>
<form name="insert" action="brand"  onsubmit="return validateForm()"  method="POST" >
<center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle Brand:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <input type="text" name="vehiclebrand" value="" style="border:1px solid black;height:10px; width:auto;">
  <br>
  <br>
Active: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="radio" name="Active" value="Y"> Yes &nbsp;&nbsp;&nbsp;
 <input type="radio" name="Active" value="N"> No<br><br>
 <input type="submit" name="Add" value="Add">
</center>
<br>
</form>

<form method="post" action="updatevehbrand">
<div class="dbtab">
<table>
<tr><th>sno</th><th>brand</th><th>active</th><th>Update</th></tr>
<%
try {
Class.forName("org.postgresql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
String query = "select * from brands_mst order by brand_sno";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
int idsno;
while(rs.next()){
%>
<tr>
<%  idsno=rs.getInt("brand_sno");%>
<td><%=idsno %></td>
<td><%=rs.getString("brand")%></td>
<td><%=rs.getString("active")%></td>


<td><button type="submit" name="Submit123" value=<%=idsno%>><u>Update</u></button></td>

</tr>
<%
}
}
catch(Exception e){System.out.println("Exception");}
%>
</table>
</div>
</form>
</body>