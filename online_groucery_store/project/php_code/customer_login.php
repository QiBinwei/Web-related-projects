<!doctype html>
<?php

include("functions/functions.php");
include("includes/db.php");
?>
<!-- INDEX -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Log in</title>
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
   
        <span style="float: right; margin-right: 40px; ">Welcome Guest!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
        <a href="ShoppingCart.php">Go to Cart</a></span>
        </div>
		<ul>
        <form method="post" action="">
            <table width="400" align="center">
            <tr>
            <td colspan="2" align="center"><h5>Please login or Register to checkout</h5></td>
            </tr>
            <tr>
            <td>Email:</td>
            <td><input type="text" name="email" placeholder="enter your email"></td>
            </tr>
            <tr>
            <td>Password:</td>
            <td><input type="password" name="pass" placeholder="enter your password"></td>
            </tr>
            <tr>
                <td><input type="submit" name="login" value="login"></td>
            
           
                <td><a href="customer_register.php" style="text-decoration: none;">New? Register Here</a></td>
            </tr>
            </table>
        </form>

            
		</ul>
<!--         <?php cart();?> -->
        <?php

        if (isset($_POST['login'])) {
            # code...
            global $con;
            $c_email = $_POST['email'];
            $c_pass = $_POST['pass'];
            //to prevent mysql injection
            $c_email = stripcslashes($c_email);
            $c_pass = stripcslashes($c_pass);
            $c_email = mysql_real_escape_string($c_email);
            $c_pass = mysql_real_escape_string($c_pass);

            $select_customer = "select * from customers where customer_email='$c_email' and customer_pass='$c_pass'";
            $run_c = mysqli_query($con,$select_customer) or die("Failed to query the database".mysqli_error());
            $check_customer = mysqli_fetch_array($run_c);

            if ($check_customer['customer_email'] ==$c_email && $check_customer['customer_pass']==$c_pass) {
                    echo "<script>alert('login successfully');
                window.location.href='payment.php'</script></script>";
            }else{
                    echo "<script>alert('Sorry, you information doesn't match our records')</script>";
            }
            // if($check_customer == 0){
            //     echo "<script>alert('Sorry, you information doesn't match our records')</script>";
            // }
            // $ip=getIp();
            // $select_cart = "SELECT * FROM cart WHERE ip_add='$ip'";
            // $run_cart = mysqli_query($con,$select_cart);
            // $check_cart = mysqli_num_rows($run_cart);
            // else {
             
            //     echo "<script>alert('login successfully');
            // window.location.href='payment.php'</script></script>";
            // }

        }

        ?>
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