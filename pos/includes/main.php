</head>

<body>

  <header class="page-header">
    <!-- topline -->
    <div class="page-header__topline">
      <div class="container clearfix">

        <div class="currency">
          <a class="currency__change" href="customer/my_account.php?my_orders">
          <?php
          if(!isset($_SESSION['customer_email'])){
          echo "Welcome :Guest"; 
          }
          else
          { 
              echo "Welcome : " . $_SESSION['customer_email'] . "";
            }
?>
          </a>
        </div>

               
        
        <ul class="login">

<li class="login__item">
<?php
if(!isset($_SESSION['customer_email'])){
  echo '<a href="./customer_register.php" class="login__link">Register</a>';
} 
  else
  { 
      echo '<a href="./customer/my_account.php" class="login__link">My Account</a>';
  }   
?>  
</li>


<li class="login__item">
<?php
if(!isset($_SESSION['customer_email'])){
  echo '<a href="./checkout.php" class="login__link">Sign In</a>';
} 
  else
  { 
      echo '<a href="./logout.php" class="login__link">Log out</a>';
  }   
?>  
  
</li>
</ul>
      
      </div>
    </div>
    <!-- bottomline -->
    <div class="page-header__bottomline">
      <div class="container clearfix">

        <div class="logo">
          <a class="logo__link" href="index.php">
            <h1 style="text-decoration: none;"><b>County Cosmetics</b></h1>
          </a>
        </div>

        <nav class="main-nav">
          <ul class="categories">


            <li class="categories__item">
              <a class="categories__link " href="./shop.php">
                Our Products
              </a>
            </li>


          <li class="categories__item">
              <a class="categories__link" href="customer/my_account.php?my_orders">
                My Account
               
              </a>
             

            </li>

          </ul>
        </nav>
      </div>
    </div>
  </header>