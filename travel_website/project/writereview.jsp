
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

<div id="body">

            <section id="review-content">

                <article>

                   

                     <form method="post"  action="writereview">
					<input type="hidden" name="hotelId" value="<%=request.getParameter("hotelId")%>"/>
					<input type="hidden" name="hotelName" value="<%=request.getParameter("hotelName")%>"/>
					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Write A Review</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "5" align="left"> <b>Hotel  Review</b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row">Hotel Name<span style="color:red">*</span> : </td>
                                <td><input type="text" name="hotelNamed" value = "<%=request.getParameter("hotelName")%>" class="login-input" style="width:250px; height:25px" disabled="true"/> </td>
								<td> </td>
								<td class="left-row">Room Type<span style="color:red">*</span> : </td>
                                <td><input type="text" name="roomType" value = "" class="login-input" style="width:250px; height:25px" required/> </td>								
								
                            </tr>
							
							<tr>
								<td class="left-row">City<span style="color:red">*</span> : </td>
                                <td><input type="text" name="city" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">State<span style="color:red">*</span> : </td>
                                <td><input type="text" name="state" value = "" class="login-input" style="width:250px; height:25px" required/> </td>							
                            </tr>
							
							<tr>
								<td class="left-row">Zip<span style="color:red">*</span> : </td>
                                <td><input type="text" name="zip" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">Price<span style="color:red">*</span> : </td>
                                <td><input type="text" name="price" value = "" class="login-input" style="width:250px; height:25px" required/> </td>							
                            </tr>
							
							<tr>
								<td class="left-row">Customer Name<span style="color:red">*</span> : </td>
                                <td><input type="text" name="custName" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">Customer City<span style="color:red">*</span> : </td>
                                <td><input type="text" name="custCity" value = "" class="login-input" style="width:250px; height:25px" required/> </td>								
								
                            </tr>
							
							<tr>
								<td class="left-row">Customer State<span style="color:red">*</span> : </td>
                                <td><input type="text" name="custState" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">Age<span style="color:red">*</span> : </td>
                                <td><input type="text" name="custAge" value = "" class="login-input" style="width:250px; height:25px" required/> </td>								
								
                            </tr>
							
							<tr>
								<td class="left-row">Gender<span style="color:red">*</span> : </td>
                                <td>
									<input type="radio" name="gender" value="Male"  style="width:25px;" checked>Male
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender"  style="width:25px;" value="Female">Female </td>
								<td> </td>
								<td class="left-row">Customer Occupation<span style="color:red">*</span> : </td>
                                <td><input type="text" name="custOccupation" value = "" class="login-input" style="width:250px; height:25px" required/> </td>								
								
                            </tr>
							
							<tr>
								<td class="left-row">Review Rating<span style="color:red">*</span> : </td>
                                <td><input type="number" min="1" max="5" name="reviewRating" value = "" class="login-input" style="width:250px; height:25px" placeholder="Max 5" required/> </td>
								<td> </td>
								<td class="left-row">Review Date<span style="color:red">*</span> : </td>
                                <td><input type="text" name="reviewDate" value = "" class="login-input" style="width:250px; height:25px" placeholder="mm/dd/yyyy" required/> </td>								
								
                            </tr>
							
							<tr>
								<td class="left-row">Review Summary<span style="color:red">*</span> : </td>
                                <td colspan="4"><input type="text" name="reviewSummary" value = "" class="login-input" style="width:550px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row" >Review Text<span style="color:red">*</span> : </td>
								<td colspan = "4"><textarea name="reviewText"  rows="7" cols="55" style="resize: none;" required></textarea>
								</td>
								
							</tr>
							
							
                            <tr>
                                <td colspan = "5"><button class="sign-in-up-button" type="submit">Submit Review</button> </td>
                                
                            </tr>
				
                        </table>
                   </form>

                </article>

            </section>

        </div>
        

        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
