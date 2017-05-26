<%@ page import="java.util.List" 
	import="java.util.HashMap"
	import="java.util.Map"
	import="java.util.ArrayList"
	import="java.text.SimpleDateFormat"
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

<jsp:include page="header.jsp" />


<%

try{	
	
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");	
	DBCollection reservation = db.getCollection("HotelReservation");
	
	BasicDBObject searchQuery = new BasicDBObject();				
	searchQuery.put("customerId",session.getAttribute("userId"));
	
	DBCursor cursor = reservation.find(searchQuery);
	
	if(!cursor.hasNext()){%>
		<section id="shoppingcart-content">
		<article>
		<div class="shopping-cart-empty">
		<table style="width: 100%">
	    <tr>
	    <td>
	    <h1>My Reservations</h1>
	    <h2>You don't have any reservation yet!</h2>
	    </td>
	    </tr>
	    <tr>
	    <td colspan="2">
	    <p>It's a perfect time for you and your family to try our best in class hotels and have unlimited fun actually!</p>
	    </td>
	    </tr>
	    </table>
	    </div>
	    </article>
	    </section>
	<%}
	else{		%>
		<section id="shoppingcart-content">
		<article>
		 <div class="shopping-cart">
		 <table class="display-shoppingcart">
		 <tr><td><h1>My Reservations</h1></td></tr>
		</table>
		<table class="shoppingcartitem-table">
		<tr>
		<th></th>
		<th>Hotel</th>
		<th>Room Type</th>
		<th>Rooms</th>
		<th>Adults</th>
		<th>Children</th>
		<th>Check In</th>
		<th>Check Out</th>		
		<th>Cancel</th>		
		</tr>
		 
		 <%while(cursor.hasNext()){
			    BasicDBObject obj = (BasicDBObject) cursor.next();	
				
				DBCollection hotel = db.getCollection("Hotel");
	
				BasicDBObject hotelsearchQuery = new BasicDBObject();				
				hotelsearchQuery.put("hotelId",obj.getString("hotelId"));
	
				DBCursor hotelcursor = hotel.find(hotelsearchQuery);
				BasicDBObject hotelobj = (BasicDBObject) hotelcursor.next();
		 %>
				<tr>
				<td><img src="<%= hotelobj.getString("imageurl")%>" width="150px" height="140px"/></td>
				<td width="20%"><%=hotelobj.getString("hotelName")%><br/><br/><%=hotelobj.getString("city")%>, <%=hotelobj.getString("state")%> <%=hotelobj.getString("zip")%><br/>Phone: <%=hotelobj.getString("phone")%></td>
				<td ><%=obj.getString("roomType")%></td>		
				<td ><%=obj.getString("rooms")%></td>				
				<td ><%=obj.getString("adults")%></td>
				<td ><%=obj.getString("children")%></td>
				<td ><%=obj.getString("checkIn")%></td>
				<td ><%=obj.getString("checkOut")%></td>
				 <td>
				 <a href="cancelreservation?rerservationId=<%=obj.getObjectId("_id")%>">Cancel</a>
				 </td>
				 </tr>
					
				<%}%>
				
		</table>	
		</div>
		</article>
		</section>		
		<%}%>
	
<%
	
} catch (Exception e) {
	e.printStackTrace();
}
%>

	


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
