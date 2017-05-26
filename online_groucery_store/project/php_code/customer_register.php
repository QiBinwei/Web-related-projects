<!doctype html>
<?php
include("functions/functions.php");
include("includes/db.php");

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
   
        <span style="float: right; margin-right: 40px; ">Welcome Guest!&nbsp&nbsp&nbsp<b>Shopping Cart-&nbsp&nbsp</b>Total Items:&nbsp<?php total_items();?> &nbsp Total Pirce:&nbsp$<?php total_price()?>&nbsp
        <a href="ShoppingCart.php">Go to Cart</a></span>
        </div>
		<ul>
        <form action="customer_register.php" method="post" enctype="multipart/form-data">
        <table align="center" width="450">
        <tr>
            <td>Name</td>
            <td><input type="text" name="c_name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="c_email"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="c_pass"></td>
        </tr>
        <tr>
            <td>State</td>
            <td>
                <select name="c_state">
                    <option>California</option>
                    <option>Texas</option>
                    <option>Illinois</option>
                    <option>NewYork</option>
                    <option>Washington</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>City</td>
            <td><input type="text" name="c_city"></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><textarea cols="20" rows="1" name="c_address"></textarea></td>
        </tr>
        <tr>
            <td>Contact</td>
            <td><input type="text" name="c_contact"></td>
        </tr>
        <tr>
            <td>Credit Card</td>
            <td><input type="text" name="c_card"></td>
        </tr>
        <tr>
            <td>Payment Address</td>
            <td><input type="text" name="c_payAddress"></td>
        </tr>


        <tr>
            <td><input type="submit" name="register" value="Creat Acount"></td>
        </tr>
            


        </table>
           
        </form>
            
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
<?php

    if (isset($_POST['register'])) {

        $ip = getIp();


    $c_name = $_POST['c_name'];
    $c_email = $_POST['c_email'];
    $c_pass = $_POST['c_pass'];
    $c_state = $_POST['c_state'];
    $c_city = $_POST['c_city'];
    $c_contact = $_POST['c_contact'];
    $c_address = $_POST['c_address'];
    $c_card = $_POST['c_card'];
    $c_payAddress = $_POST['c_payAddress'];

     $insert_c = "insert into customers (customer_ip,customer_email,customer_pass,customer_name,customer_state,customer_city,customer_contact,customer_address,customer_card,customer_payAddress)values ('$ip','$c_email','$c_pass','$c_name','$c_state','$c_city','$c_contact','$c_address','$c_card','$c_payAddress')";

    $run_c = mysqli_query($con,$insert_c);
    // $select_cart = "SELECT * FROM cart WHERE ip_add='$ip'";
    // $run_cart = mysqli_query($con,$select_cart);
    // $check_cart = mysqli_num_rows($run_cart);
    if ($run_c) {
        
        echo "<script>alert('successfully registered');
            window.location.href='payment.php'</script>";

    }

    // if ($check_cart==0) {
    //    echo "<script>alert('successfully registered');
    //        window.location.href='customer/my_acount.php'</script>";
    // }
    // else{
    //     echo "<script>alert('successfully registered');
    //         window.location.href='payment.php'</script>";
    // }

    // }

    }





?>