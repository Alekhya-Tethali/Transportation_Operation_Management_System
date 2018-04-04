<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Vehicle</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="add_veh_customstyles.css" rel="stylesheet" />
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
<div class="container">
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

<center><h3><b>Add Vehicle</b></h3></center>
<%
		String serpro = (String) request.getAttribute("serpro");
	%>
	<%
		String vehregnno = (String)request.getAttribute("vehregnno");
	String active = (String) request.getAttribute("active");
	%>
	<%
		String drivname = (String) request.getAttribute("drivname");
	%>
	<%
		String id_vehsno_temp = String.valueOf(request.getAttribute("id_vehsno"));
	%>
	<%
		int id_vehsno = Integer.parseInt(id_vehsno_temp);
	%>
<form name="insert" action="updatequeryaddveh" method="POST">
<div class="col-xs-12">
<div class="formstyle" id="info">
<b> Ser. Prov:</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			String queryd = "select DISTINCT sp_name from sp_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_sp_dpdwn" value=<%=serpro%>>
		
			<%	while (rsd.next()) {
			%>
			<option><%=rsd.getString(1)%></option>
			<%
				}
			%>
		</select>
		<%
			conn.close();
			} catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>

<br>
</div>
</div>  
<div class="row">
<div class="col-xs-4">
<div class="customdivblock1">
<div class="formstyle" id="info">
<br>
<div class="col-sm-8">
 	<div class="form-group">
      Veh. Regdn. No.:<input type="text"
			name="vehreg" value=<%=vehregnno%> style="border:1px solid black;height:10px;">
    </div>

<b> &nbsp;&nbsp;Vehicle Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			String queryd = "select * from vehicle_types_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_type_dpdwn" value="">
		
			<%
				while (rsd.next()) {
			%>
			<option><%=rsd.getString(2)%></option>
			<%
				}
			%>
		</select>
		<%
			conn.close();
			} catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>
<br><br>
 <b> &nbsp;&nbsp;Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres","admin");
			String queryd = "select * from brands_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_brand_dpdwn" value="">
		
			<%
				while (rsd.next()) {
			%>
			<option><%=rsd.getString(2)%></option>
			<%
				}
			%>
		</select>
		<%
			conn.close();
			} catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>
		<br><br>
 <b>&nbsp;&nbsp;Model:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			String queryd = "select * from models_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_model_dpdwn" value="">
		
			<%
				while (rsd.next()) {
			%>
			<option><%=rsd.getString(2)%></option>
			<%
				}
			%>
		</select>
		<%
			conn.close();
			} catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>
		

<br><br>

<b> &nbsp;&nbsp;Slab:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");
			String queryd = "select * from slabs_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_slabs_dpdwn" value="">
		
			<%
				while (rsd.next()) {
			%>
			<option><%=rsd.getString(10)%></option>
			<%
				}
			%>
		</select>
		<%
			conn.close();
			} catch (Exception e) {
				out.println("wrong entry" + e);
			}
		%>
		<br><br>
<div class="col-sm-2" style="float: left;">
<button type="button" class="btn btn-sm btn-primary" name="vehphoto"style="border:1px solid black;">Upload Veh. photo</button>
</div>
<div class="col-sm-2" style="float: right;">
<button type="button" class="btn btn-sm  btn-primary" name="vehrc" style="border:1px solid black;">&nbsp;Upload Veh. RC&nbsp;</button>

</div>
</div>
</div>
</div>
</div>
<div class="customdivblock2">
<div class="formstyle" id="info">
<br>
<div class="col-sm-11">
  <div class="form-inline">
<div class="form-group">
      <label for="driver name">Driver Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="dri name" value=<%=drivname%> name="driname" style="border:1px solid black;height:10px;">
    </div>
    <br><br>
    <div class="form-group">
      <label for="mob no.">Mobile No.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="mob no." name="mobno"  style="border:1px solid black;height:10px;">
    </div>
<br><br>
    <div class="form-group">
      <label for="adhr no.">Aadhar No.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="adhr no." name="adhrno" style="border:1px solid black;height:10px;">
    </div>

<br><br>
    <div class="form-group">
      <label for="alt dr">Alt. Driver:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="alt dr" name="altdr" style="border:1px solid black;height:10px;">
    </div><br><br>

    <div class="form-group">
      <label for="alt drmob">Alt. Driver Mob.:&nbsp;</label>
      <input type="text" class="form-control" id="alt drmob" name="altdrmob" style="border:1px solid black;height:10px;">
    </div>

<br><br>
<div class="col-xs-4" style="float: center;">
<button type="button" class="btn btn-sm  btn-primary" name="drivphoto" style="border:1px solid black;">&nbsp;Upload Driver photo&nbsp;&nbsp;&nbsp;</button>
</div>
<div class="col-xs-5" style="float: right;">
<button type="button" class="btn btn-sm  btn-primary" name="drivlicence" style="border:1px solid black;">Upload Driver License</button>
<br>
<br>
</div>

</div>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="container" style="float:left;">
			
				 Active :			<%
			if (active.equals("Y")) {
				out.write(
						"<input type=radio name=Active value=Y checked> Yes<input type=radio name=Active value=N> No<br>");
			} else {

				out.write(
						"<input type=radio name=Active value=Y > Yes<input type=radio name=Active value=N checked> No<br>");
			}
		%>
		<input type="text" style="visibility: hidden" name="id_vehsno" value=<%=id_vehsno%>>
		
		</div>	

<div class="container">


 <center>
	
		<input type="submit" name="Submit" value="Update"
			style="background-color: #3366cc; font-weight: bold; color: #ffffff;">	 
   </center>
</div>        
<br>
</form>

	

</body>
</html>