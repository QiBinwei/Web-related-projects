<%@ page import="java.util.List" 
	import="java.util.ArrayList"
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
					
					DBCollection hotelRoom = db.getCollection("HotelRoom");
					BasicDBObject searchQuery = new BasicDBObject();
					List<BasicDBObject> param = new ArrayList<BasicDBObject>();
					param.add(new BasicDBObject("hotel",request.getParameter("id")));
					param.add(new BasicDBObject("roomTitle",request.getParameter("title")));
					searchQuery.put("$and",param );					
					DBCursor hotelRoomCursor = hotelRoom.find(searchQuery);
				%>
                   

                     <form method="post"  action="addroom?req=update">
                    <input type="hidden" value="<%=request.getParameter("id")%>" name="hotelID"/>
					<input type="hidden" value="<%=request.getParameter("title")%>" name="hotelRoomTitle"/>
					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Add Rooms</h1>
					</td>
					</tr>
					</table>
					<%if(hotelRoomCursor.hasNext()){
						BasicDBObject roomObj = (BasicDBObject) hotelRoomCursor.next();	%> 
					
                        <table class="form-table" width="90%">							
							
							<tr>
								<th colspan = "2" align="left"> <b>Hotel Room</b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row">Hotel<span style="color:red">*</span> :</td>
                                 <td>
									<select name="hotel" style="width:252px; height:25px">
										<option value="">-----Please Select-----</option>
										<% while(cursor.hasNext()){
											BasicDBObject obj = (BasicDBObject) cursor.next();	
											if(roomObj.getString("hotel").equals(obj.getString("hotelId")+"-"+obj.getString("hotelName"))){%> 
												<option value="<%=obj.getString("hotelId")%>-<%=obj.getString("hotelName")%>" selected><%=obj.getString("hotelName") %></option>
											<%}
											else {%>
												<option value="<%=obj.getString("hotelId")%>-<%=obj.getString("hotelName")%>"><%=obj.getString("hotelName") %></option>
										<%}}%>
									</select>
								</td>
							</tr>
							
							<tr>
								<td class="left-row">Room Title<span style="color:red">*</span> : </td>
                                <td><input type="text" name="roomTitle" value = "<%=roomObj.getString("roomTitle")%>" class="login-input" style="width:250px; height:25px" required/> </td>
						    </tr>
							<tr>
								<td class="left-row">Bed Type<span style="color:red">*</span> : </td>
                                <td><input type="text" name="bedType" value = "<%=roomObj.getString("bedType")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Beds<span style="color:red">*</span> : </td>
                                <td><input type="number" name="beds" value = "<%=roomObj.getString("beds")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Adults<span style="color:red">*</span> : </td>
                                <td><input type="number" name="adults" value = "<%=roomObj.getString("adults")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Children<span style="color:red">*</span> : </td>
                                <td><input type="number" name="children" value = "<%=roomObj.getString("children")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Price<span style="color:red">*</span> : </td>
                                <td><input type="text" name="price" value = "<%=roomObj.getString("price")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">No. of Rooms<span style="color:red">*</span> : </td>
                                <td><input type="number" name="numOfRooms" value = "<%=roomObj.getString("numOfRooms")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row"> Image Url<span style="color:red">*</span> : </td>
                                <td><input type="text" name="imageurl" value = "<%=roomObj.getString("imageurl")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
						    </tr>
							
							<tr>
								<td class="left-row" >Description<span style="color:red">*</span> : </td>
								<td><textarea name="description"  rows="7" cols="55" style="resize: none;" required><%=roomObj.getString("description")%></textarea>
								</td>
								
							</tr>
							
                            <tr>
                                <td colspan = "2"><button class="sign-in-up-button" type="submit">Update</button> </td>
                                
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
