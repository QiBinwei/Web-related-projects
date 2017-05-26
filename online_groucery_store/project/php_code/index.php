<!doctype html>
<?php
session_start();
include("functions/functions.php");
?>
<!-- INDEX -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Online Store</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
    <!-- start header -->
<div id="container">
    <header>
        
    	<h1><a href="/">U-niD</span></a></h1>
        <h2>Grocery</h2>
    </header>
    <!-- start navigation bar -->
    <nav>
    	<nav>
    		<ul>
    	    	<li class="start selected"><a href="index.php">Home</a></li>
    	        <li class=""><a href="allProducts.php">All Products</a></li>

    	    
    	       <!--  <li class=""><a href="Warranty.html">Warranty</a></li> -->
    	        <li class=""><a href="customer_account.php">UserAccount</a></li>
    	        
    	       <div id="form">
                <form method="get" action="results.php" enctype="multipart/form-data">
                    <input type ="text" name="user_query" placeholder="search you need"/>
                    <input type= "submit" name ="search" value="Search"/>
                </form>
            </ul>

    	</nav>
    </nav>


    <img class="header-image" src="images/store.jpg" width = "100%" height = "80%" alt="Index Page Image" />

    <div id="body">		
    <!-- start content -->
	<section id="content">

    <br>
        <?php cart();?>
	    <div class="cart">
         <span style="float: right; margin-right: 40px;">Welcome Guest!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
         <a href="ShoppingCart.php">Go to Cart</a>
         <?php

         if (!isset($_SESSION['customer_email'])) {
             echo "<a href='customer_login.php'>Login</a>";
         }
         else{
            echo "<a href='logout.php'>Logout</a>";
         }


         ?>


         </span>


        </div>
        <?php getIp();?>
		<ul>

<!--             <h2>Secondary Section</h2> -->
						
            <div id="products_box">
              <?php getPro();?>
              <?php getCatPro();?>
              <?php getTypePro();?>
            </div>
			
<!-- 			<br><br>

			<a href="http://www.w3schools.com/html/default.asp" class="button">HTML</a>
			<a href="http://www.w3schools.com/css/default.asp" class="button">CSS</a>
			<br><br>
			<br> -->
			
		</ul>
    </section>
        <!-- start sidebar -->
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Category</h4>
                    <ul id="category">
                        <?php getCats();?>


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