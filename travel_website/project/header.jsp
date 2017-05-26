<%@ page import="java.util.List" 
	import="java.util.ArrayList"
	import="com.mongodb.BasicDBObject"
	import="com.mongodb.DB"
	import="com.mongodb.DBCollection"
	import="com.mongodb.DBCursor"
	import="com.mongodb.MongoClient"
	import="com.mongodb.MongoException"
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hotel Reservation</title>    
	<link rel="stylesheet" href="styles.css" type="text/css" />
	<script type="text/javascript" src="javascript.js"></script>
</head>
<header>
<%
				int resCount=0;
				if(session.getAttribute("userId")!=null){
					MongoClient mongo = new MongoClient("localhost", 27017);
					DB db = mongo.getDB("CSP595HotelReservationTeam19");
					DBCollection hotelReservations= db.getCollection("HotelReservation");
					
					BasicDBObject searchQuery = new BasicDBObject();					
					searchQuery.put("customerId",session.getAttribute("userId"));					
					DBCursor hotelResCursor = hotelReservations.find(searchQuery);
					
					while(hotelResCursor.hasNext()){						
						BasicDBObject hotelObj = (BasicDBObject)hotelResCursor.next();
						resCount++;						
					}
				}
				%>
<div style="width: 100%; height:115px;position: relative;">
<div class="topcorner">
<ul>
 <%if(session.getAttribute("userId")==null){ %>
<li><a href="login.jsp">My Reservations</a></li>
<li><a href="login.jsp">Sign In</a></li>
<%} 
else {%>
<li><a href="myreservation.jsp">My Reservations(<%=resCount%>)</a></li>
<li><a href="signout">Sign Out</a></li>
<%} %>
</ul>
</div>
<table>
<tr>
<td>
<a href="index.jsp"><img src="images/homelogo.png" alt="HotelReservations" width="210px" height="90px"/></a>
</td>
<td valign="bottom">
<div class="home-form">
<form id="searchbox" action="" class="top-menu-form">
	<input type="text" name="startswith" id="search" placeholder="Enter city or hotel name" class="form-search-box" value="" onkeyup="suggest(this.value)"/>
	<div id="suggesationbox" class="dropdown">       
    </div>   
	<input type="submit" value="Search" class="form-submit-button"/>
</form>
</div>
</td>
</tr>
</table
</div>

</header>

<nav>
<ul>
     <li class="mainmenu"><a href="index.jsp">Home</a></li>
     <li class="mainmenu"><a href="allhotels.jsp">Hotels</a></li>
     <li class="mainmenu"><a href="viewspecialoffers.jsp">Special Offers</a></li>
     <li class="mainmenu"><a href="viewhallsforcelebrationscust.jsp?city=All">Getaway Celebrations</a></li>    
    
</ul>
</nav>
<br/>
