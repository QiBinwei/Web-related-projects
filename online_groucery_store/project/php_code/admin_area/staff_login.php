<!doctype html>
<?php

include("functions/functions.php");
include("includes/db.php");
?>
<!-- INDEX -->
 <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Introduction</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style.css">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,400,700' rel='stylesheet' type='text/css'>

        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <header>
        <div class="container">
            <h1 class ="logo">Introduction</h1>
            <nav>           
            <ul>
                
                <li><a href="index.html">Staff_account</a></li>
                <li><a href="info.html">Warehouse</a></li>
                <li><a href="gallery.html">ManageProducts</a></li>
               <!--  <li><a href="artist.html">ManagestaffAccount</a></li> -->
            </ul>
            </nav>
        </div>
        <div class="tagline">
            <div class="container">
                <h1> Uni-D Family</h1>
            </div>
        </div>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        <section>
		<ul><span style="font-size: 1.5em;">
        <form method="post" action="">
            <table width="400" align="center">
            <tr>
            <td colspan="2" align="center"><h5>Please login as our staff</h5></td>
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
            
           
                
            </tr>
            </table>
        </form>

            
		</ul>
<!--         <?php cart();?> -->
        <?php

        if (isset($_POST['login'])) {
            # code...
            global $con;
            $staff_email = $_POST['email'];
            $staff_pass = $_POST['pass'];
            //to prevent mysql injection
            $staff_email = stripcslashes($staff_email);
            $staff_pass = stripcslashes($staff_pass);
            $staff_email = mysql_real_escape_string($staff_email);
            $staff_pass = mysql_real_escape_string($staff_pass);

            $select_staff = "select * from staff where staff_email='staff_email' and staff_pass='$staff_pass'";
            $run_staff = mysqli_query($con,$select_staff) or die("Failed to query the database".mysqli_error());
            $check_staff = mysqli_fetch_array($run_staff);

            if ($check_staff['staff_email'] ==$staff_email && $check_staff['staff_pass']==$staff_pass) {
                    echo "<script>alert('login successfully');
                window.location.href='staff_account.php'</script></script>";
            }else{
                    echo "<script>alert('Sorry, you information doesn't match our records')</script>";
            }
            // if($check_staff == 0){
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
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>

        <script src="js/main.js"></script>

    </body>
</html>
