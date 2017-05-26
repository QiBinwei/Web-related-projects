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

<jsp:include page="header.jsp" />

<section id="content">
<article>
<table width="100%">
<tr>
<td>
<h1 style="color: #777;border-bottom: 2px solid #777;">Hotels in <%=request.getParameter("city")%></h1>
</td>
</tr>
</table>
<div class="displaylist">
<%
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection hotels = db.getCollection("Hotel");
BasicDBObject hotelSearchQuery = new BasicDBObject();
hotelSearchQuery.put("city",request.getParameter("city"));	
DBCursor cursor = hotels.find(hotelSearchQuery);


%>

<ul>
<% while(cursor.hasNext()){
	BasicDBObject obj = (BasicDBObject) cursor.next();
	
	DBCollection hotelReviews = db.getCollection("HotelReviews");
	BasicDBObject reviewSearchQuery = new BasicDBObject();			
	reviewSearchQuery.put("hotelId",obj.getString("hotelId"));	
	DBCursor reviewcursor = hotelReviews.find(reviewSearchQuery);

	int count=0;
	int ratingTotal=0;
	int avgRating = 0;
	while(reviewcursor.hasNext()){
		count++;
		BasicDBObject reviewObject = (BasicDBObject) reviewcursor.next();
		ratingTotal = ratingTotal+reviewObject.getInt("reviewRating");
	}if(count!=0){
	avgRating = ratingTotal/count;
	}
%>
<li>
<a href="viewsinglehotel.jsp?hotelId=<%= obj.getString("hotelId")%>&hotelName=<%= obj.getString("hotelName")%>">
<section class="home-page-gallery">
<img src="<%= obj.getString("imageurl")%>" height="177px" width="248px">
<div class="title-box">
<h4 class="hotel-name-gallery"><%= obj.getString("hotelName")%></h4>
<div class="review-rating-background">    
    <div  class="review-rating" style="width:<%= avgRating%>%;">
</div>
</div>
<p class="title-box-details"><%= obj.getString("city")%> <%= obj.getString("state")%></p>
</div>
</section>
</a>
</li>
<%} %>

</ul>
</div>
</article>
</section>
        
<aside class="sidebar">
	
 <ul>	
               <li>
                    <h4>Top Destinations</h4>
                    <ul>
                       <li><a href="viewallhotels.jsp?city=New York">Hotels in New York</a></li>
                        <li><a href="viewallhotels.jsp?city=Las Vegas">Hotels in Las Vegas</a></li>
						<li><a href="viewallhotels.jsp?city=Chicago">Hotels in Chicago</a></li>
						<li><a href="viewallhotels.jsp?city=San Francisco">Hotels in San Francisco</a></li>
						<li><a href="viewallhotels.jsp?city=Miami">Hotels in Miami</a></li>
						<li><a href="viewallhotels.jsp?city=Washington">Hotels in Washington</a></li>                  
                    </ul>
                </li>
                
                <li>
                    <h4>Things To Do</h4>
                    <ul>
                        <li><a href="viewthingstodocust.jsp?city=New York">Things to do in New York</a></li>
                        <li><a href="viewthingstodocust.jsp?city=Las Vegas">Things to do in Las Vegas</a></li>
						<li><a href="viewthingstodocust.jsp?city=Chicago">Things to do in Chicago</a></li>
						<li><a href="viewthingstodocust.jsp?city=San Fransico">Things to do in San Francisco</a></li>
						<li><a href="viewthingstodocust.jsp?city=Miami">Things to do in Miami</a></li>
						<li><a href="viewthingstodocust.jsp?city=Washington">Things to do in Washington</a></li>  
                    
                    </ul>
                </li>
                
               
                
                <li>
                    <h4>Special</h4>
                    <ul>
                        <li><a href="#" >Price Drops</a></li>
                        <li><a href="#" >FAQ</a></li>
                        
                    </ul>
                </li>
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
