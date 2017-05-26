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

<jsp:include page="header.jsp" />
<%

DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");

DBCollection hotelReviews = db.getCollection("HotelReviews");
BasicDBObject reviewSearchQuery = new BasicDBObject();			
reviewSearchQuery.put("hotelId",request.getParameter("hotelId"));
DBCursor cursor = hotelReviews.find(reviewSearchQuery);
DBCursor reviewcursor = hotelReviews.find(reviewSearchQuery);

int count=0;
int ratingTotal=0;
int avgRating = 0;
while(reviewcursor.hasNext()){
	count++;
	BasicDBObject reviewObject = (BasicDBObject) reviewcursor.next();
	ratingTotal = ratingTotal+reviewObject.getInt("reviewRating");
}
if(count!=0){
avgRating = ratingTotal/count;
}

DBCollection hotel = db.getCollection("Hotel");
BasicDBObject hotelSearchQuery = new BasicDBObject();				
hotelSearchQuery.put("hotelId",request.getParameter("hotelId"));	
DBCursor hotelCursor = hotel.find(hotelSearchQuery);
String hotelId="";
String hotelName="";

DBCollection hotelRoom = db.getCollection("HotelRoom");
BasicDBObject hotelRoomSearchQuery = new BasicDBObject();				
hotelRoomSearchQuery.put("hotel",request.getParameter("hotelId")+"-"+request.getParameter("hotelName"));	
DBCursor hotelRoomCursor = hotelRoom.find(hotelRoomSearchQuery);
DBCursor hotelRoomCursor1 = hotelRoom.find(hotelRoomSearchQuery);
List hotelRoomList = new ArrayList();

DBCollection hotelAmenities = db.getCollection("HotelAmenities");
BasicDBObject hotelAmenitiesSearchQuery = new BasicDBObject();				
hotelAmenitiesSearchQuery.put("hotel",request.getParameter("hotelId")+"-"+request.getParameter("hotelName"));	
DBCursor hotelAmenitiesCursor = hotelAmenities.find(hotelAmenitiesSearchQuery);

%>

<section id="hotel-view-content">
<table>
<tr>
<td>
<%if(hotelCursor.hasNext()){
BasicDBObject hotelObj = (BasicDBObject) hotelCursor.next();
hotelId = hotelObj.getString("hotelId");
hotelName = hotelObj.getString("hotelName");
%>
<table>
<tr>
<td>
<h1 style="color:#1a9ad4;font-size: 24px;"><%=hotelObj.getString("hotelName")%></h1>
</td>
<td valign="center" align="left">
<div class="review-rating-background">    
    <div  class="review-rating" style="width:<%=avgRating%>%;">
</div>
</div>
</td>
</tr>
<tr>
<td>
<span style="font-size:14px;font-weight:bold;"><%=hotelObj.getString("street")%>, <%=hotelObj.getString("city")%></span>
</td>
<td>
<span style="font-size:14px;font-weight:bold;"><%=hotelObj.getString("state")%> <%=hotelObj.getString("phone")%></span>
</td>
</tr>
</table>
<%}%>


<section class="slideshow">
  <div class="slideshow-container slide">
	<%while(hotelRoomCursor.hasNext()){
	BasicDBObject hotelRoomObj = (BasicDBObject) hotelRoomCursor.next();
	hotelRoomList.add(hotelRoomObj.getString("imageurl"));
	%>
		<img class="slide-img" src="<%=hotelRoomObj.getString("imageurl")%>"/>    
    <%}%>
  </div>
</section>
</td>
<td valign="top">
<table>
<tr >
<td align="right" width="290" colspan="2">
 <%if(session.getAttribute("userId")==null){ %>
<button class="sign-in-up-button" type="button" onclick="location.href='login.jsp'">Write Review</button></td>
 <%}else{%>
<button class="sign-in-up-button" type="button" onclick="location.href='writereview.jsp?hotelId=<%=hotelId%>&hotelName=<%=hotelName%>'">Write Review</button></td>	 
<%}%>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>

<tr>
<td width="145" height="135">
<%if(hotelRoomList.size()>0){%>
<img src="<%=hotelRoomList.get(0)%>" width="145" height="135"/> 
<%}else{%>
&nbsp;	
<%}%>
</td>
<td width="145" height="135">
<%if(hotelRoomList.size()>1){%>
<img src="<%=hotelRoomList.get(1)%>" width="145" height="135"/> 
<%}else{%>
&nbsp;	
<%}%>
</td>
</tr>
<tr>
<td width="145" height="135">
<%if(hotelRoomList.size()>2){%>
<img src="<%=hotelRoomList.get(2)%>" width="145" height="135"/> 
<%}else{%>
&nbsp;	
<%}%>
</td>
<td width="145" height="135">
<%if(hotelRoomList.size()>3){%>
<img src="<%=hotelRoomList.get(3)%>" width="145" height="135"/> 
<%}else{%>
&nbsp;	
<%}%>
</td></td>
</tr>
</table>
</td>
</tr>
</table>

<br/>
<br/>

<table class="choose-room-table" width=100%>							
							
	<tr>
	<th colspan = "3" align="left"> <b>Choose Your Room</b> </th>
	</tr>                     
	<%while(hotelRoomCursor1.hasNext()){
	BasicDBObject hotelRoomObj1 = (BasicDBObject) hotelRoomCursor1.next();
	%>
	<tr>
	<td width="25%"> 
	<img src="<%=hotelRoomObj1.getString("imageurl")%>" width="150" height="135"/>
	<table>
	<tr><td style="font-size:14px;font-weight:bold;color:#1a9ad4"><%=hotelRoomObj1.getString("roomTitle")%></td></tr>
	<tr><td style="font-size:14px;font-weight:bold"><%=hotelRoomObj1.getInt("beds")%> <%=hotelRoomObj1.getString("bedType")%></td></tr>
	<tr><td style="font-size:14px;font-weight:bold">Room Accomadates <%=hotelRoomObj1.getInt("adults")%> guests<br/>(up to <%=hotelRoomObj1.getInt("children")%> <%if(hotelRoomObj1.getInt("children")>1){%> children <%}else{%>child<%}%>)</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	</table>
	</td>
	<td width="55%" valign="top" align="justify">Description:<br/><br/><%=hotelRoomObj1.getString("description")%></td>							
	<td width="20%" align="center">
	<%if(session.getAttribute("userId")==null){ %>
	<button class="sign-in-up-button" type="button" onclick="location.href='login.jsp'">Book Now</button> </td>                                
    <%}else{%>
	<button class="sign-in-up-button" type="button" onclick="location.href='bookhotel.jsp?hotelId=<%=hotelId%>&hotelName=<%=hotelName%>&roomType=<%=hotelRoomObj1.getString("roomTitle")%>'">Book Now</button> </td>                                
    
	<%}%>
	</tr>
	<tr >
	<td colspan="3" height="1" style="background-color: #e2e2e2;"></td>
	</tr>
	<%}%>
</table>
<br/>
<br/>
<table>
<tr>
<td><h1 style="color:#1a9ad4;font-size: 24px;">Hotel Amenities</h1></td></tr>
<tr><td>&nbsp;</td></tr>
<%if(hotelAmenitiesCursor.hasNext()){
	BasicDBObject hotelAmenitiesObj = (BasicDBObject) hotelAmenitiesCursor.next();
	String[] hotelAmenitiesarr = hotelAmenitiesObj.getString("hotelamenities").split(",");
	String[] roomAmenitiesarr = hotelAmenitiesObj.getString("roomamenities").split(",");
%>
<tr><td><h1 style="color:#1a9ad4;font-size: 18px;">Hotel Amenities</h1></td></tr>
<tr>
<%for(int i=0;i<hotelAmenitiesarr.length;i++){%>
<td style="padding-right:.5em;padding-left:.5em">
<%=hotelAmenitiesarr[i]%>
</td>
<%}%>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><h1 style="color:#1a9ad4;font-size: 18px;">Room Amenities</h1></td></tr>
<tr>
<%for(int i=0;i<roomAmenitiesarr.length;i++){%>
<td style="padding-right:.5em;padding-left:.5em">
<%=roomAmenitiesarr[i]%>
</td>
<%}%>
</tr>
<%}%>
</table>
</td>
<td>
</table>
</td>
<br/>
<br/>
<table>
<tr>
<td>
<h1 style="color:#1a9ad4;font-size: 24px;">Reviews:</h1>
</td>
</tr>
</table>

		              
       <% while (cursor.hasNext()) {                	
			BasicDBObject obj = (BasicDBObject) cursor.next();%>		
			<table  class="reviewtable" style="font-size:14px; width:100%;">
			<tr>
			<th colspan="2" style="font-size:18px;"><%= obj.getString("reviewSummary")%></th>
			</tr>
		    <tr>
		    <td valign="top" width="70%">
		    <table>
		    <tr>
		    <td>
		    <div class="review-rating-background">    
			<div  class="review-rating" style="width:<%= obj.getInt("reviewRating")%>%;"></div>
			</div></span>
		    </td>
		    <td align="left" width="200px">Posted on: <%= obj.getString("reviewDate")%></td>
		    </tr>
		    <tr>
		    <td colspan="2">
		    by <%= obj.getString("custName")%> from <%= obj.getString("custCity")%>, <%= obj.getString("custState")%><br/>
		    <%= obj.getString("custAge")%>yrs <%= obj.getString("gender")%>, <%= obj.getString("custOccupation")%>
		    </td>
		    </tr>
		    <tr>
		    <td colspan="2">
		    <p style="font-size:14px; text-align: justify;line-height:20px;"><%= obj.getString("reviewText")%></p>
		    </td>
		    </tr>
            </table>
            </td>
            <td style="font-size: 13px;" width="28%" valign="top">
            <span style="text-decoration: underline;font-weight: bold;">Hotel Information</span><br/><br/>
            Hotel Name: <span style="font-weight: bold;"><%= obj.getString("hotelName")%></span><br/>
			Location: <%=obj.getString("city")%>, <%=obj.getString("state")%> <%= obj.getString("zip")%><br/><br/>
            Room  Type: <%=obj.getString("roomType")%><br/><br/>
            Price: <%=obj.getString("price")%>          
            </td>
            </tr>
            </table>              
      <%  }%>


</section>
<jsp:include page="footer.jsp" />
</div>

</body>

</html>
