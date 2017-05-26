
<!DOCTYPE html>
<?php
	include("includes/db.php")
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>edit product</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script>tinymce.init({ selector:'textarea' });</script>
</head>
<body>


	<form action = "edit_product.php" method = "post" enctype="multipart/form-data">
		<table align="center" width="70%" border="2">

			<tr align="left">
				<td colspan="7">
					<h2>Edit Product</h2>
				</td>
			</tr>
			<tr align="left">
				<td align="left">Product Title : </td>
				<td><input type="test" name="product_title" required /></td>
			</tr>
			<tr align="left">
				<td align="left">Product Category : </td>
				<td>
				<select name="product_cat" required>
					<option>Select a category</option>
					<?php
						$get_cats = "select * from categories";

						$run_cats = mysqli_query($con, $get_cats);
						// if (!$run_cats) {
						//  printf("Error: %s\n", mysqli_error($con));
						//  exit();
						// }
						$get_types = "select * from types";

						$run_types = mysqli_query($con, $get_types);

						while ($row_cats=mysqli_fetch_array($run_cats)){
							//while loop to fetch every element in the two column
							$cat_id = $row_cats['cat_id'];
							$cat_title = $row_cats['cat_title'];
					echo"<option value='$cat_id'>$cat_title</option>";
					}

					?>
				</select>
				</td>
			</tr>
			<tr align="left">
				<td align="left">Product type : </td>
				<td>
				<select name="product_type" required>
				<option>Select a type</option>
				<?php
				global $con;

				$get_types = "select * from subcategories";

				$run_types = mysqli_query($con, $get_types);

				while ($row_types=mysqli_fetch_array($run_types)){
					//while loop to fetch every element in the two column
					$type_id = $row_types['subcat_id'];
					$type_title = $row_types['subcat_title'];

					echo"<option value='$type_id'>$type_title</option>";
				}
				?>
				</select>
				</td>
			</tr>
			<tr align="left">
				<td align="left">Product Image : </td>
				<td><input type="file" name="product_image" /></td>
			</tr>
			<tr align="left">
				<td align="left">Product Price : </td>
				<td><input type="text" name="product_price" required/></td>
			</tr>
			<tr align="left">
				<td align="left">Product Description : </td>
				<td><textarea name="product_desc"></textarea></td>
			</tr>
			<tr align="left">
				<td align="left">Product additional info : </td>
				<td><input type="text" name="product_addinfo" size="60" /></td>
			</tr>

			<tr>
				<td align="left">Product size</td>
				<td><input type="text" name="product_size"></td>
			</tr>
			<tr>
				<td align="left">Product amount</td>
				<td><input type="text" name="product_amount"></td>
			</tr>
				<tr>
				<td align="left">Store In : </td>
				<td>
				<select name="warehouseID">
				<option>Select a warehouse: </option>
				<?php
					$get_warehouseID = "select * from warehouse";

					$run_warehouseID = mysqli_query($con, $get_warehouseID);

					

					while ($row_warehouseID=mysqli_fetch_array($run_warehouseID)){
						$warehouse_id = $row_warehouseID['warehouse_id'];
						$warehouse_name = $row_warehouseID['warehouse_name'];
				echo"<option value='$warehouse_id'>$warehouse_name</option>";

			}


				?>
			<tr align="center">
			

				<td colspan="7">
				<input type="submit" name="edit_product" value="edit_product" />
				<input type="submit" name="cncel_post" value="cancel" />
				</td>
				
			</tr>
			

		</table>

	</form>




</body>
</html>
<!-- get the value from the page and pass to the table -->

<?php
	if (isset($_POST['edit_product'])) {
		//getting the text data
		$product_title = $_POST['product_title'];
		$product_cat = $_POST['product_cat'];
		$product_type = $_POST['product_type'];
		$product_price = $_POST['product_price'];
		$product_desc = $_POST['product_desc'];
		$product_addinfo = $_POST['product_addinfo'];
		$product_size = $_POST['product_size'];
		$product_amount = $_POST['product_amount'];
		//getting the image
		$product_image = $_FILES['product_image']['name'];
		$product_image_tmp = $_FILES['product_image']['tmp_name'];

		move_uploaded_file($product_image_tmp, "product_images/$product_image");
		//the format is: move_uploaded_file(filename, destination)

		$edit_product = "UPDATE products SET product_price='$product_price',product_cat='$product_cat',product_type='$product_type',product_desc='$product_desc',product_addinfo='$product_addinfo',product_size='$product_size',product_amount='$product_amount' WHERE product_title = '$product_title'";

		
		$edit_pro = mysqli_query($con,$edit_product);

		if($edit_pro){
			echo "<script>alert('Product has been edited')</script>";
			echo "<script>window.open('edit_product.php','_self')</script>";
			//if we refresh the page, we won't have duplicate recorded data
		}
	}

?>