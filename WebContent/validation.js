/*function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
        {
      return true;
        }
      else
        {
        alert("message");
        return false;
        }
}

function ValidateEmail(mail) 
{
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myForm.emailAddr.value))
  {
    return (true)
  }
    alert("You have entered an invalid email address!")
    return (false)
}

function checkForm(form)
  {
    // regular expression to match required date format
    re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;

    if(form.startdate.value != '' && !form.startdate.value.match(re)) {
      alert("Invalid date format: " + form.startdate.value);
      form.startdate.focus();
      return false;
    }

    // regular expression to match required time format
    re = /^\d{1,2}:\d{2}([ap]m)?$/;

    if(form.starttime.value != '' && !form.starttime.value.match(re)) {
      alert("Invalid time format: " + form.starttime.value);
      form.starttime.focus();
      return false;
    }

    alert("All input fields have been validated!");
    return true;
  }*/
function validateForm() {
		var pat2=/^[6-9][0-9]{9}$/
		
		var mail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
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
	    var cno=x.match(pat2);
	     if (x == ""||cno==null) {
	        alert("check the contact no");
	 
	        return false;
	    }
	    
	    var x = document.forms["service1"]["service_email"].value;
	    var mail1=x.match(mail);
	    if (x == ""|mail1==null) {
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