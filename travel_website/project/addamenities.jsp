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
                   

                     <form method="post"  action="addamenities">

					<table width="100%">
					<tr>
					<td>
						<h1 style="color: #777;border-bottom: 2px solid #777;margin-left:15px">Add Amenities</h1>
					</td>
					</tr>
					</table>
                        <table class="form-table" width=90%>							
							
							<tr>
								<th colspan = "3" align="left"> <b>Hotel  Amenities</b> </th>
						    </tr>                     
							
							<tr>
								<td class="left-row" colspan="3">Hotel<span style="color:red">*</span> :&nbsp; &nbsp;&nbsp;&nbsp;
                                
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
							<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td class="left-row"><input type="checkbox" name="hotelamenities" value="24-hour front desk">&nbsp;&nbsp;&nbsp;&nbsp;24-hour front desk</td>
                                <td class="left-row"><input type="checkbox" name="hotelamenities" value="24-hour business center">&nbsp;&nbsp;&nbsp;&nbsp;24-hour business center</td>
                                <td class="left-row"><input type="checkbox" name="hotelamenities" value="24-hour fitness facilities">&nbsp;&nbsp;&nbsp;&nbsp;24-hour fitness facilities</td>
							</tr>
							<tr>
								<td class="left-row"><input type="checkbox" name="hotelamenities" value="Free WiFi">&nbsp;&nbsp;&nbsp;&nbsp;Free WiFi </td>
                                <td class="left-row"><input type="checkbox" name="hotelamenities" value="Elevator/lift">&nbsp;&nbsp;&nbsp;&nbsp;Elevator/lift </td>
                                <td class="left-row"><input type="checkbox" name="hotelamenities" value="Dry cleaning/laundry service">&nbsp;&nbsp;&nbsp;&nbsp;Dry cleaning/laundry service</td>
                            </tr>
							<tr >
								<td class="left-row" ><input type="checkbox" name="hotelamenities" value="Valet parking">&nbsp;&nbsp;&nbsp;&nbsp;Valet parking </td>
								<td class="left-row" colspan="2"><input type="checkbox" name="hotelamenities" value="Bar/lounge">&nbsp;&nbsp;&nbsp;&nbsp;Bar/lounge</td>
                            
							</tr>
							
							<tr>
								<th colspan = "3" align="left"> <b>Room  Amenities</b> </th>
						    </tr> 
							<tr>
								<td class="left-row"><input type="checkbox" name="roomamenities" value="Air conditioning">&nbsp;&nbsp;&nbsp;&nbsp;Air conditioning </td>
                                <td class="left-row"><input type="checkbox" name="roomamenities" value="Bathrobes">&nbsp;&nbsp;&nbsp;&nbsp;Bathrobes</td>
                                <td class="left-row"><input type="checkbox" name="roomamenities" value="Cable TV service">&nbsp;&nbsp;&nbsp;&nbsp;Cable TV service</td>
							</tr>
							<tr>
								<td class="left-row"><input type="checkbox" name="roomamenities" value="Climate control">&nbsp;&nbsp;&nbsp;&nbsp;Climate control  </td>
                                <td class="left-row"><input type="checkbox" name="roomamenities" value="Coffee/tea maker">&nbsp;&nbsp;&nbsp;&nbsp;Coffee/tea maker  </td>
                                <td class="left-row"><input type="checkbox" name="roomamenities" value="Daily housekeeping">&nbsp;&nbsp;&nbsp;&nbsp;Daily housekeeping</td>
                            </tr>
							
                            <tr>
                                <td colspan = "3"><button class="sign-in-up-button" type="submit">Add</button> </td>
                                
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
