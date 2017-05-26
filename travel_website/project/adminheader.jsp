<header>
<div style="width: 100%; height:115px;position: relative;">
<div class="topcorner">
<ul>
 <%if(session.getAttribute("userId")==null){ %>

<li><a href="login.jsp">Sign In</a></li>
<%} 
else {%>
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

</td>
</tr>
</table
</div>

</header>

<nav>
<ul>
     <li class="mainmenu"><a href="adminhome.jsp">Home</a></li>
     <li class="mainmenu"><a href="managehotel.jsp">Hotels</a></li>
	 <li class="mainmenu"><a href="managethingstodo.jsp">Things To Do</a></li>
     <li class="mainmenu"><a href="managespecialoffers.jsp">Special Offers</a></li>
     <li class="mainmenu"><a href="managegetawaycelebrations.jsp">Getaway Celebrations</a></li>  
	 <li class="mainmenu"><a href="managereservations.jsp">Reservations</a></li>	 
</ul>
</nav>
<br/>
