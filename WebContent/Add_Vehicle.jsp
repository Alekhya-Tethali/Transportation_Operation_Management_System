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

<center><h3><b>Add Vehicle</b></h3></center>
<div class="col-xs-12">
<div class="formstyle" id="info">
<b> Ser. Prov:</b>
		<%
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres","admin");
			//Connection conn=ConnectionFactory.getConnection();
			String queryd = "select * from sp_mst";
			Statement std = conn.createStatement();
			ResultSet rsd = std.executeQuery(queryd);
	%>
		<select name="vehi_sp_dpdwn" value="">
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
      Veh. Regdn. No.:<input type="text" class="form-control" id="vh reg." name="vhreg" style="border:1px solid black;height:10px;">
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
      <input type="text" class="form-control" id="dri name" name="driname" style="border:1px solid black;height:10px;">
    </div>
    <br><br>
    <div class="form-group">
      <label for="mob no.">Mobile No.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="mob no." name="mobno" style="border:1px solid black;height:10px;">
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
			
				 Active : <input type="radio" name="Active" value="Y"
					checked>Yes <input type="radio" name="Active" value="N">No

			
		
		</div>	

<div class="container">


 <center>
		<input type="submit" value="Add" >
			 
   </center>
</div>        
<br>
</form>
<div class="col-md-10 col-md-offset-1" >
<form method="post" action="updateaddveh">
<div class="dbtab">
		<table class="table table-stripped">
			<tr>
				<th>SNo</th>
				<th>Ser. Pro.</th>
				<th>Veh. Regn. No.</th>
				<th>Driv Name</th>
				<th>Update</th>
			</tr>
			<%
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select veh_sno,ser_pro,veh_regn_no,driv_name from veh_mst order by veh_sno";
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(query);
					while (rs.next()) {
			%>
			<tr>
				<%
					int idsno = rs.getInt("veh_sno");
				%>
				<td><%=idsno%></td>
				<td><%=rs.getString("ser_pro")%></td>
				<td><%=rs.getString("veh_regn_no")%></td>
				<td><%=rs.getString("driv_name")%></td>


				<td><button type="submit" name="Submit123" value=<%=idsno%>><u>Update</u></button></td>
			</tr>
			<%
				conn.close();
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			%>
		</table>
		
		</div>
	</form>
	<br><br><br>
</div>
</body>
</html>