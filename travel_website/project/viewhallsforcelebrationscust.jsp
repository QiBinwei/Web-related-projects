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
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;"> <%= request.getParameter("city")%> City Party Halls</span>
</td>
</tr>
</table>
<%
String city=request.getParameter("city");
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection halls = db.getCollection("GetAwayCelebrations");
BasicDBObject searchQuery = new BasicDBObject();
DBCursor cursor;
if(city.equals("All")){
 cursor= halls.find(searchQuery);
 }
else{
	searchQuery.put("city",city);
	cursor = halls.find(searchQuery);
}
int count = 0;
%>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<% while(cursor.hasNext()){
	count++;
	BasicDBObject obj = (BasicDBObject) cursor.next(); 
	%>
	
<tr>
				
				<td>
					<img src=<%= obj.getString("imageurl")%> width="200" height="200" alt="Roosevelt Hotel">
				</td>
				<td>
					<strong><%=obj.getString("hotelName") + "- "+ obj.getString("hallType")%></strong><br>
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
<%
if(count==0){%>
	<td colspan=8>No Data to Display</td>
	</tr>
<%}
%>
</tbody>
</table>

</article>
</section>
<aside class="sidebar">
	
 <ul>	
               <li>
			   
                    <h4>View Party Halls</h4>
                    <ul>
                        <li><a href="viewhallsforcelebrationscust.jsp?city=New York">Party Halls in New York</a></li>
                        <li><a href="viewhallsforcelebrationscust.jsp?city=Las Vegas">Party Halls in Las Vegas</a></li>
						<li><a href="viewhallsforcelebrationscust.jsp?city=Chicago">Party Halls in Chicago</a></li>
						<li><a href="viewhallsforcelebrationscust.jsp?city=San Fransisco">Party Halls in San Francisco</a></li>
						<li><a href="viewhallsforcelebrationscust.jsp?city=Miami">Party Halls in Miami</a></li>
						<li><a href="viewhallsforcelebrationscust.jsp?city=Washington D.C">Party Halls in Washington</a></li>      
						<li><a href="viewhallsforcelebrationscust.jsp?city=All">All Party Halls </a><li>			        
                    </ul>
                </li>
                
               
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>
</body></html>