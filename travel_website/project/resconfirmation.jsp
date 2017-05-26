
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



		<section id="shoppingcart-content">
		<article>
		<div class="order-confirmation">
			<table style="width: 100%">
		 	<tr>
		  	<td><h1>Booking Confirmation</h1>
		    <h2>Thank you for your Reservation!</h2>
		    <h3>Confirmation number is: <%=request.getParameter("resConfirm")%></h3>
		    </td>
		    </tr>
		    <tr>
		    <td colspan="2">
		    <p></p>
		    </td>
		    </tr>
		    </table>
		    </div>
	    </article>
	    </section>
	


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
