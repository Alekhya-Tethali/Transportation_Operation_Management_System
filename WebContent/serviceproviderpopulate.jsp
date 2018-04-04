<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>service provider</title>

    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="customstylesservice.css" rel="stylesheet" />
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
<script>
function validateForm() {
   var x = document.forms["service1"]["spname"].value;
    if (x == "") {
        alert("Service provider name must be filled out");
 
        return false;
    }
    
    x = document.forms["service1"]["orderno"].value;
    if (x == ""||isNaN(x)) {
        alert("check the order no");
 
        return false;
    }
    
    x = document.forms["service1"]["vdate"].value;
    if (x == "") {
        alert(" 'valid date from' must be filled out");
 
        return false;
    }
    
    
    x = document.forms["service1"]["vudate"].value;
    if (x == "") {
        alert(" 'valid date upto' must be filled out");
 
        return false;
    }
    
    
    x = document.forms["service1"]["spaddress"].value;
    if (x == ""||x.length<=20) {
        alert("check the address");
 
        return false;
    }
    x = document.forms["service1"]["spcontact_person"].value;
    if (x == "" || !isNaN(x)) {
        alert(" check the contact person ");
 
        return false;
    }
     x = document.forms["service1"]["usrtel"].value;
    if (x == ""||x.length!=10) {
        alert("check the contact no");
 
        return false;
    }
    
    var x = document.forms["service1"]["service_email"].value;
    if (x == "") {
        alert("email must be filled");
 
        return false;
    }
    
    var e = document.getElementById("modes");
            var optionSelIndex = e.options[e.selectedIndex].value;
            var optionSelectedText = e.options[e.selectedIndex].text;
            if (optionSelIndex == 0) {
                alert("Please select a hiring mode");
                return false;
            }
      var e = document.getElementById("cars");
            var optionSelIndex = e.options[e.selectedIndex].value;
            var optionSelectedText = e.options[e.selectedIndex].text;
            if (optionSelIndex == 0) {
                alert("Please select vehicle type");
                return false;
            }
       var e = document.getElementById("cars1");
            var optionSelIndex = e.options[e.selectedIndex].value;
            var optionSelectedText = e.options[e.selectedIndex].text;
            if (optionSelIndex == 0) {
                alert("Please select no of vehicles");
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

<h3><center><b>Add Service Provider</b></center></h3>	

<%
		String sp_name = String.valueOf(request.getAttribute("sp_name"));
	%>
	<%
		String po_number = (String) request.getAttribute("po_number");
	%>
	<%
		String tel_no = (String) request.getAttribute("tel_no");
	%>
	<%
		String sp_sno_temp = String.valueOf(request.getAttribute("sp_sno"));
	%>
	<%
		int sp_sno = Integer.parseInt(sp_sno_temp);
	%>
	
<form action="UpdateQuerySP" method="POST">
	
	<div class="container">
	<div class="row">
		<div class="col-md-9">

		
  		<label for="spname">Service Provider Name: </label>
 		  <input type="text" name="sp_name" value=<%=sp_name %> style="border:1px solid black;width:280px;height:30px;">
		
		
	
	<label for="vdate">Valid from: </label>
  		<input type="date"  name="vdate" style="border:1px solid black;width:150px;" >
		
		</div>


		<div class="col-md-2">
                  <button class="btn btn-sm" style="border:1px solid black; width:125px;">Upload PO</button>
		</div>
</div>
<br>

<div class="row">
		<div class="col-md-9">	
  		<label for="orderno"> Purchase  order  no . :&nbsp;&nbsp;&nbsp;&nbsp; </label>
		<input type="text" name="po_number" value=<%=po_number %> style="border:1px solid black;width:280px;height:30px;">

	
 		
		 <label for="vudate">Valid upto: </label>
		<input type="date"  name="vudate" style="border:1px solid black;width:150px;" >
		
             
	
		</div>


		<div class="col-md-2">
                  <button class="btn btn-sm" style="border:1px solid black;">Upload owner photo</button>
		</div>

     </div>
<p><br/></p>
<div class="row">
		<div class="col-sm-3">

<div class="formstyle" id="info" >
 
  Hiring Mode       : &nbsp;&nbsp;&nbsp;<select id="modes">
    <option value="0">Select Type</option>
    <option value="1">personal</option>
    <option value="2">Friend</option>
    </select>
 
<br><br>

  Vehicle Type      :  &nbsp;&nbsp;<select id="cars">
    <option value="0">Select Type</option>
    <option value="1">personal</option>
    <option value="2">Friend</option>
  
  </select>
<br><br>

 No. of vehicles: <select id="cars1">
     <option value="0">Select Type</option>
    <option value="1">personal</option>
    <option value="2">Friend</option>
     </select>
  </div>
</div>
     
	<div class="col-sm-8">
	<div class="customdivblock">

<div class="formstyle" id="info" style="text-align:left;">
<br>

 &nbsp;&nbsp; Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="spaddress" style="border:1px solid black;width:400px; height:40px;"> 
<br><br>

  &nbsp;&nbsp;Contact person:&nbsp;&nbsp;&nbsp;
  <input type="text" name="spcontact_person" style="border:1px solid black;width:280px;height:30px;">
<br>
<br>
 &nbsp;&nbsp;Contact No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="tel_no" value=<%=tel_no %> style="border:1px solid black;width:280px;height:30px;">
<br>
<br>

  &nbsp;&nbsp;E-mail  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" name="service_email" style="border:1px solid black;width:280px;height:30px;"><br><br>
</div>
</div>
<br/>
</div>
	</div>
</div>
</div>

<input type="text" style="visibility: hidden" name="sp_sno" value=<%=sp_sno%>>
<div class="container">

	<div class="row">
	
     <center><input type="submit" name="Submit" value="Update"
			style="background-color: #3366cc; font-weight: bold; color: #ffffff;">	 </center>
 </div>
<br>
</div>	
</form>
</body>
</html>
    