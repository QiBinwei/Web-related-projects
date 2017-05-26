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

<section > 

 <form action="customerAddressAndCreditCard"  method="post">
 <input type="hidden" name="userId" value="<%= request.getAttribute("userId")%>"/>
 <table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">New Account</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=70%>							
							
							<tr>
								<th colspan = "2" align="left"> <b>Billing Address </b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row" width="30%" >Street 1<span style="color:red">*</span> :</td>
                                 <td>
									<input type="text" name="street1" class="login-input" style="width:250px; height:25px" required/>
								</td>
							</tr>
							
							<tr>
								<td class="left-row" width="30%">Street 2<span style="color:red">*</span> : </td>
                                <td><input type="text" name="street2" class="login-input" style="width:250px; height:25px" required/></td>
						    </tr>
							
							<tr>
								<td class="left-row" width="30%">City<span style="color:red">*</span> : </td>
                                <td> <input type="text" name="city" class="login-input" style="width:250px; height:25px" required/></td>
						    </tr>
							
							<tr>
								<td class="left-row" width="30%">State<span style="color:red">*</span> : </td>
                                <td> <input type="text" name="state" class="login-input" style="width:250px; height:25px" required/></td>
						    </tr>
							
							<tr>
								<td class="left-row" width="30%">Zip/Postal<span style="color:red">*</span> : </td>
                                <td><input type="text" name="zipcode" class="login-input" maxlength="5" style="width:250px; height:25px" required/></td>
						    </tr>

							<tr>
								<th colspan = "2" align="left"> <b>Credit Card</b> </th>
						    </tr>    
  

							<tr>
								<td class="left-row" width="30%">Name on card<span style="color:red">*</span> : </td>
                                <td><input type="text" name="nameOnCard" class="login-input" style="width:250px; height:25px" required/></td>
						    </tr>

							<tr>
								<td class="left-row" width="30%">Card Type<span style="color:red">*</span> : </td>
                                <td><select name="cardType" style="width:255px; height:35px" required> 
									<option value="">----- Please Select----</option> 
									<option value="VISA">VISA</option>
									<option value="MASTERCARD">MASTERCARD</option> 
									</select> </td>
						    </tr>
							
							<tr>
								<td class="left-row" width="30%">Credit Card Number<span style="color:red">*</span> : </td>
                                <td><input type="text" name="creditCardNum" class="login-input" maxlength="16" style="width:250px; height:25px" required/></td>
						    </tr>
							<tr>
								<td class="left-row" width="30%">Expiration Date<span style="color:red">*</span> : </td>
                                <td><input type="text" name="expmonth" placeholder="mm" class="login-input" style="width:50px; height:25px" required/> /  <input type="text" placeholder="yyyy" name="expyear" class="login-input" style="width:50px; height:25px" required/>
								</td>
						    </tr>
 
							<tr>
								<td class="left-row" width="30%">Cvv<span style="color:red">*</span> : </td>
                                <td><input type="text" name="cvvCode" class="login-input" maxlength="16" style="width:50px; height:25px" required/></td>
						    </tr>
 
							<tr>
                                <td colspan = "2"><button class="sign-in-up-button" type="submit">Create Account</button> </td>
                                
                            </tr>
 
						</table>
 </form> 
 </section>  

<div class="clear"></div>	

        
<jsp:include page="footer.jsp" />


</div>

</body>

</html>
