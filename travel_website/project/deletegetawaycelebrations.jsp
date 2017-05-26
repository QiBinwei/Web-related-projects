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

<%		
	DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");			
	DBCollection getAwayCeleb = db.getCollection("GetAwayCelebrations");
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("hotelId",request.getParameter("id"));					
	getAwayCeleb.remove(searchQuery);
	
	response.sendRedirect(request.getContextPath()+"/managegetawaycelebrations.jsp");
%>                

</body>

</html>
