<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="vehlogcustomstyles.css" rel="stylesheet" />
	<style>
.center {
    margin: 20px 20px 20px 20px;
    width: 80%;
        border: 2px solid black;
	padding: 8px 8px 8px 8px ;
        float:center;
}
</style>
	
	
  <script>
function actual() {
    var result=0;
       var Opg_km = document.getElementById('id1').value;
       var Clg_km = document.getElementById('id2').value;
    if ( Opg_km!="" && Clg_km ==""){
        result = parseInt(Opg_km);
    }else if( Opg_km== "" && Clg_km != ""){
        result= parseInt(Clg_km);
    }else if (Clg_km!= "" && Opg_km != ""){
        result = parseInt(Clg_km) - parseInt(Opg_km);
    }
       if (!isNaN(result)) {
           document.getElementById('id5').value = result;
       }
   }
</script>
  <script>
function less() {
    var result=0;
       var Actual_km = document.getElementById('id5').value;
       var Claim_km = document.getElementById('id3').value;
    if ( Actual_km!="" && Claim_km ==""){
        result = parseInt(Actual_km);
    }else if( Actual_km== "" && Claim_km != ""){
        result= parseInt(Clg_km);
    }else if (Claim_km!= "" && Actual_km != ""){
        result = parseInt(Claim_km) - parseInt(Actual_km);
    }
       if (!isNaN(result)) {
           document.getElementById('id4').value = result;
       }
   }
</script>
<script>
function compute(){
	var result;
	var Actual_km=document.getElementById('id5').value;
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

var ohh=form1.elements['id8'].value;
var omm=form1.elements['id9'].value;
var chh=form1.elements['id10'].value;
var cmm=form1.elements['id11'].value;


var hh,mm;
hh=chh-ohh;
mm=cmm-omm;
if(mm<0)
	{
	hh=hh-1;
	mm=mm+60;
	}
	document.getElementById('id12').value=hh;
	document.getElementById('id13').value=mm;
}
</script>
 

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
			<button class="btn"><a href="login_page.php">Logout</a></button>
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

<%String num=String.valueOf(request.getAttribute("log.sno")); %>
<%int id=Integer.parseInt(num);%>
<%String num1=String.valueOf(request.getAttribute("opg.km")); %>
<%int id1=Integer.parseInt(num1);%>
<%String num2=String.valueOf(request.getAttribute("clg.km")); %>
<%int id2=Integer.parseInt(num2);%>
<%String num3=String.valueOf(request.getAttribute("claim.km")); %>
<%int id3=Integer.parseInt(num3);%>
<%String num4=String.valueOf(request.getAttribute("less.km")); %>
<%int id4=Integer.parseInt(num4);%>
<%String num5=String.valueOf(request.getAttribute("actual.km")); %>
<%int id5=Integer.parseInt(num5);%>
<%String num6=String.valueOf(request.getAttribute("Veh.id")); %>
<%int id6=Integer.parseInt(num6);%>
<%String num7=String.valueOf(request.getAttribute("LogDate")); %>
<%String num8=String.valueOf(request.getAttribute("ohour")); %>
<%String num9=String.valueOf(request.getAttribute("ominute")); %>
<%int id8=Integer.parseInt(num8); %>
<%int id9=Integer.parseInt(num9); %>
<%String num10=String.valueOf(request.getAttribute("chour")); %>
<%String num11=String.valueOf(request.getAttribute("cminute")); %>
<%int id10=Integer.parseInt(num10); %>
<%int id11=Integer.parseInt(num11); %>
<%String num12=String.valueOf(request.getAttribute("dhour")); %>
<%String num13=String.valueOf(request.getAttribute("dminute")); %>
<%int id12=Integer.parseInt(num12); %>
<%int id13=Integer.parseInt(num13); %>


<form name="insert" action="updatequeryvehlog" method="POST" >
<div class="container">
<div class="col-xs-4" style="float:right;">Log Date:<input type="date" name="Log.Date" id="num7" value=<%=num7 %> style="border:1px solid black;height:30px;"></div>
</div>
</div>
<div class="container">
<div class="row">
	<div class="col-xs-5">
	<div class="center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="Veh.ID" id="id6" value=<%=id6 %>>
  <option value="12">12</option>
  <option value="24">24</option>
  <option value="34">34</option>
  <option value="43">43</option>
</select><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Opg.km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%=id1 %> name="Opg.km" id="id1" onkeyup="actual();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clg.km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%=id2 %> name="Clg.km" id="id2" onkeyup="actual();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;claim km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Claim.km" value=<%=id3 %> id="id3" onkeyup="less();" style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Less km:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Less.km" value=<%=id4 %> id="id4"  style="border:1px solid black;height:10px;"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actual km:&nbsp;&nbsp;&nbsp;<input type="text" name="Actual.km" id="id5" value=<%=id5 %> onkeyup="less();" style="border:1px solid black;height:10px;">
	
	</div>
	</div>
	
<div class="col-xs-5">
<div class="center">
Vehicle Reg No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name=Vehicle Reg No style="border:1px solid black;height:10px;"><br><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Opg.Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select  name="O.hour" id="id8" onchange="timediff();">
		<option value="<%=id8 %>"><%=id8 %> </option>
		<option value="HH">HH</option>
		<script type="text/javascript">
		var x=<%=id8%>;
   for(var i=1;i<=24;i++)
       {if(i!=x)
	   document.write("<option value='"+i+"'>" + i+"</option> ");
       }
   </script>
        
</select>
<select name="O.minute" id="id9" onchange="timediff();">&nbsp;&nbsp;&nbsp;&nbsp;
	<option value="<%=id9 %>"><%=id9 %> </option>
	<option value="MM">MM</option>
	<script type="text/javascript">
	var x=<%=id9%>;
   for(var i=1;i<=60;i++)
	   {
	   if(i!=x)
    document.write("<option value='"+i+"'>" + i+"</option> ");
	   }
   </script>		
</select>


</div><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Clg.Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="C.hour" id="id10" onchange="timediff();">
	  	<option value="<%=id10 %>"><%=id10 %> </option>
	  	<option value="HH">HH</option>
		<script type="text/javascript">
		var x=<%=id10 %>;
   for(var i=1;i<=24;i++){
	   if(i!=x)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   }
   </script>
</select>
<select name="C.minute" id="id11" onchange="timediff();">
		<option value="<%=id11 %>"><%=id11 %> </option>
		<option value="MM">MM</option>
		<script type="text/javascript">
		var x=<%=id11 %>;
   for(var i=1;i<=60;i++){
	   if(i!=x)
    document.write("<option value='"+i+"'>" + i+"</option> ");
   }
   </script>
		
</select>

</div><br>
<div class="row">
&nbsp;&nbsp;&nbsp;&nbsp;Duration:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value=<%=id12 %> id="id12" name="D.hour" style="border:1px solid black;height:10px;">
&nbsp;&nbsp;<input type="text" value=<%=id13 %> id="id13" name="D.minute" style="border:1px solid black;height:10px;">

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
<input type="text" style="visibility:hidden" name="sno" value=<%=id %>>
<center><input type="submit" id="submit" name="submit" value="Add" disabled></center><br>
</form>
</body>
</html>