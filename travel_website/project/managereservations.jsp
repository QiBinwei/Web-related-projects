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



<section id="content">
<article>
<table width="97%">
<tr>
<td colspan="2">
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;">Reservations</span>
</td>
<td align="right">							
						
</td>
</tr>
</table>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<th>Customer ID</th>
<th>Hotel ID</th>
<th>Hotel Name</th>
<th>Room Type</th>
<th>Rooms</th>
<th>Adults</th>
<th>Children</th>
<th>Check In </th>
<th>Check Out</th>
</tr>
<%
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection hotelReserv = db.getCollection("HotelReservation");
DBCursor cursor = hotelReserv.find();
%>


<% 
int count=0;
while(cursor.hasNext()){
	count++;
	if((count % 2)==0){ %>  		
      	<tr class="even">      
	<%}else{%>
      	<tr class="odd">
	<%}
	BasicDBObject obj = (BasicDBObject) cursor.next(); %>
	<td><%=obj.getString("customerId") %></td>
	<td><%=obj.getString("hotelId") %></td>
	<td><%=obj.getString("hotelName") %></td>
	<td><%=obj.getString("roomType") %></td>
	<td><%=obj.getInt("rooms") %></td>
	<td><%=obj.getInt("adults") %></td>
	<td><%=obj.getInt("children") %></td>
	<td><%=obj.getString("checkIn") %></td>
	<td><%=obj.getString("checkOut") %></td>
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
                        <li><a href="viewhallsforcelebrations.jsp?city=New York">Hotels in New York</a></li>
                        <li><a href="viewhallsforcelebrations.jsp?city=Las Vegas">Hotels in Las Vegas</a></li>
						<li><a href="viewhallsforcelebrations.jsp?city=Chicago">Hotels in Chicago</a></li>
						<li><a href="viewhallsforcelebrations.jsp?city=San Fransisco">Hotels in San Francisco</a></li>
						<li><a href="viewhallsforcelebrations.jsp?city=Miami">Hotels in Miami</a></li>
						<li><a href="viewhallsforcelebrations.jsp?city=Washington D.C">Hotels in Washington</a></li>      
						<li><a href="viewhallsforcelebrations.jsp?city=All">All Hotels</a><li>						
				    </ul>
                </li>
                                   
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
