<?php

$con = mysqli_connect("localhost","root","Qibinwei1989!","ecommerce");
//getting the categories
// function getCats(){

// 	global $con;

// 	$get_cats = "select * from categories";

// 	$run_cats = mysqli_query($con, $get_cats);
// 	// if (!$run_cats) {
// 	//  printf("Error: %s\n", mysqli_error($con));
// 	//  exit();
// 	// }


// 	while ($row_cats=mysqli_fetch_array($run_cats)){
// 		//while loop to fetch every element in the two column
// 		$cat_id = $row_cats['cat_id'];
// 		$cat_title = $row_cats['cat_title'];
// 		echo"<option value='$cat_id'>$cat_title</option>";	
// 		getTypes($cat_id);
// 	}

// }
// //getting the types
// function getTypes($parent_id){

// 	global $con;

// 	$get_types = "select cat_id, subcat_id, subcat_title from categories,subcategories where ($parent_id = categories.cat_id)AND($parent_id = subcategories.parent_id)";

// 	$run_types = mysqli_query($con, $get_types);

// 	while ($row_types=mysqli_fetch_array($run_types)){
// 		//while loop to fetch every element in the two column
// 		$type_id = $row_types['subcat_id'];
// 		$type_title = $row_types['subcat_title'];

// 		echo"<option value='$type_id'>$type_title</option>";
// 	}

// }

?>