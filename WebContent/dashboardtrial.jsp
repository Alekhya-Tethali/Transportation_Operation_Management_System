<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Allotment</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="tariffslabs.css" rel="stylesheet" />
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

th {
	text-align: left;
	padding: 8px;
	background-color: #3366CC;
}

 td {
	text-align: left;
	padding: 8px;
	
}
tr:nth-child(even) {
	background-color: #93A6CB;
}

tr:nth-child(odd) {
	background-color: #9D9D9D;
}
div.dbtab {
	height: 180px;
	overflow: auto;
}
  </style>
    
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
<div class="container">
	<div class="row">
		<div class="col-md-1" img-responsive><img src="nrsc.png" alt="logo" width="60" height="60"></div>
		<div class="col-md-9">
			<div class="customdiv"><b>National Remote Sensing Centre<br>Transport Operations Management System</b></div>
		</div>
		<div class="col-md-1" img-responsive><img src="photo.png" alt="Photo" width="60" height="60"></div>
		<div class="col-md-1">
			<button class="btn btn-primary">Logout</button>
		</div>
	</div>
	<br/>
	</div>
	
		<br/>
		<form method="post" action="UpdateDashboard">
		
		<div class="row">
		<center><h3><b>My DashBoard</b></h3></center>
		</div>
		<div class="row">
		<div class="col-md-4">
		<center>
		<button class="btn btn-primary" type="submit" onclick="vehrequest.jsp" name="Vehrequest" value="newVehRequest">New Vehicle Request</button>
		</center>
		</div>
		<div class="col-md-4">
		
		</div>
		<div class="col-md-4">
		<center>
		<button class="btn btn-primary" type="submit" name="my usage" value="myusage">myUsage</button>
		</center>
		</div>
		
		</div>
		<div class="row">
		<center><h4><b>My Requests</b></h4></center>
		</div>
		
		<div class="row" style="border:1px solid black;">
		<div class="dbtab">
		<table class="table table-stripped table-responsive">
			<tr>
				
				<th>Sno</th>
				<th>Req.ID</th>
				<th>Date</th>
			 <th>Time</th>
			 <th>Status</th>
			<th>Allot Id</th>
			<th>Vehicle particular</th>
			<th>Edit/Allot</th>
			</tr>
			<%
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select allot_sno,v.req_sno,vr.allot_date,vr.allot_time,v.allotted,v.allotted_by,vm.veh_type from veh_request_allot vr,veh_request v,vehicle_types_mst vm where v.req_sno=vr.req_sno";
					Statement st = conn.createStatement();
					System.out.println("start of table");
					
					ResultSet rs = st.executeQuery(query);
					while (rs.next()) {
			%>
			<tr>
				<%

				int idsno = rs.getInt("allot_sno");
				System.out.println("printing table elements");
				%>
				<td><%=idsno%></td>
				<td><%=rs.getString("req_sno")%></td>
				
				<td><%=rs.getString("allot_date")%></td>
				<td><%=rs.getString("allot_time")%></td>
				<td><%=rs.getString("allotted")%></td>
				<td><%=rs.getString("allotted_by")%></td>
				<td><%=rs.getString("veh_type")%></td>
				
				
				

				<td><button type="submit" onclick="vehrequest.jsp" name="Submit123" value=<%=idsno%>
						style="background-color: #49743D; font-weight: bold; color: #ffffff;">Edit</button></td>
			</tr>
			<%
				conn.close();
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			
			%>
		</table>
		</div></div>
		<div class="row">
		<center><h1><b>Request for Approval</b></h1></center>
		</div>
		<div class="row"style="border:1px solid black;">
		
	           
<div class="dbtab">

		<table class="table table-stripped table-responsive">
			<tr>
				
				<th>Req.ID</th>
				<th>name</th>
				<th>Date</th>
				<th>Time</th>
				<th>purpose</th>
				<th>approve/reject</th>
			</tr>
			<%
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select req_sno,user_name,req_from,report_time,req_for from veh_request where allotted='n'";
					Statement st = conn.createStatement();
					System.out.println("start of table");
					
					ResultSet rs = st.executeQuery(query);
					while (rs.next()) {
			%>
			<tr>
				<%

				int idsno = rs.getInt("req_sno");
				System.out.println("printing table elements");
				%>
				<td><%=idsno%></td>
				<td><%=rs.getString("user_name")%></td>
				<td><%=rs.getString("req_from")%></td>
				<td><%=rs.getString("report_time")%></td>
				<td><%=rs.getString("req_for")%></td>

				<td><button type="submit" name="Submit123" value=<%=idsno%>
						style="background-color: #49743D; font-weight: bold; color: #ffffff;">Approve</button></td>
			</tr>
			<%
				conn.close();
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			
			%>
		</table></div>
		</div>
		</form>
</div>

</body>
</html>