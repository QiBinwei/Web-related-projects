<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hotel Reservation</title>    
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
<div id="container">

<jsp:include page="header.jsp" />

<section id="csign-in-up">
 
 <section id="sign-up">
 <br/>
 <h2>Already have an Account?</h2>
 <button onclick="location.href='login.jsp'" class="sign-in-up-button">Sign In</button>
 </section>

 
 <section id="sign-in"> 
 <h2>New Account</h2>
 <% if(request.getParameter("error")!=null){ %>
 <div class="login-error">
 User Id provided by you is already in use
 </div>
 <%}%>
 <form action="createAccount"  method="post">
 <div class="signin-input-fields">
 <label>First Name<span style="color:red">*</span> :</label>
 <input type="text" name="firstName" class="login-input" style="width:250px; height:25px" required/>
 </div>
 <div class="signin-input-fields">
 <label>Last Name<span style="color:red">*</span> :</label>
 <input type="text" name="lastName" class="login-input" style="width:250px; height:25px" required/>
 </div>
 <div class="signin-input-fields">
 <label>User ID<span style="color:red">*</span> :</label>
 <input type="text" name="userID" class="login-input" style="width:250px; height:25px" required/>
 </div>
 <div class="signin-input-fields">
 <label>Password<span style="color:red">*</span> :</label>
 <input type="password" name="password" id="password" value="" style="width:250px; height:25px" required/>
 </div> 
 
  <div class="signin-input-fields">
 <label>Confirm Password<span style="color:red">*</span> :</label>
 <input type="password" name="confirmpassword" id="confirmpassword" value="" style="width:250px; height:25px" required/>
 </div> 
 
 <div class="signin-input-fields">
 <label>Phone<span style="color:red">*</span> :</label>
 <input type="text" name="phone" class="login-input" style="width:250px; height:25px" maxlength="16" required/>
 </div>
 
  <div class="signin-input-fields">
 <label>Email Id<span style="color:red">*</span> :</label>
 <input type="text" name="emailId" class="login-input" style="width:250px; height:25px" required/>
 </div>
 
 
 <div>
 <button class="sign-in-up-button" type="submit">Continue Creating Account</button>
 </div>
 </form>
 </section> 
 
 </section>

<div class="clear"></div>	
        
<jsp:include page="footer.jsp" />

</div>

</body>

</html>
