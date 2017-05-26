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
        
    	<h1><a href="/">U-niD</span></a></h1>
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

    <br>
        <?php cart();?>
	    <div class="cart">
         <span style="float: right; margin-right: 40px;">Welcome come back!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
         <a href="ShoppingCart.php">Go to Cart</a>
         <?php

         if (!isset($_SESSION['customer_email'])) {
             echo "<a href='logout.php'>Logout</a>";

         }
         else{
            echo "<a href='customer_login.php'>Login</a>";
         }


         ?>
         </span>


        </div>
        <?php getIp();?>
        <?php getInfo()?>
		<ul>

		</ul>
    </section>
        <!-- start sidebar -->
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>My Account</h4>
                    <ul id="category">
                    
                        <li><a href="my_order.php">My Order</a></li>
                        <li><a href="customer_edit.php">Edit Account</a></li>
                        <li><a href="customer_delete.php">Delete your address</a></li>
                        <li><a href="customer_deleteCard.php">Delete your Credit Card</a></li>


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