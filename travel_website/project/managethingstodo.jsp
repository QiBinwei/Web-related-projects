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
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;">Manage Things To Do</span>
</td>
<td align="right">							
	<button class="sign-in-up-button" type="button" onclick="location.href='addthingstodo.jsp'">Add New</button>					
</td>
</tr>
</table>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<th>ID</th>
<th>Event</th>
<th>Price</th>
<th>Street</th>
<th>City</th>
<th>State</th>
<th>Zip</th>
<th>Phone</th>
<th width="35">Edit</th>
<th width="35">Delete</th>
</tr>
<%
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection events = db.getCollection("ThingsToDo");
DBCursor cursor = events.find();
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
	<td><%=obj.getString("eventId") %></td>
	<td><%=obj.getString("eventName") %></td>
	<td><%= "$"+obj.getString("price")%></td>
	<td><%=obj.getString("street") %></td>
	<td><%=obj.getString("city") %></td>
	<td><%=obj.getString("state") %></td>
	<td><%=obj.getString("zip") %></td>
	<td><%=obj.getString("phone") %></td>
	<td width="30"><a href="editthingstodo.jsp?id=<%=obj.getString("eventId") %>"><img src="images/edit.png" border="0" alt="Edit"></a></td>
	<td width="30"><a href="deletethingstodo.jsp?id=<%=obj.getString("eventId") %>"><img src="images/delete.png" border="0" alt="Delete"></a></td>
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
			   
                    <h4>View Things to do</h4>
                    <ul>
                        <li><a href="viewthingstodo.jsp?city=New York">Things to do in New York</a></li>
                        <li><a href="viewthingstodo.jsp?city=Las Vegas">Things to do in Las Vegas</a></li>
						<li><a href="viewthingstodo.jsp?city=Chicago">Things to do in Chicago</a></li>
						<li><a href="viewthingstodo.jsp?city=San Fransico">Things to do in San Francisco</a></li>
						<li><a href="viewthingstodo.jsp?city=Miami">Things to do in Miami</a></li>
						<li><a href="viewthingstodo.jsp?city=Washington">Things to do in Washington</a></li>                   
                    </ul>
                </li>
                
               
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>