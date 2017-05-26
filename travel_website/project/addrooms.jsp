<%@ page import="java.util.List" 
	import="com.mongodb.BasicDBObject"
	import="com.mongodb.DB"
	import="com.mongodb.DBCollection"
	import="com.mongodb.DBCursor"
	import="com.mongodb.MongoClient"
	import="com.mongodb.MongoException"
%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hotel Reservation</title>    
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

<div id="container">

<jsp:include page="adminheader.jsp" />

<div id="body">

            <section id="review-content">

                <article>
				<%
					DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
					DBCollection hotels = db.getCollection("Hotel");
					DBCursor cursor = hotels.find();
				%>
                   

                     <form method="post"  action="addroom">

					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Add Rooms</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "2" align="left"> <b>Hotel Room</b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row">Hotel<span style="color:red">*</span> :</td>
                                 <td>
									<select name="hotel" style="width:252px; height:25px">
										<option value="" selected>-----Please Select-----</option>
										<% while(cursor.hasNext()){
											BasicDBObject obj = (BasicDBObject) cursor.next();	%>  
											<option value="<%=obj.getString("hotelId")%>-<%=obj.getString("hotelName")%>"><%=obj.getString("hotelName") %></option>
										<%}%>
										
									</select>
								</td>
							</tr>
							
							<tr>
								<td class="left-row">Room Title<span style="color:red">*</span> : </td>
                                <td><input type="text" name="roomTitle" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
						    </tr>
							<tr>
								<td class="left-row">Bed Type<span style="color:red">*</span> : </td>
                                <td><input type="text" name="bedType" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Beds<span style="color:red">*</span> : </td>
                                <td><input type="number" name="beds" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Adults<span style="color:red">*</span> : </td>
                                <td><input type="number" name="adults" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Children<span style="color:red">*</span> : </td>
                                <td><input type="number" name="children" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Price<span style="color:red">*</span> : </td>
                                <td><input type="number" name="price" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">No. of Rooms<span style="color:red">*</span> : </td>
                                <td><input type="number" name="numOfRooms" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row"> Image Url<span style="color:red">*</span> : </td>
                                <td><input type="text" name="imageurl" value = "" class="login-input" style="width:250px; height:25px" required/> </td>
								
						    </tr>
							
							<tr>
								<td class="left-row" >Description<span style="color:red">*</span> : </td>
								<td><textarea name="description" rows="7" cols="55" style="resize: none;" required></textarea>
								</td>
								
							</tr>
							
                            <tr>
                                <td colspan = "2"><button class="sign-in-up-button" type="submit">Add</button> </td>
                                
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
