<html>
<head>
  <title>Buy</title>
</head>
<body>
  <h1>Place Order</h1>
 
	<%!
		String productName = "";
		String imageLocation = " ";
		int productPrice = 0;
		
	%>
	<%

		if (request.getParameter("XBox_360") != null){
			productName = "X Box 360";
			imageLocation = "images/img_XBox360.jpg";
			productPrice = 399;
		}else if (request.getParameter("XBox_One") != null){
			productName = "X Box One";
			imageLocation = "images/img_XBoxOne.jpg";
			productPrice = 499;
		}else if (request.getParameter("PlayStation_3") != null){
			productName = "PlayStation 3";
			imageLocation = "images/img_PlayStation3.jpg";
			productPrice = 349;
		}else if (request.getParameter("PlayStation_4") != null){
			productName = "PlayStation 4";
			imageLocation = "images/img_PlayStation4.jpg";
			productPrice = 449;
		}else if (request.getParameter("Wii") != null){
			productName = "Wii";
			imageLocation = "images/img_Wii.jpg";
			productPrice = 349;
		}else if (request.getParameter("WiiU") != null){
			productName = "WiiU";
			imageLocation = "images/img_WiiU.jpg";
			productPrice = 349;
		}else if (request.getParameter("Warranty") != null){
			productName = "Warranty";
			imageLocation = "images/1-year-Warranty.gif";
			productPrice = 49;
		}else if (request.getParameter("GTA5") !=null){
			productName = "GTA5";
			imageLocation = "images/1.jpg";
			productPrice = 49;
		}else if (request.getParameter("MineCraft") !=null){
			productName = "MineCraft";
			imageLocation = "images/2.jpg";
			productPrice = 49;
		}else if (request.getParameter("SuperMario") !=null){
			productName = "SuperMario";
			imageLocation = "images/5.jpg";
			productPrice = 49;
		}

		
	%>
		
	<h3><%=productName%></h3>
		
	<form method="get" action="SubmitOrder">
		
		<fieldset>
			<legend>Product information:</legend>
			<img src = <%=imageLocation%> width = "200" height = "200" alt = "Product Image">
			<table>
				<tr>
					<td> Product Name: </td>
					<td> <input type="text" name="productName" value='<%=productName%>' readonly> </td>         
				</tr>
				
				<tr>
					<td> Product Price: </td>
					<td> <input type="text" name="productPrice" value=<%=productPrice%> readonly> </td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Personal information:</legend>
			<table>
				<tr>
					<td> First name: </td>
					<td> <input type="text" name="firstName"> </td>
				</tr>
				
				<tr>
					<td> Last name: </td>
					<td> <input type="text" name="lastName"> </td>
				</tr>
				
				<tr>
					<td> Address: </td>
					<td> <input type="text" name="address"> </td>
				</tr>
				
				<tr>
					<td> Phone: </td>
					<td> <input type="text" name="phoneNumber"> </td>
				</tr>
				
			</table>
				
			<br><br>
			<input type="submit" value="Place Order">
			
		</fieldset>
		
	</form>
		
	
</body>
</html>