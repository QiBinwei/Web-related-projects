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
					BasicDBObject searchQuery = new BasicDBObject();
					searchQuery.put("hotelId",request.getParameter("id"));
						
					DBCursor cursor = hotels.find(searchQuery);
					
					
				%>
                   

                     <form method="post"  action="addhotel?req=update">

					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Add New Hotel</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "5" align="left"> <b>Hotel  Information</b> </th>
						    </tr>                     
							<%if(cursor.hasNext()){
								BasicDBObject obj = (BasicDBObject) cursor.next(); %>
							<tr>
								<td class="left-row">Hotel ID<span style="color:red">*</span> : </td>
									
                                <td><input type="text" name="hotelId" value ="<%= obj.getString("hotelId")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">Hotel Name<span style="color:red">*</span> : </td>
                                <td><input type="text" name="hotelName" value = "<%= obj.getString("hotelName")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
								
                            </tr>
							
							
							<tr>
								<td class="left-row"> Street<span style="color:red">*</span> : </td>
                                <td><input type="text" name="street" value = "<%= obj.getString("street")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row"> City<span style="color:red">*</span> : </td>
                                <td><input type="text" name="city" value = "<%= obj.getString("city")%>" class="login-input" style="width:250px; height:25px" required/> </td>
                            </tr>
							
							<tr>
								<td class="left-row"> State<span style="color:red">*</span> : </td>
                                <td><input type="text" name="state" value = "<%= obj.getString("state")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row"> Zip<span style="color:red">*</span> : </td>
                                <td><input type="text" name="zip" value = "<%= obj.getString("zip")%>" class="login-input" style="width:250px; height:25px" required/> </td>
                            </tr>

							<tr>
								<td class="left-row">Phone<span style="color:red">*</span> : </td>
                                <td><input type="text" name="phone" value = "<%= obj.getString("phone")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								<td> </td>
								<td class="left-row">Email<span style="color:red">*</span> : </td>
                                <td><input type="text" name="email" value = "<%= obj.getString("email")%>" class="login-input" style="width:250px; height:25px" required/> </td>
                            </tr>
							
							<tr>
								<td class="left-row"> Image Url<span style="color:red">*</span> : </td>
                                <td><input type="text" name="imageurl" value = "<%= obj.getString("imageurl")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								<td colspan="3"> </td>
						    </tr>
							
                            <tr>
								<td class="left-row" > Description<span style="color:red">*</span> : </td>
								<td colspan="4"><textarea name="description" rows="7" cols="55" style="resize: none;" required><%= obj.getString("description")%></textarea>
								</td>
								
							</tr>
							
                            <tr>
                                <td colspan = "5"><button class="sign-in-up-button" type="submit">Update</button> </td>
                                
                            </tr>
				
                        </table>
								<%}%>
								
                   </form>

                </article>

            </section>

        </div>
        

        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
