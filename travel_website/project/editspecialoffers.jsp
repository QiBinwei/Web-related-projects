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
					
					DBCollection specialOffers= db.getCollection("SpecialOffers");
					BasicDBObject searchQuery = new BasicDBObject();
					searchQuery.put("offerId",request.getParameter("id"));			
					DBCursor specialOffersCursor = specialOffers.find(searchQuery);
				%>
                   

                     <form method="post"  action="addspecialoffers?req=update">
                    <input type="hidden" value="<%=request.getParameter("id")%>" name="hotelID"/>
					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Update Special Offers</h1>
					</td>
					</tr>
					</table>
					<%if(specialOffersCursor.hasNext()){
						BasicDBObject offerObj = (BasicDBObject) specialOffersCursor.next();%> 
					
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "2" align="left"> <b>Hotel Special Offers</b> </th>
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
								<td class="left-row">Offer Id<span style="color:red">*</span> : </td>
                                <td><input type="text" name="offerId" value="<%=offerObj.getString("offerId")%>" class="login-input" style="width:250px; height:25px" required/> </td>
						    </tr>
							
							<tr>
								<td class="left-row"> discount for <span style="color:red">*</span> : </td>
                                <td><select type="number" name="discountOn" value="" class="login-input" style="width:250px; height:25px" required/>
								<option value="">-----PLEASE SELECT------</option>
								<option value="night">multiple days</option>
								<option value="room">multiple rooms</option>
								</select></td>	
                            </tr>
						
							<tr>
								<td class="left-row">Minimum No. of Rooms/Nights<span style="color:red">*</span> : </td>
                                <td><input type="number" name="minNo" value = "<%=offerObj.getString("minNo")%>"  class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row">Discount percentage<span style="color:red">*</span> : </td>
                                <td><input type="number" name="percent" value="<%=offerObj.getString("percent")%>" class="login-input" style="width:250px; height:25px" required/> </td>
								
                            </tr>
							
							<tr>
								<td class="left-row" >Description<span style="color:red">*</span> : </td>
								<td><textarea name="description" rows="7" cols="55" style="resize: none;" required><%=offerObj.getString("description")%>"</textarea>
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
