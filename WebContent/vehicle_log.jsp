<!DOCTYPE html>
<html lang="en">
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="vehlogcustomstyles.css" rel="stylesheet" />
	
	<meta charset="utf-8">
	<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>

<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}
div.dbtab{
height:140px;
overflow:auto;
}
tr:nth-child(even) {background-color: #3498DB;}
tr:nth-child(odd) {background-color: #85C1E9;}
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
function validateFormlog() {
   var x = document.forms["vehlogform"]["Opg.km"].value;
    if (x == ""||isNaN(x)) {
        alert("enter the opening km val");
 
        return false;
    }
    var x = document.forms["vehlogform"]["Clg.km"].value;
    if (x == ""||isNaN(x)) {
        alert("enter the closing km val");
 
        return false;
    }
    var x = document.forms["vehlogform"]["Claimkm"].value;
    if (x == ""||isNaN(x)) {
        alert("enter the claim km val");
 
        return false;
    }
    var e = document.getElementById("O.hour");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="HH") {
        alert("Please select a opening hour val");
        return false;
    }
    var e = document.getElementById("O.minute");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="MM") {
        alert("Please select a opening minute val");
        return false;
    }
    var e = document.getElementById("C.hour");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="HH") {
        alert("Please select a closing hour val");
        return false;
    }
    var e = document.getElementById("C.minute");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="MM") {
        alert("Please select a Closing minute val");
        return false;
    }
    var e = document.getElementById("D.hour");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="HH") {
        alert("Please select Duration time Hour val");
        return false;
    }
    var e = document.getElementById("D.minute");
    var optionSelIndex = e.options[e.selectedIndex].value;
    var optionSelectedText = e.options[e.selectedIndex].text;
    if (optionSelIndex =="MM") {
        alert("Please select Duration time Minute val");
        return false;
    } 
    
}
    </script>
	
    <script>
function actual() {
    var result=0;
       var Opg_km = document.getElementById('Opg.km').value;
       var Clg_km = document.getElementById('Clg.km').value;
    if ( Opg_km!="" && Clg_km ==""){
        result = parseInt(Opg_km);
    }else if( Opg_km== "" && Clg_km != ""){
        result= parseInt(Clg_km);
    }else if (Clg_km!= "" && Opg_km != ""){
        result = parseInt(Clg_km) - parseInt(Opg_km);
    }
       if (!isNaN(result)) {
           document.getElementById('Actualkm').value = result;
       }
   }
</script>
   <script>
function less() {
    var result=0;
       var Actual_km = document.getElementById('Actualkm').value;
       var Claim_km = document.getElementById('Claimkm').value;
    if ( Actual_km!="" && Claim_km ==""){
        result = parseInt(Actual_km);
    }else if( Actual_km== "" && Claim_km != ""){
        result= parseInt(Clg_km);
    }else if (Claim_km!= "" && Actual_km != ""){
        result = parseInt(Claim_km) - parseInt(Actual_km);
    }
       if (!isNaN(result)) {
           document.getElementById('Lesskm').value = result;
       }
   }
</script>
<script>
function compute(){
	var result;
	var Actual_km=document.getElementById('Actualkm').value;
	result=parseInt(Actual_km)*5;
	if(!isNaN(result)){
		document.getElementById('Bill').value=result;
		var button=document.getElementById('Button');
		button.disabled=true;
		document.getElementById('submit').disabled=false;

	}
}
</script>
<script>
function timediff(){

var ohh=form1.elements['ohour'].value;
var omm=form1.elements['ominute'].value;
var chh=form1.elements['chour'].value;
var cmm=form1.elements['cminute'].value;


var hh,mm;
hh=chh-ohh;
mm=cmm-omm;
if(mm<0)
	{
	hh=hh-1;
	mm=mm+60;
	}
	document.getElementById('Dhour').value=hh;
	document.getElementById('Dminute').value=mm;
}
</script>
 
<style>
.center {
    margin: 20px 20px 20px 20px;
    width: 80%;
        border: 2px solid black;
	padding: 8px 8px 8px 8px ;
        float:center;
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
			<button class="btn btn-primary btn-md">&nbsp;&nbsp;Logout&nbsp;&nbsp;</button>
		</div>
	</div>
	

		<div class="row">
            	<div class="col-xs-12">
		<div class="dropdown">
                   <button class="dropbtn">Vehicle</button>
                               <div class="dropdown-content">
					
                                         <a href="#">service provider</a>
					
					 <a href="Add_Vehicle.php">add vehicle</a>
						
					 <a href="#">daily log</a>
					
                                         <a href="#">routes</a>
					
   					 <a href="#">tarrif slabs</a>
 				 </div>
                    </div>
    		<div class="dropdown">
		   <button class="dropbtn">Operations</button>
					
                               <div class="dropdown-content">
                                         <a href="#">vehicle request</a>
				         <hr>
					 <a href="#">approval</a>
						<hr>
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
<div class="row">
<center><h3><b>Vehicle Log</b></h3></center></div>
<form name="vehlogform" onsubmit="return validateFormlog()" id="form1" action="log" method="POST">
<div class="container">
<div class="col-xs-4" style="float:right;">Log Date:<input type="date" name="Log.Date" style="border:1px solid black;height:30px;"></div>
</div>
</div>
<div class="container">
<div class="row">
	<div class="col-xs-5">
	<div class="center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="Veh.ID">
  <option value="12">12</option>
  <option value="24">24</option>
  <option value="34">34</option>
  <option value="43">43</option>
</select><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Opg.km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Opg.km" id="Opg.km" onkeyup="actual();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clg.km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Clg.km" id="Clg.km" onkeyup="actual();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;claim km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Claim.km" id="Claimkm" onkeyup="less();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Less km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Less.km" id="Lesskm"  style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actual km:&nbsp;&nbsp;&nbsp;<input type="text" name="Actual.km" id="Actualkm" onkeyup="less();" style="border:1px solid black;height:10px;">
	</div>
	</div>
<div class="col-xs-5">
<div class="center">
Vehicle Reg No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name=Vehicle Reg No style="border:1px solid black;height:10px;"><br><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Opg.Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="ohour" name="O.hour" onchange="timediff();">
		<option value="HH">HH</option>
		<script type="text/javascript">
   for(var i=1;i<=24;i++)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   </script>
        
</select>
<select name="O.minute" id="ominute" onchange="timediff();">&nbsp;&nbsp;&nbsp;&nbsp;
	<option value="MM">MM</option>
	<script type="text/javascript">
   for(var i=1;i<=60;i++)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   
   
   
   </script>		
</select>


</div><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Clg.Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="C.hour" id="chour" onchange="timediff();">
	  	<option value="HH">HH</option>
		<script type="text/javascript">
   for(var i=1;i<=24;i++)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   </script>
</select>
<select name="C.minute" id="cminute" onchange="timediff();">
		<option value="MM">MM</option>
		<script type="text/javascript">
   for(var i=1;i<=60;i++)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   </script>
		
</select>

</div><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Duration:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="Dhour" name="D.hour" style="border:1px solid black;height:10px;">
&nbsp;&nbsp;<input type="text" id="Dminute" name="D.minute" style="border:1px solid black;height:10px;">

</div><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;LessTime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="hour">
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
<select name="minute">
		<option value="MM">MM</option>
<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option>
<option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
<option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option>
<option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option>
		</select><br>
</div><br>
&nbsp;Actual Duration:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Actual Duration" style="border:1px solid black;height:10px;">

<br></div>
</div><br>
<div class="col-xs-2">
<br>
<br>
<br>
<button  class="btn btn-primary" style="btn-xs ;"type="button" id="Button" onclick=" return compute()">Compute Bill Amount</button> <br><br>
Day Bill Amount<input type="text" name="Day Bill Amount" id="Bill" style="border:1px solid black;height:10px;">
</div>
</div>
</div>
<center><input type="submit" id="submit" name="submit" value="Add" disabled></center><br>
</form>	
<!--  <div class="col-md-10 col-md-offset-1" >-->
<form method="post" action="Updatevehlog">
<div class="dbtab">
<table>
<tr><th>sno</th><th>VehId</th><th>RegNo</th><th>OpgKm</th><th>ClgKm</th><th>ClaimKm</th><th>LessKm</th><th>ActualKm</th><th>OpgTime</th><th>ClgTime</th><th>Duration</th><th>LessTime</th><th>ActualHrs</th><th>Update</th></tr>
<%
try {
Class.forName("org.postgresql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB?user=postgres&password=admin");
String query = "select * from Veh_Log_Book";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<%int idsno=rs.getInt("log_sno");%>
<td><%=idsno %></td>
<td><%=rs.getInt("veh_id")%></td>
<td></td>
<td><%=rs.getInt("opg_km")%></td>
<td><%=rs.getInt("clg_km")%></td>
<td><%=rs.getInt("claim_km")%></td>
<td><%=rs.getInt("less_km")%></td>
<td><%=rs.getInt("actual_km")%></td>
<td><%=rs.getTime("opg_time")%></td>
<td><%=rs.getTime("clg_time")%></td>
<td><%=rs.getTime("duration")%></td>
<td></td>
<td></td>


<td><button type="submit" name="submit" value=<%=idsno%>><u>Update</u></button></td>
</tr>
<%
}
}
catch(Exception e){
System.out.println("Exception"+e.getMessage());}
%>
</table></div>
</form>
<!--  </div>-->
<br><br>
</body>
</html>