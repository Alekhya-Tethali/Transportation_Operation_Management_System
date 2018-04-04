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

 button {
    background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
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

	
		<br/>
		<form method="post" action="dashboardtrial.jsp">
		<div class="row">
	                   <center><h4><b>Allotment</b></h4></center>
	     </div>  
	     
	     
	     <div class="row" style="border:1px solid black;">
	     <div class="dbtab">
	                 
       <table class="table table-stripped table-responsive">
			<tr>
				<th>S.no</th>
				<th>Req.ID</th>
				<th>Veh Type</th>
				<th>Qty</th>
				<th>Date</th>
				<th>Time</th>
				<th>Rep.place</th>
				<th>Indenter/User name</th>
				<th>Allot</th>
				<th>Veh.ID</th>
				<th>Edit Allot</th>
				
			</tr>
			<%
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select vr.allot_sno,v.req_sno,v.req_type,v.veh_count,v.req_date,v.report_time,v.report_place,v.user_name,v.allotted,vr.veh_sno from veh_request v,veh_request_allot vr where allotted='y' AND v.req_sno=vr.req_sno";
					Statement st = conn.createStatement();
					System.out.println("start of table");
					
					ResultSet rs = st.executeQuery(query);System.out.println("printing table elements");
					while (rs.next()) {
			%>
			<tr>
				<%System.out.println("printing table elements");

				int idsno = rs.getInt("allot_sno");
				System.out.println("printing table elements");
				%>
				<td><%=idsno%></td>
				<td><%=rs.getString("req_sno")%></td>
				<td><%=rs.getString("req_type")%></td>
				<td><%=rs.getInt("veh_count")%></td>
				<td><%=rs.getString("req_date")%></td>
				<td><%=rs.getString("report_time")%></td>
				<td><%=rs.getString("report_place")%></td>
				<td><%=rs.getString("user_name")%></td>
				<td><%=rs.getString("allotted")%></td>
				<td><%=rs.getInt("veh_sno")%></td>
				<td><button type="submit"  name="Submit123" value=<%=idsno%>
						style=><u>Edit</u></button></td>
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
    <center><h4><b>Vehicle Available</b></h4></center>
  </div>
 <div class="row" style="border:1px solid black;">
 <div class="dbtab">
 <table class="table table-stripped table-responsive">
			<tr>
				<th>S.no</th>
				<th>Veh ID</th>
				<th>Reg.No</th>
				<th>SP Name</th>
				<th>So Far KM used</th>
				<th>So FAR HR</th>
				<th>Available</th>
				<th>Status</th>
				
			</tr>
			<%
				try {int km=0;
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select distinct(va.veh_sno),vl.veh_id,v.veh_regn_no,s.sp_name,va.avail_location,va.duty_assigned from veh_mst v,veh_request_allot vr,veh_log_book vl,veh_log_book_det vd,veh_available va,sp_mst s where s.veh_type_sno=v.veh_type_sno AND va.veh_sno=v.veh_sno AND vl.veh_sno=va.veh_sno";					
					
					String q2="select sum(vd.trip_duration),sum(vd.end_km-vd.start_km) from veh_log_book_det vd,veh_available va where va.veh_sno=vd.veh_sno";
					Statement st = conn.createStatement();	Statement st1 = conn.createStatement();
					System.out.println("start of table");
					
					ResultSet rs = st.executeQuery(query);		System.out.println("start of tableghhghg");
					ResultSet rs1 = st1.executeQuery(q2);
				
					while (rs.next()&&rs1.next()) {
			%>
			<tr>
				<%

				int idsno = rs.getInt("veh_sno");
				System.out.println(idsno);
				%>
				<td><%=idsno%></td>
				<td><%=rs.getInt("veh_id")%></td>
				<td><%=rs.getString("veh_regn_no")%></td>
				<td><%=rs.getString("sp_name")%></td>
				<td><%=rs1.getInt(2)%></td>
				<td><%=rs1.getTime(1)%></td>
				<td><%=rs.getString("avail_location")%></td>
				<td><%=rs.getString("duty_assigned")%></td>
				
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
		</div>
		</form>
</div>

</body>
</html>