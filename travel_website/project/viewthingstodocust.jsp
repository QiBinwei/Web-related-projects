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
<table width="97%">
<tr>
<td colspan="2">
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;">Things To do in <%= request.getParameter("city")%></span>
</td>
</tr>
</table>
<%
String city=request.getParameter("city");
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection events = db.getCollection("ThingsToDo");
BasicDBObject searchQuery = new BasicDBObject();
searchQuery.put("city",city);
DBCursor cursor = events.find(searchQuery);
%>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<% while(cursor.hasNext()){
	BasicDBObject obj = (BasicDBObject) cursor.next(); 
	System.out.println(obj.getString("city"));%>
	
<tr>
				
				<td>
					<img src=<%= obj.getString("imageurl")%> width="200" height="200" alt="Roosevelt Hotel">
				</td>
				<td>
					<strong><%= obj.getString("eventName")%></strong><br>
					<span><%= obj.getString("street")+ " "+ obj.getString("city") +" "+ obj.getString("state")+" "+ obj.getString("zip")%></span><br><br>
					<strong>Contact info:</strong><br>
					<span>phone: <%=obj.getString("phone")%></span><br>
					<span>email: <%=obj.getString("email")%><span><br><br>	
					<strong>Description:</strong><br>
					<span><%=obj.getString("description")%><span>
				</td>	
				<td>
					Price: $<%=obj.getString("price")%>
				</td>
				
			</tr>
<%}%>
</tbody>
</table>

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
                
                
               
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>
</body></html>