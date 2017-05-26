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
            <h1 class ="logo">Staff Panel</h1>
            <nav>           
            <ul>
                
                <li><a href="Staff_account.php">Staff_account</a></li>
                <li><a href="warehouse.php">Warehouse</a></li>
                <li><a href="manageProducts.php">ManageProducts</a></li>
                <li><a href="supplier.php">Supplier</a></li>
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
		<ul>
        <div align="center">
        <?php
        getStaffInfo();
        ?>
        </div>

            
		</ul>
<!--         <?php cart();?> -->
        
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>

        <script src="js/main.js"></script>

    </body>
</html>
