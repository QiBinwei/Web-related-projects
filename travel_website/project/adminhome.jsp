
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

<div>  
  <img  src="images/homepageimage.jpg" width="100%" height="330px"/>
  
</div>

<section id="content">
<article>
<table>
<tr>
<td><img  src="images/administrator.png" width="200px" height="200px"/></td>
<td><br/><br/> <br/> <br/> <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1>Welcome Administrator!</h1></td>
</tr>
</table>
</article>
</section>
        
<aside class="sidebar">
	
 <ul>	
               
                
                <li>
                    <h4>Things To Do</h4>
                    <ul>
                        <li><a href="viewthingstodo.jsp?city=New York">Things to do in New York</a></li>
                        <li><a href="viewthingstodo.jsp?city=Las Vegas">Things to do in Las Vegas</a></li>
						<li><a href="viewthingstodo.jsp?city=Chicago">Things to do in Chicago</a></li>
						<li><a href="viewthingstodo.jsp?city=San Fransico">Things to do in San Francisco</a></li>
						<li><a href="viewthingstodo.jsp?city=Miami">Things to do in Miami</a></li>
						<li><a href="viewthingstodo.jsp?city=Washington">Things to do in Washington</a></li>  
                    
                    </ul>
                </li>
                
                
               
                
                <li>
                    <h4>Special</h4>
                    <ul>
                        <li><a href="#" >Price Drops</a></li>
                        <li><a href="#" >FAQ</a></li>
                        
                    </ul>
                </li>
                
            </ul>
		
    </aside>
        
	<jsp:include page="footer.jsp" />

</div>

</body>

</html>
