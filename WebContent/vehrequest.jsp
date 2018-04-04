<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>VEHICLE REQUEST</title>

    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="tariffslabs.css" rel="stylesheet" />
    <link href="customstyles.css" rel="stylesheet" />
   <link rel="stylesheet" href="date1.css">
  <script src="date1.js"></script>
  <script src="date2.js"></script>
  
  <script>
   $(function() {
            $( "#datepicker" ).datepicker({
                showOn: "button",
                buttonText: "Date"
            });
        });
  </script>

  <script>
   $(function() {
            $( "#datepicker2" ).datepicker({
                showOn: "button",
                buttonText: "Date"
            });
        });
  </script>
  <style type="text/css">
	.row.vdivide [class*='col-']:not(:last-child):after {
  background: #e0e0e0;
  width: 1px;
  content: "";
  display:block;
  position: absolute;
  top:0;
  bottom: 0;
  right: 0;
  min-height: 70px;
}

</style>
  
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
  
  <script>
function validateForm() {
   var x = document.forms["VehRequest"]["req_date"].value;
    if (x == "") {
        alert("valid request date must be filled out");
 
        return false;
    }
    
    x = document.forms["VehRequest"]["req_for"].value;
    if (x == "") {
        alert("Enter the purpose");
 
        return false;
    }
    
    x = document.forms["VehRequest"]["visit_places"].value;
    if (x == "") {
        alert(" places to visit must be filled out");
 
        return false;
    }
    
    
    x = document.forms["VehRequest"]["req_upto"].value;
    if (x == "") {
        alert(" 'valid upto date' must be filled out");
 
        return false;
    }
    x = document.forms["VehRequest"]["req_from"].value;
    if (x == "") {
        alert(" 'valid from date' must be filled out");
 
        return false;
    }
    x = document.forms["VehRequest"]["report_time"].value;
    if (x == "") {
        alert(" 'valid time' must be filled out");
 
        return false;
    }
    x = document.forms["VehRequest"]["report_place"].value;
    if (x == "") {
        alert("Enter report place");
 
        return false;
    }
    x = document.forms["VehRequest"]["line_item_code"].value;
    if (x == "") {
        alert("Enter the correct line item code ");
 
        return false;
    }
     x = document.forms["VehRequest"]["veh_count"].value;
    if (x == "") {
        alert("check the total no of vehicles");
 
        return false;
    }
    
    var x = document.forms["VehRequest"]["users_count"].value;
    if (x == "") {
        alert("Enter the number of users");
 
        return false;
    }
    
    var e = document.getElementById("request_type");
            var optionSelIndex = e.options[e.selectedIndex].value;
            var optionSelectedText = e.options[e.selectedIndex].text;
            if (optionSelIndex == 0) {
                alert("Please select a request type");
                return false;
            }
      
        
 else 
    return true;

}
</script>  

  </head>
<body>
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="date1.css">
<script src="date1.js"></script>
  <script src="date2.js"></script>

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
<div class="row">
            <div class="col-xs-12">
		        <div class="dropdown">
                   <button class="dropbtn">Vehicle</button>
                               <div class="dropdown-content">
                                         <a href="service_provider.html">service provider</a>
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


<form name="form-inline" action ="VehRequest" method ="post" >
<div class="row">
	<div class="col-sm-6">
	<center><H3> <b>Vehicle Request</b></H3></center>
	</div> 
	<div class="col-sm-6">
              <br>Request Date:<input type="text" name="reqdate"><br></div>
</div>
<br>
<div class="row" style="border:1px solid black;">
<div class="col-md-1"></div>
		<div class="col-md-11"><div class="row">
				<label for="fname">Purpose:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
 			 <input type="text" id="fname" name="fname" style="width:auto;">
		</div>
		 &nbsp;
		<div class="row">
		 <div class="form-inline">
  		<label for="fname1">Places to visit:&nbsp;&nbsp;</label>
 		 <input type="text" id="fname1" name="fname1" style="width:auto;">
		 </div>
		 </div>
</div>
		</div>
		<!--  </div>
		 </center>-->
		 
<!--<div class="container" style="border:1px solid black;">-->
<br>
 <div class="row" style="border:1px solid black; height:auto;">
	<div class="col-md-4"> 
		<div class="row">
				&nbsp;From Date:&nbsp;&nbsp;&nbsp;&nbsp;
  			<input type="text" name="fromdate" style="width:auto;">
    	</div>
    	<br>
    	<div class="row">
  			 &nbsp;Upto Date:&nbsp;&nbsp;&nbsp;&nbsp;
  			 <input type="text" name="uptodate" style="width:auto; height:auto;">
		</div>
		<br>
		<div class="row">
		&nbsp;Request Type:
              <%
			try {
				Class.forName("org.postgresql.Driver").newInstance();
				Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB","postgres","admin");
				String query_dropdown = "select * from veh_request";
				Statement std = conn.createStatement();
				ResultSet rsd = std.executeQuery(query_dropdown);
			%>
				<select name="Request_Type" id="request_type" value="">
				<option><%--select --%>
		        <%  while(rsd.next()){ %>
					<option><%=rsd.getString(17)%></option>
				<%
				}
				%>
				</select>
			<%
				conn.close();
        		}
        	catch(Exception e)
        	{
             	out.println("wrong entry"+e);
        	}
			%>
         </div>
          </div>
          <div class="col-md-4">
          <div class="row">
         Reporting Time:<select name="report_hr">
		<option value="HH">HH</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		</select>
		<select name="report_min">&nbsp&nbsp&nbsp&nbsp
		<option value="MM">MM</option>
		<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option>
		<option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
		<option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option>
		<option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>
		</select>
		</div>
		<br>
		<div class="row">
		Upto:<select name="upto_hr">
		<option value="HH">HH</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		</select>

		<select name="upto_min">&nbsp&nbsp&nbsp&nbsp
		<option value="MM">MM</option>
		<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option>
		<option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
		<option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option>
		<option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>
		</select>
		</div>
		<br>
		<div class="row">
		Duration:<select name="duration_hr">
		<option value="HH">HH</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		</select>
		<select name="duration_min">&nbsp&nbsp&nbsp&nbsp
		<option value="MM">MM</option>
		<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option>
		<option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
		<option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option>
		<option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>
		</select>
		</div>
		</div>

	<div class="col-md-4"> 
	<div class="row"> Reporting place:<input type="text" name="reportplace" style="width:auto;"></div><br>
<div class="row">Line Item code:<input type="text" name="lineitem" style="width:auto;"></div><br>
<div class="row">Amt.Available:<input type="text" name="amtavailable" style="width:auto;" ></div>
	</div>
</div>
<br>
<!--<div class="custom-div-block">
<div class="col-md-10 col-md-offset-1" >
<form method="post" action="VehRequest">--> <br/>
<div class="row">
		<div class="col-md-1">
		<div class="row"><br><br></div>
		<div class="row">
		Indenter:
		</div>
		<br>
		<div class="row">
		Approver:
		</div>
		</div>
		<div class="col-md-11">
		<table class="table table-stripped" id="dbtable">
			<tr>
				<th>ECNo</th>
				<th>NAME</th>
				<th>Group/Divn.</th>
				<th>MOBILE NO.</th>
			</tr>
			<%
try {
Class.forName("org.postgresql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
String query = "select * from veh_request order by indenter_ecno ";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
System.out.println("table");
while(rs.next()){
%>
<tr>
<%int idsno=rs.getInt("indenter_ecno");%>
<td><%=idsno %></td>
<td><%=rs.getString("user_name")%></td>
<td><%=rs.getString("user_orgn")%></td>
<td><%=rs.getString("user_mobile_no")%></td>
</tr>
<%
}
}

catch(Exception e){System.out.println(e.getMessage());}
%>
</table>

</div>
</div>
<!--</div>-->
<div class="row">

<% 
int count=0;
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select count(distinct veh_type)from vehicle_types_mst";
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(query);
					if(rs.next())
					{
						count=rs.getInt(1);
						System.out.println(count);
					}
				}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
	%>
<br>
<div class="col-md-3" style="border:1px solid black;">
<div class="row">

&nbsp;total no.of vehicles:<input type="text" id="vehcount" style="width:200px;">
</div>
<br>
<div class="row">
<!--  <div class="custom-div-block">
<div class="col-md-6 col-md-offset-1" >
<div class="dbtab">-->
		<table class="table table-stripped table-responsive"  id="dbtable">
			<tr>
				<th>Vehicle Type</th>
				<th>Qty</th>
				
			</tr>
			<% 
				try {
					Class.forName("org.postgresql.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
							"admin");
					String query = "select veh_type from vehicle_types_mst";
					Statement st = conn.createStatement();
					System.out.println(count);
			
			%>
			<%while(count!=0){
			%>
			<tr><td>
			<select name="veh_type" value="">
				<option><%--select --%>
		        <% ResultSet rs = st.executeQuery(query);
		        while(rs.next()){ %>
					<option><%=rs.getString("veh_type")%></option>
				<%
				}
				%>
				</select></td>
				<td>
				<input type="number" name="qty" style="width:50px;">
				</td>
				</tr><%
				count--;
			}
				 %>
				
			<% 
				conn.close();
					
				} catch (Exception e) 
                 {
					System.out.println(e.getMessage());
				}
			%>
		</table>
</div>
</div>
<!--  </div>
<div>
</div>-->
<div class="col-md-1">
</div>
<div class="col-md-8" style="border:1px solid black;" >
<div class="row">
No. of Users:&nbsp;&nbsp;&nbsp;<input type="text" id="userno" style="width:auto;"><br><br>
</div>

<!--  <div class="custom-div-block">
<div class="col-md-10 col-md-offset-1" >-->
<div class="row">
	<table class="table table-stripped table-responsive" id="dbtable">
			<tr>
				<th>ECNo</th>
				<th>NAME</th>
				<th>Group/Divn.</th>
				<th>MOBILE NO.</th>
			</tr>
			<%
try {
Class.forName("org.postgresql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
String query = "select * from veh_request order by indenter_ecno ";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
System.out.println("table");
while(rs.next()){
%>
<tr>
<%int idsno=rs.getInt("indenter_ecno");%>
<td><%=idsno %></td>
<td><%=rs.getString("user_name")%></td>
<td><%=rs.getString("user_orgn")%></td>
<td><%=rs.getString("user_mobile_no")%></td>
</tr>
<%
}
}

catch(Exception e){System.out.println(e.getMessage());}
%>
</table>
</div>
</div>
</div>

   <div class="row">
	<center>
         <input type="submit" name="Create" value="Create">
	</center>
  </div>	
</form>	
</div> 
</body>
</html>
