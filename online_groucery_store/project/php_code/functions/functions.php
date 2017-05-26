<?php

$con = mysqli_connect("localhost","root","Qibinwei1989!","ecommerce");
if (mysqli_connect_errno()) {
	echo "Connection not established: ".mysqli_connect_error();
}
//get visitor's ip address
function getIp() {

    $ip = $_SERVER['REMOTE_ADDR'];

 

    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {

        $ip = $_SERVER['HTTP_CLIENT_IP'];

    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {

        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];

    }

 

    return $ip;

}
//getting the categories
function getCats(){

	global $con;

	$get_cats = "select * from categories";

	$run_cats = mysqli_query($con, $get_cats);
	// if (!$run_cats) {
	//  printf("Error: %s\n", mysqli_error($con));
	//  exit();
	// }


	while ($row_cats=mysqli_fetch_array($run_cats)){
		//while loop to fetch every element in the two column
		$cat_id = $row_cats['cat_id'];
		$cat_title = $row_cats['cat_title'];
		echo"<li><a href='index.php?cat=$cat_id'>$cat_title</a></li>";	
		echo getTypes($cat_id);
	}

}
//getting the types
function getTypes($parent_id){

	global $con;

	$get_types = "select cat_id, subcat_id, subcat_title from categories,subcategories where ($parent_id = categories.cat_id)AND($parent_id = subcategories.parent_id)";

	$run_types = mysqli_query($con, $get_types);

	while ($row_types=mysqli_fetch_array($run_types)){
		//while loop to fetch every element in the two column
		$type_id = $row_types['subcat_id'];
		$type_title = $row_types['subcat_title'];

		echo"<li class= type><a href='index.php?type=$type_id'>$type_title</a></li>";
	}

}

//错误检测！！！
	// if (!$query) {
	//  printf("Error: %s\n", mysqli_error($con));
	//  exit();
	// }



// function dispcategories(){
// 	global $con;
// 	$select = mysqli_query($con,"SELECT * FROM categories")	;

// 	while ($row = mysqli_fetch_assoc($select)) {
// 		// $cat_id = $row_cats['cat_id'];
// 		// $cat_title = $row_cats['cat_title'];
// 		// echo "<li><a href='index.php?cat=$cat_id'>$cat_title</a></li>" 
// 		echo"<li>".$row['cat_title'].dispsubcategories($row['cat_id']);"</li>";
// 	}
// }


// function dispsubcategories($parent_id){
// 	global $con;
// 	$select = mysqli_query($con,"SELECT cat_id, subcat_id, subcat_title FROM categories, subcategories WHERE ($parent_id = categories.cat_id)AND($parent_id = subcategories.parent_id)");
// 	while ($row = mysqli_fetch_array($select)) {
// 		echo "<li class=type><a href = 'index.php?cid=".$row['cat_id']."$scid=".$row['subcat_id']."'>".$row['subcat_title'];"</a></li>";
// 	}

// }
function getPro(){
	if (!isset($_GET['cat'])) {
		if (!isset($_GET['type'])) {
			
			
			global $con;
			$get_pro = "select * from products order by RAND() LIMIT 0, 6";
			//randomly get 6 products from the db
			$run_pro = mysqli_query($con, $get_pro);
			while ($row_pro=mysqli_fetch_array($run_pro)) {
				$pro_id = $row_pro['product_id'];
				$pro_cat = $row_pro['product_cat'];
				$pro_type = $row_pro['product_type'];
				$pro_title = $row_pro['product_title'];
				$pro_price = $row_pro['product_price'];
				$pro_image = $row_pro['product_image'];
				//we don't have to display the description and additional information
				// there are already a ""behind echo, therefore, in the div section we have to use ''
				echo "
					<li>
					<h4>$pro_title</h4>
					<img src='admin_area/product_images/$pro_image' width='175' height='175'>
					<h5><b>Price: $pro_price dollors </b></h5>
					<a href='details.php?pro_id=$pro_id' style='float:left;'>Details</a>
					<a href='index.php?add_cart=$pro_id'><button style=float:right>Add to Cart</button></a>
					</li>
				";

			}
		}
	}
}

function getCatPro(){
	if (isset($_GET['cat'])) {
		$cat_id = $_GET['cat'];
			global $con;
			$get_cat_pro = "select * from products where product_cat='$cat_id'";
			//randomly get 6 products from the db
			$run_cat_pro = mysqli_query($con, $get_cat_pro);
			$count_cats = mysqli_num_rows($run_cat_pro);
			if ($count_cats==0) {
				echo "<h4>Opps, the products in this category is just sold out, but won't be long!</h4>";
			}
			while ($row_cat_pro=mysqli_fetch_array($run_cat_pro)) {
				$pro_id = $row_cat_pro['product_id'];
				$pro_cat = $row_cat_pro['product_cat'];
				$pro_type = $row_cat_pro['product_type'];
				$pro_title = $row_cat_pro['product_title'];
				$pro_price = $row_cat_pro['product_price'];
				$pro_image = $row_cat_pro['product_image'];
				//we don't have to display the description and additional information
				// there are already a ""behind echo, therefore, in the div section we have to use ''
				echo "
					<li>
					<h4>$pro_title</h4>
					<img src='admin_area/product_images/$pro_image' width='175' height='175'>
					<h5><b>Price: $pro_price dollors </b></h5>
					<a href='details.php?pro_id=$pro_id' style='float:left;'>Details</a>
					<a href='index.php?add_cart=$pro_id'><button style=float:right>Add to Cart</button></a>
					</li>
				";

			}
		}
	
}
function getTypePro(){
	if (isset($_GET['type'])) {
		$type_id = $_GET['type'];
			global $con;
			$get_type_pro = "select * from products where product_type='$type_id'";
			//randomly get 6 products from the db
			$run_type_pro = mysqli_query($con, $get_type_pro);
			$count_types = mysqli_num_rows($run_type_pro);
			if ($count_types==0) {
				echo "<br><br><h4>Opps, the products in this type is just sold out.<br><br> but it won't be long!</h4>";
			}
			while ($row_type_pro=mysqli_fetch_array($run_type_pro)) {
				$pro_id = $row_type_pro['product_id'];
				$pro_cat = $row_type_pro['product_cat'];
				$pro_type = $row_type_pro['product_type'];
				$pro_title = $row_type_pro['product_title'];
				$pro_price = $row_type_pro['product_price'];
				$pro_image = $row_type_pro['product_image'];
				//we don't have to display the description and additional information
				// there are already a ""behind echo, therefore, in the div section we have to use ''
				echo "
					<li>
					<h4>$pro_title</h4>
					<img src='admin_area/product_images/$pro_image' width='175' height='175'>
					<h5><b>Price: $pro_price dollors </b></h5>
					<a href='details.php?pro_id=$pro_id' style='float:left;'>Details</a>
					<a href='index.php?add_cart=$pro_id'><button style=float:right>Add to Cart</button></a>
					</li>
				";

			}
		}
	
}

function cart(){
	if (isset($_GET['add_cart'])) {
		global $con;
		$ip = getIp();
		$pro_id = $_GET['add_cart'];
		//get product id and pass it tp the local variable $pro_id
		$check_pro = "SELECT * FROM cart WHERE ip_add='$ip' AND p_id='$pro_id'";
		$run_check = mysqli_query($con,$check_pro);
		if (mysqli_num_rows($run_check)>0) {
			echo "";//if the product are already in the cart, do nothing
		}
		else{
			$insert_pro = "insert into cart (p_id,ip_add,qty) values ('$pro_id','$ip',1)";
			$run_pro = mysqli_query($con,$insert_pro);
			
			//after insertion, take the customer back to homepage
			if($insert_pro){
			echo "<script>alert('Product has been added to your cart')</script>";
			echo "<script>window.open('index.php','_self')</script>";
			//if we refresh the page, we won't have duplicate recorded data
		}
			// echo "<script>window.open('index.php','_self')</script>";
		}
	}
}
function total_items(){
	if (isset($_GET['add_cart'])) {
		global $con;
		$ip = getIp();
		$get_items = "SELECT * FROM cart WHERE ip_add='$ip'";
		$run_items = mysqli_query($con,$get_items);
		$count_items = mysqli_num_rows($run_items);
	}
	else{
		global $con;
		$ip = getIp();
		$get_items = "SELECT * FROM cart WHERE ip_add='$ip'";
		$run_items = mysqli_query($con,$get_items);
		$count_items = mysqli_num_rows($run_items);
	}
		echo $count_items;
	
}

function total_price(){
	$total = 0;
	global $con;
	$ip = getIp();
	$sel_price = "SELECT * FROM cart WHERE ip_add = '$ip'";
	$run_price = mysqli_query($con,$sel_price);
	// while($p_price = mysqli_fetch_array($run_price)){
	// 	$pro_id = $p_price['p_id'];
	// 	$pro_price = "SELECT * FROM products WHERE product_id='$pro_id'";
	// 	$run_pro_price = mysqli_query($con,$pro_price);
	// 	while ($pp_price = mysqli_fetch_array($run_pro_price)){
	// 		$product_price = $pp_price['product_price'];

	// 		$values = array_sum($product_price);
	// 		$total += $values;
			
	// 	}
	// }
	while ($p_price=mysqli_fetch_array($run_price)) {
		$pro_id=$p_price['p_id'];
		$pro_price="select * from products where product_id='$pro_id'";
		$run_pro_price=mysqli_query($con,$pro_price);
		$pp_price=mysqli_fetch_array($run_pro_price);


		$product_price=array($pp_price['product_price']);
		
		$total+=array_sum($product_price);
	}
	// while ($p_price=mysqli_fetch_array($run_price)) {
	// 	$pro_id=$p_price['p_id'];
	// 	$pro_price="select product_price from products where product_id='$pro_id'";
	// 	$total+=array_sum($product_price);
	// }

	echo $total;
}
function getOrder(){

	global $con;
	$ip=getIp();

	$get_info = "select * from order where order_ip=$ip";

	$run_info = mysqli_query($con, $get_info);



	while ($row_info=mysqli_fetch_array($run_info)){
		//while loop to fetch every element in the two column
		$order_time = $row_info['order_time'];
		$order_card = $row_info['order_card'];
		$order_status = $row_info['order_status'];


		echo "<table>";
		echo"<tr><td>Order time:</td><td><h2>$order_time</h2></td></tr>";	
		echo"<tr><td>Order card</td><td><h2>$order_card</h2></td></tr>";	
		echo"<tr><td>Order status title</td><td><h2>$order_status</h2></td></tr>";

	

		echo "</table>";	


		
	}
}
function getInfo($c_eamil){

	global $con;
	

	$get_info = "select * from customers where customer_email='$c_email";

	$run_info = mysqli_query($con, $get_info);
	// if (!$run_cats) {
	//  printf("Einforror: %s\n", mysqli_error($con));
	//  exit();
	// }


	while ($row_info=mysqli_fetch_array($run_info)){
		//while loop to fetch every element in the two column
		$customer_name = $row_info['customer_name'];
		$customer_email = $row_info['customer_email'];
		$customer_state = $row_info['customer_state'];
		$customer_city = $row_info['customer_city'];
		$customer_contact = $row_info['customer_contact'];
		$customer_address = $row_info['customer_address'];
		$customer_card = $row_info['customer_card'];
		$customer_payAddress = $row_info['customer_payAddress'];
		echo "<table>";
		echo"<tr><td>Your Name:</td><td><h2>$customer_name</h2></td></tr>";	
		echo"<tr><td>Your Email</td><td><h2>$customer_email</h2></td></tr>";	
		echo"<tr><td>Your State</td><td><h2>$customer_state</h2></td></tr>";
		echo"<tr><td>Your City</td><td><h2>$customer_city</h2></td></tr>";		
		echo"<tr><td>Your Contact</td><td><h2>$customer_contact</h2></td></tr>";	
		echo"<tr><td>Your Address</td><td><h2>$customer_address</h2></td></tr>";	
		echo"<tr><td>You Credit Card</td><td><h2>$customer_card</h2></td></tr>";	
		echo"<tr><td>You Payment Address</td><td><h2>$customer_payAddress</h2></td></tr>";
		echo "</table>";	


		
	}
}
function getStaffInfo($staff_email){

	global $con;

	$get_info = "select * from staff where staff_email='$staff_email'";

	$run_info = mysqli_query($con, $get_info);
	// if (!$run_cats) {
	//  printf("Einforror: %s\n", mysqli_error($con));
	//  exit();
	// }


	while ($row_info=mysqli_fetch_array($run_info)){
		//while loop to fetch every element in the two column
		$staff_name = $row_info['staff_name'];
		$staff_email = $row_info['staff_email'];
		$staff_job = $row_info['staff_job'];
		$staff_salary = $row_info['staff_salary'];
		$staff_address = $row_info['staff_address'];

		echo "<table>";
		echo"<tr><td>Your Name:</td><td><h2>$staff_name</h2></td></tr>";	
		echo"<tr><td>Your Email</td><td><h2>$staff_email</h2></td></tr>";	
		echo"<tr><td>Your job title</td><td><h2>$staff_job</h2></td></tr>";
		echo"<tr><td>Your salary</td><td><h2>$staff_salary</h2></td></tr>";		
	
		echo"<tr><td>Your Address</td><td><h2>$staff_address</h2></td></tr>";	

		echo "</table>";	


		
	}
}
?>