
<!DOCTYPE html>
<?php
	include("includes/db.php")
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>delete product</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script>tinymce.init({ selector:'textarea' });</script>
</head>
<body>


	<form action = "delete_product.php" method = "post" enctype="multipart/form-data">
		<table align="center" width="70%" border="2">

			<tr align="left">
				<td colspan="7">
					<h2>Delete Product</h2>
				</td>
			</tr>
			<tr align="left">
				<td align="left">Product Title : </td>
				<td><input type="test" name="product_title" required /></td>
			</tr>


			<tr align="center">

				<td colspan="7">
				<input type="submit" name="delete_product" value="delete_product" />
				<input type="submit" name="cncel_post" value="cancel" />
				</td>
				
			</tr>
			

		</table>

	</form>




</body>
</html>
<!-- get the value from the page and pass to the table -->

<?php
	if (isset($_POST['delete_product'])) {
		//getting the text data
		$product_title = $_POST['product_title'];
		

		$delete_product = "DELETE FROM products WHERE product_title = '$product_title'";

		
		$delete_pro = mysqli_query($con,$delete_product);

		if($delete_pro){
			echo "<script>alert('Product has been deleted')</script>";
			echo "<script>window.open('delete_product.php','_self')</script>";
			//if we refresh the page, we won't have duplicate recorded data
		}
	}

?>