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
System.out.println(request.getParameter("id"));
	DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");			
	DBCollection specialOffers = db.getCollection("SpecialOffers");
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("offerId",request.getParameter("id"));
	specialOffers.remove(searchQuery);
	response.sendRedirect(request.getContextPath()+"/managespecialoffers.jsp");
%>                

</body>

</html>
