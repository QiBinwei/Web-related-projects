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
	DBCollection hotelAmenities = db.getCollection("HotelAmenities");
	BasicDBObject searchQuery = new BasicDBObject();
	List<BasicDBObject> param = new ArrayList<BasicDBObject>();
	param.add(new BasicDBObject("hotel",request.getParameter("id")));
	searchQuery.put("$and",param );					
	hotelAmenities.remove(searchQuery);
	
	response.sendRedirect(request.getContextPath()+"/viewhotelamenities.jsp");
%>                

</body>

</html>
