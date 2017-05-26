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
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;">Special Offers</span>
</td>
<td align="right">							
	
</td>
</tr>
</table>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<th>Hotel</th>
<th>Discount On</th>
<th>Minimum No.</th>
<th>Percent</th>
</tr>
<%
DB db = ((MongoClient)application.getAttribute("mongoclient")).getDB("CSP595HotelReservationTeam19");
DBCollection specialOffers = db.getCollection("SpecialOffers");
DBCursor cursor = specialOffers.find();
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
	<td align="center"><%=obj.getString("hotel") %></td>
	<td align="center"><%=obj.getString("discountOn") %></td>
	<td align="center"><%=obj.getInt("minNo") %></td>
	<td align="center"><%=obj.getInt("percent") %></td>
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

</body>

</html>
