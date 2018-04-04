

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>TARIFF SLABS</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="tariffslabs.css" rel="stylesheet" />
<!-- Bootstrap -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" href="date1.css">
<script src="date1.js"></script>
<script src="date2.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			showOn : "button",
			buttonText : "Date"
		});
	});
</script>

<script>
	$(function() {
		$("#datepicker2").datepicker({
			showOn : "button",
			buttonText : "Date"
		});
	});
</script>
<script>
function validateForm() {
   var x = document.forms["tarrif_slabs"]["Slab_Id"].value;
    if (x == "") {
        alert("slab id  must be filled out");
 
        return false;
    }
    
    x = document.forms["tarrif_slabs"]["Slab_Km"].value;
    if (x == ""||isNaN(x)) {
        alert("check the slab km");
 
        return false;
    }
    
    x = document.forms["tarrif_slabs"]["Slab_Duration"].value;
    if (x == ""||isNaN(x)) {
        alert("check the slab duration");
 
        return false;
    }
    x = document.forms["tarrif_slabs"]["Slab_Amt"].value;
    if (x == ""||isNaN(x)) {
        alert("slab amount must be filled out");
 
        return false;
    }
    
    
   
    x = document.forms["tarrif_slabs"]["Valid_From"].value;
    if (x == "") {
        alert("valid from date must be filled out");
 
        return false;
    }
    x = document.forms["tarrif_slabs"]["Valid_Upto"].value;
    if (x == "") {
        alert("valid upto date must be filled out ");
 
        return false;
    }
     x = document.forms["tarrif_slabs"]["Driver_Da"].value;
    if (x == ""||isNaN(x)) {
        alert("check the driver da");
 
        return false;
    }
    
    var x = document.forms["tarrif_slabs"]["Extra_Km"].value;
    if (x == ""||isNaN(x)) {
        alert("check the extra km");
 
        return false;
    }
    var x = document.forms["tarrif_slabs"]["Extra_Hr"].value;
    if (x == ""||isNaN(x)) {
        alert("check the extra hour");
 
        return false;
    }
    
   
       var e = document.getElementById("Slab_Type");
            var optionSelIndex = e.options[e.selectedIndex].value;
            var optionSelectedText = e.options[e.selectedIndex].text;
            if (optionSelIndex == 0) {
                alert("Please select slab type");
                return false;
            }
        
 else 
    return true;

}
</script>
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
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>


	<div class="container">
		<div class="row">
			<div class="col-md-1" img-responsive>
				<img src="nrsc.png" alt="logo" width="60" height="60">
			</div>
			<div class="col-md-9">
				<div class="customdiv">
					<b>National Remote Sensing Centre<br>Transport Operations
						Management System
					</b>
				</div>
			</div>
			<div class="col-md-1" img-responsive>
				<img src="photo.png" alt="Photo" width="60" height="60">
			</div>
			<div class="col-md-1">
				<button class="btn btn-primary">Logout</button>
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
                                         	<a href="#">vehicle request</a>
				         				
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
	</div>
	</div>
	<center><h3><b>Tariff Slabs</b></h3></center>
	<form name="tarrif_slabs" onsubmit="return validateForm()" action="tarrifslabs" method="POST">
		<!--  <div class="container">-->
			<div class="row">
<br>
				<div class="col-sm-5">
					<div class="customdivblock">

						<div class="formstyle" id="info">
								</br/> &nbsp;&nbsp;&nbsp;&nbsp;Slab Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" name="Slab_Id" style="border:1px solid black; height:10px; width:150px;"> <br><br>
								 Slab Duration:&nbsp;&nbsp; <input type="number" name="Slab_Duration" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:150px;"><br><br>
								 Slab Km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="Slab_Km" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:150px;"> <br /><br> 
								Slab Amt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="Slab_Amt" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:150px;"><br> <br />

								Slab Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<%
 	try {
 		Class.forName("org.postgresql.Driver").newInstance();
 		Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
 				"admin");
 		String query_dropdown = "select * from slabs_mst order by slab_sno";
 		Statement std = conn.createStatement();
 		ResultSet rsd = std.executeQuery(query_dropdown);
 %>
								<select name="Slab_Type" id="Slab_Type" value="" style="border:1px solid black; height:25px; width:150px;">
									<option><%--select --%>
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
						
						</div>
					</div>
				</div>

			<!--  <div class="container">-->
			
				<div class="Right_Attributes_Tariff">
				<div class="col-sm-7">

					<div class="row"><br>
					&nbsp;&nbsp;&nbsp;&nbsp; 	Valid From:&nbsp;&nbsp; <input type="date"
							name="Valid_From" id="datepicker" style="border:1px solid black; height:20px; width:200px;">
					</div>
					<br>
					<div class="row">
						&nbsp;&nbsp;&nbsp;&nbsp; Valid Upto:&nbsp;&nbsp; <input type="date"
							name="Valid_Upto" id="datepicker2" style="border:1px solid black; height:20px; width:200px;">
					</div>
					<br />
					<div class="row">
						Extra Km:&nbsp;&nbsp;&nbsp;&nbsp;<input type="number"
							name="Extra_Km" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:200px;">
					</div>
					<br />

					<div class="row">
						 Extra Hour:&nbsp;&nbsp;<input type="number"
							name="Extra_Hr" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:200px;">
					</div>
					<br>
					<div class="row">
						 Driver DA:&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="number" name="Driver_Da" style="border:1px solid black; background-color:#E1DFDF; height:25px; width:200px;">
					</div>
					<br>
					</div>
			</div>
		</div>
		<div class="container">
			<div class="center">
				<br> Active : <input type="radio" name="Active" value="Y"
					checked>Yes <input type="radio" name="Active" value="N">No

			</div>
		</div>
		 
		<div class="container">
			<div class="row">
				<center><input type="submit" name="Add" value="Add"></center>
			</div>
		</div><br>
	</form>
	<div class="col-md-10 col-md-offset-1" >
	<form method="post" action="Updatets">
		<div class="dbtab">
			<table id="dbtable">
			<tr>
					<th>slab_sno</th>
					<th>slab_id</th>
					<th>slab_km</th>
					<th>slab_duration</th>
					<th>slab_amt</th>
					<th>extra_km</th>
					<th>extra_hr</th>
					<th>driver_da</th>
					<th>active</th>
					<th>slab_type</th>
					<th>valid_from</th>
					<th>edit</th>
				</tr>

				<%
					try {
						Class.forName("org.postgresql.Driver").newInstance();
						Connection conn = DriverManager
								.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
						String query = "select * from slabs_mst order by slab_sno";
						Statement st = conn.createStatement();
						ResultSet rs = st.executeQuery(query);
						
						
						while (rs.next()) {
				%>
				<tr>
					<%
						int idsno = rs.getInt("slab_sno");
					%>
					<td><%=idsno%></td>
					<td><%=rs.getString("slab_id")%></td>
					<%
						int slab_km = rs.getInt("slab_km");
					%>
					<td><%=slab_km%></td>
					<%
						int slab_duration = rs.getInt("slab_duration");
					%>
					<td><%=slab_duration%></td>
					<%
						int slab_amt = rs.getInt("slab_amt");
					%>
					<td><%=slab_amt%></td>
					<%
						int extra_km = rs.getInt("extra_km");
					%>
					<td><%=extra_km%></td>
					<%
						int extra_hr = rs.getInt("extra_hour");
					%>
					<td><%=extra_hr%></td>
					<%
						int driver_da = rs.getInt("driv_da");
					%>
					
					<td><%=driver_da%></td>
					<td><%=rs.getString("active")%></td>
					<td><%=rs.getString("slab_type")%></td>
					<td><%=rs.getDate("valid_from")%></td>
					<td><button type="submit" name="Submit123" value=<%=idsno%>><u>Update</u></button></td>
				</tr>
				<%
					}
					}

					catch (Exception e) {
						System.out.println(e.getMessage());
					}
				%>

			</table>
		</div>
	</form></div>
	<br>
	<br>
	<br>
</body>
</html>