<!doctype html>
<?php
session_start();
include("functions/functions.php");
?>
<!-- INDEX -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>GameSpeed</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
    <!-- start header -->
<div id="container">
    <header>
        
    	<h1><a href="index.php">U-niD</span></a></h1>
        <h2>Grocery</h2>
    </header>
    <!-- start navigation bar -->
<nav>
        <nav>
            <ul>
                <li class=""><a href="index.php">Home</a></li>
                <li class=""><a href="allProducts.php">All Products</a></li>

            
               <!--  <li class=""><a href="Warranty.html">Warranty</a></li> -->
                <li class="start selected"><a href="customer_account.php">UserAccount</a></li>
                
               <div id="form">
                <form method="get" action="results.php" enctype="multipart/form-data">
                    <input type ="text" name="user_query" placeholder="search you need"/>
                    <input type= "submit" name ="search" value="Search"/>
                </form>
            </ul>

        </nav>
    </nav>

    <div id="body">		
    <!-- start content -->
	<section id="content">

	    <article>
			

			
		</article>
        <?php cart();?>
<!--          <span style="float: right; margin-right: 40px;">Welcome Guest!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
         <a href="ShoppingCart.php">Go to Cart</a></span> -->
        </div>
		<div>
			<form action="" method="post" enctype="multipart/form-data">
            

                <table>
                    <tr align="center" width="650">
                    <tr align="center">

                        
                    </tr>
                    <tr align="center">
                        <th>remove</th>
                        <th>product</th>
                        <th>quantity</th>
                        <th>total price</th>
                    </tr>
                    <?php

                      $total = 0;
                      global $con;
                      $ip = getIp();
                      $sel_price = "SELECT * FROM cart WHERE ip_add = '$ip'";
                      $run_price = mysqli_query($con,$sel_price);

                      while ($p_price=mysqli_fetch_array($run_price)) {
                          $pro_id=$p_price['p_id'];
                          $pro_price="select * from products where product_id='$pro_id'";
                          $run_pro_price=mysqli_query($con,$pro_price);
                          $pp_price=mysqli_fetch_array($run_pro_price);

                          $product_price=array($pp_price['product_price']);
                          $product_title = $pp_price['product_title'];
                          $product_image = $pp_price['product_image'];
                          $single_price = $pp_price['product_price'];//not using the array to display a single product's price
                          $total += array_sum($product_price); 


                                        

                    ?>
                    <tr align="center">
                        
                        <td><input type="checkbox" name="remove[]" value="<?php echo $pro_id;?>" /></td>
                        <td><?php echo $product_title;?>
                            <br>
                            <img src="admin_area/product_images/<?php echo $product_image;?>" width="100" length="100"/>
                        </td>
                        <td><input type="text" size="10" name="qty" value="<?php $qty;?>"/>
                        </td>
<!--                         <input type="hidden" name="hidden_pro_id" value="<?php echo $pro_id?>"/>
                        <input type="hidden" name="hidden_single_price" value="<?php echo $single_price?>"/> -->

                        <?php

                        if (isset($_POST['update_quant'])) {
                            $qty = $_POST['qty'];
                            
                            $update_qty = "UPDATE cart set qty = '$qty'";
                            $run_qty = mysqli_query($con,$update_qty);
                              $total = $total*$qty;                     
                        }

                        ?>
                        <td><?php echo "$".$single_price;?></td>
                     </tr>

                    <?php }?>

                    <tr align="right">
                       <th colspan="4">Total Price: <?php echo"$".$total;?></th>
                    </tr>

                    <tr align="right">
                        
                    <td colspan="4"><input type="submit" name="update_cart" value="Update Cart"/>
                    <input type="submit" name="update_quant" value="Update Quantity">
                    <input type="submit" name="continue" value="Continue Shopping"/>
                    <a href="customer_login.php" style="text-decoration: none; color: black; ">CheckOut</a></td>

                    </tr>                   
                </table>             
            </form>
            <?php


function deleteProduct(){
            global $con;
            $ip = getIp();


            if (isset($_POST['update_cart'])) {
                foreach ($_POST['remove'] as $remove_id) {
                    $delete_product ="DELETE FROM cart WHERE p_id='$remove_id' AND ip_add='$ip'";
                    $run_delete=mysqli_query($con, $delete_product);
                if ($run_delete) {
                    echo "<script>window.open('ShoppingCart.php','_self')</script>";
                }
                }
            }
            if (isset($_POST['continue'])) {
                echo "<script>window.open('index.php','_self')</script>";
            }
        echo @$deleteProduct = deleteProduct();

}
        
            ?>
            

            
		</div>
    </section>
        <!-- start sidebar -->
    <!-- <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Category</h4>
                    <ul id="category">
                        <?php getCats();?> -->

                       <!--  <?php getTypes();?> -->
                   <!--  </ul>
                </li>
                
                <li>
                    <h4>About us</h4>
                    <ul>
                        <li class="text">
                        	<p style="margin: 0;">Welcome to U-niD. </p>
                        	<p style="margin: 0;">We provide groceries of you need.</p>
                        </li>
                    </ul>
                </li>
                
                <li>
                	<h4>Search site</h4>
                    <ul>
                    	<li class="text">
                            <form method="get" class="searchform" action="#" >
                                <p>
                                    <input type="text" size="25" value="" name="s" class="s" />
                                    
                                </p>
                            </form>	
						</li>
					</ul>
                </li>
                
                <li>
                    <h4>Helpful Links</h4>
                    <ul>
                        <li><a href="http://www.w3schools.com/html/default.asp" title="premium templates">Learn HTML here</a></li>
                        <li><a href="http://www.w3schools.com/css/default.asp" title="web hosting">Learn CSS here</a></li>
                        
                    </ul>
                </li>
                
            </ul>
		
    </aside>
    
	<div class="clear"></div>
	</div> -->
    <!-- start footer -->
<!-- 	<footer> -->
	
<!--         <div class="footer-content">
            <ul>
            	<li><h4>Dummy Link Section 1</h4></li>
                <li><a href="#">Dummy Link 1</a></li>
                <li><a href="#">Dummy Link 2</a></li>
                <li><a href="#">Dummy Link  3</a></li>
			</ul>
           
        <div class="clear"></div>
        </div> -->
		
<!--         <div class="footer-bottom">
            <p>CS425 Final Project</p>
        </div>
		
    </footer> -->
<!-- </div> -->

</body>

</html>