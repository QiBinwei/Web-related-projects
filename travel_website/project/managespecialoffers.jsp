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
<span style="font-size:28px;font-weight:bold;color:#777;margin-left: 20px;">Special Offers</span>
</td>
<td align="right">							
	<button class="sign-in-up-button" type="button" onclick="location.href='addspecialoffers.jsp'">Add New</button>					
</td>
</tr>
</table>

<table style="cursor:pointer" class="datagrid" width="95%" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<th>ID</th>
<th>Hotel</th>
<th>Discount On</th>
<th>Minimum No.</th>
<th>Percent</th>
<th width="35">Edit</th>
<th width="35">Delete</th>
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
	<td align="left"><%=obj.getString("offerId") %></td>
	<td align="center"><%=obj.getString("hotel") %></td>
	<td align="center"><%=obj.getString("discountOn") %></td>
	<td align="center"><%=obj.getInt("minNo") %></td>
	<td align="center"><%=obj.getInt("percent") %></td>
	<td width="30"><a href="editspecialoffers.jsp?id=<%= obj.getString("offerId") %>"><img src="images/edit.png" border="0" alt="Edit"></a></td>
	<td width="30"><a href="deletespecialoffers.jsp?id=<%= obj.getString("offerId")%>"><img src="images/delete.png" border="0" alt="Delete"></a></td>
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
			   
			   
					<h4>Manage</h4>
                    <ul>
                       <li><a href="managehotel.jsp">Manage Hotels</a></li>
                        <li><a href="viewhotelamenities.jsp">Manage Amenities</a></li>
                        <li><a href="viewhotelroom.jsp">Manage Rooms</a></li>							                   
                    </ul>
					
         
                </li>
                
               
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
