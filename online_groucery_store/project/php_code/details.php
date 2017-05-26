<!doctype html>
<?php
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

<!-- 	<img class="header-image" src="images/img_index1.png" width = "100%" height = "100%" alt="Index Page Image" /> -->


    <div id="body">		
    <!-- start content -->
	<section id="content">

	    <article>
			

			
		</article>
	    <div class="cart">
   
        <span style="float: right; margin-right: 40px;">Welcome Guest!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
        <a href="ShoppingCart.php">Go to Cart</a></span>
        </div>
		<ul>
						
            
              <?php
              if(isset($_GET['pro_id'])){
              $product_id=$_GET['pro_id'];
              $get_pro = "select * from products where product_id='$product_id'";
              //randomly get 6 products from the db
              $run_pro = mysqli_query($con, $get_pro);
              while ($row_pro=mysqli_fetch_array($run_pro)) {
                $pro_id = $row_pro['product_id'];
                // $pro_cat = $row_pro['product_cat'];
                // $pro_type = $row_pro['product_type'];
                $pro_title = $row_pro['product_title'];
                $pro_price = $row_pro['product_price'];
                $pro_image = $row_pro['product_image'];
                $pro_desc = $row_pro['product_desc'];
                $pro_addinfo = $row_pro['product_addinfo'];
                //we don't have to display the description and additional information
                // there are already a ""behind echo, therefore, in the div section we have to use ''
                echo "
                <div id='products_box'>
                    <li>
                    <h4>$pro_title</h4>
                    <img src='admin_area/product_images/$pro_image' width='280' height='280'>
                    <h5><b>$pro_price dollors </b></h5>
                    <a href='index.php' style='float:left;'>Go Back</a>
                    <a href='index.php?pro_id=$pro_id'><button style=float:right>Add to Cart</button></a>
                    </div>
                    <br>
                    <p><h5>$pro_desc</h5></p>
                    
                    <h5>$pro_addinfo</h5>
                    </li>
                ";
              }
            }
              ?>
            
		</ul>
        <?php cart();?>
<!--         we have to put the cart function after getting the variable $pro_id in the upper php section. -->
    </section>
        <!-- start sidebar -->
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Category</h4>
                    <ul id="category">
                        <?php getCats();?>

                       <!--  <?php getTypes();?> -->
                    </ul>
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
	</div>
    <!-- start footer -->
    <footer>
    
        <div class="footer-content">
            <ul>
                <li><h4>Admin Section</h4></li>
                <li><a href="admin_area/staff_login.php">staff panel</a></li>

            </ul>
           
        <div class="clear"></div>
        </div>
        
        <div class="footer-bottom">
            <p>CSP 425 - Final Project</p>
        </div>
        
    </footer>
</div>

</body>

</html>