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

<section id="sign-in-up">
 
 <section id="sign-in"> 
 <h2>Sign In</h2>
 <% if(request.getParameter("error")!=null){ %>
 <div class="login-error">
 Invalid User ID or Password. Please re-enter correct User ID and Password.
 </div>
 <%}%>
 <form action="login" method="post">
 <div class="signin-input-fields">
 <label>User ID<span style="color:red">*</span>:</label>
 <input type="text" name="userID" value="" class="login-input" style="width:250px; height:25px" required/>
 </div>
 <div class="signin-input-fields">
 <label>Password<span style="color:red">*</span>:</label>
 <input type="password" name="password" value="" style="width:250px; height:25px" required/>
 </div>
 <div>
 <button type="submit" class="sign-in-up-button">Sign In</button>
 </div>
 </form>
 </section> 
 
 <section id="sign-up">
 <br/>
 <h2>Don't have an Account?</h2>
 <button onclick="location.href='signup.jsp'" class="sign-in-up-button">Sign Up</button>
 </section> 
</section>


<div class="clear"></div>		
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
