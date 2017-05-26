
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

                   

                     <form method="post"  action="bookhotel">
						<input type="hidden" value="<%=request.getParameter("hotelId")%>" name="hotelId" />
						<input type="hidden" value="<%=request.getParameter("hotelName")%>" name="hotelName" />
						<input type="hidden" value="<%=request.getParameter("roomType")%>" name="roomType" />
					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Book a Hotel</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "5" align="left"> <b>Booking  Information</b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row">Hotel Name<span style="color:red">*</span> : </td>
                                <td><input type="text" name="hotelNames" value = "<%=request.getParameter("hotelName")%>" class="login-input" style="width:250px; height:25px" placeholder="mm/dd/yyyy" disabled="true"/> </td>
								<td> </td>
								<td class="left-row">Room Type<span style="color:red">*</span> : </td>
                                <td><input type="text" name="roomTypes" value = "<%=request.getParameter("roomType")%>" class="login-input" style="width:250px; height:25px" placeholder="mm/dd/yyyy" disabled="true"/> </td>
								
								
							<tr>
								<td class="left-row">Check In Date<span style="color:red">*</span> : </td>
                                <td><input type="text" name="checkIn" value = "" class="login-input" style="width:250px; height:25px" placeholder="mm/dd/yyyy" required/> </td>
								<td> </td>
								<td class="left-row">Check Out Date<span style="color:red">*</span> : </td>
                                <td><input type="text" name="checkOut" value = "" class="login-input" style="width:250px; height:25px" placeholder="mm/dd/yyyy" required/> </td>
								
								
                            </tr>
							
							
							<tr>
								<td class="left-row">Rooms<span style="color:red">*</span> : </td>
                                <td><input type="number" name="rooms" value = "" min="0" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
							
							<tr>
								<td class="left-row">Adults<span style="color:red">*</span> : </td>
                                <td><input type="number" name="adults" value = "" min="0" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
							
							<tr>
								<td class="left-row">Children<span style="color:red">*</span> : </td>
                                <td><input type="number" name="children" value = "" min="0" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
							
							<tr>
								<td class="left-row" >Special Note : </td>
								<td colspan = "4"><textarea name="specialNote"  rows="7" cols="55" style="resize: none;" ></textarea>
								</td>
								
							</tr>
							
                            <tr>
                                <td colspan = "5"><button class="sign-in-up-button" type="submit">Add</button> </td>
                                
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
