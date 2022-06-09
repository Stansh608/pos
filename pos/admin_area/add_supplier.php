<?php


if(!isset($_SESSION['admin_email'])){

echo "<script>window.open('login.php','_self')</script>";

}

else {


?>


<div class="row"><!-- 1 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<ol class="breadcrumb"><!-- breadcrumb Starts -->

<li class="active">

<i class="fa fa-dashboard"></i> Dashboard / Add Supplier

</li>

</ol><!-- breadcrumb Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 1 row Ends -->


<div class="row"><!-- 2 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<div class="panel panel-default"><!-- panel panel-default Starts -->

<div class="panel-heading"><!-- panel-heading Starts -->

<h3 class="panel-title"><!-- panel-title Starts -->

<i class="fa fa-money fa-fw"> </i> Add Supplier

</h3><!-- panel-title Ends -->

</div><!-- panel-heading Ends -->

<div class="panel-body"><!-- panel-body Starts -->

<form class="form-horizontal" action="" method="post" enctype="multipart/form-data"><!-- form-horizontal Starts -->

<div class="form-group">
<label class="col-md-3 control-label"> Supplier Name </label>

<div class="col-md-6">

<input type="text" name="supplier_name" class="form-control" >

</div>
</div>

<!-- -->
<div class="form-group">
<label class="col-md-3 control-label"> Supplier Email </label>

<div class="col-md-6">

<input type="email" name="supplier_email" class="form-control" >

</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label"> Phone Number </label>

<div class="col-md-6">

<input type="number" name="supplier_phone" class="form-control" >

</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label"> Supplier City </label>

<div class="col-md-6">

<input type="text" name="supplier_city" class="form-control" >

</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label"> Supplier Address </label>

<div class="col-md-6">

<input type="text" name="supplier_address" class="form-control" >

</div>
</div>
<div class="form-group" ><!-- form-group Starts -->

<label class="col-md-3 control-label" > Product Category </label>

<div class="col-md-6" >

<select name="product_category" class="form-control" >

<option> Select  a Product Category </option>


<?php

$get_category = "select * from product_categories";

$run_sql = mysqli_query($con,$get_category);

while ($row_p_cats=mysqli_fetch_array($run_sql)) {

//

$cat_name = $row_p_cats['p_cat_title'];

echo "<option value='$cat_name' >$cat_name</option>";

}


?>


</select>
</div>
</div>

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> Show as Top Supplier </label>

<div class="col-md-6">

<input type="radio" name="supplier_status" value="yes" >

<label> Yes </label>

<input type="radio" name="supplier_status" value="no" >

<label> No </label>

</div>

</div><!-- form-group Ends -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> Select Supplier Image </label>

<div class="col-md-6">

<input type="file" name="supplier_image" class="form-control" >

</div>

</div><!-- form-group Ends -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> </label>

<div class="col-md-6">

<input type="submit" name="submit" class="form-control btn btn-primary" value=" Add New Supplier " >

</div>

</div><!-- form-group Ends -->

</form><!-- form-horizontal Ends -->

</div><!-- panel-body Ends -->

</div><!-- panel panel-default Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 2 row Ends -->

<?php

if(isset($_POST['submit'])){

$supplier_nam = $_POST['supplier_name'];
$supplier_email=$_POST['supplier_email'];

$supplier_city=$_POST['supplier_city'];
$supplier_address=$_POST['supplier_address'];
$supplier_phone=$_POST['supplier_phone'];
$product_category=$_POST['product_category'];
$supplier_status = $_POST['supplier_status'];
//convert dashes to underscore
$supplier_name= str_replace(' ', '_', $supplier_nam);

//insert into a table with suppliers
$rt = mysqli_query($con,"insert into suppliers(supplier_name,supplier_phone, supplier_city )Values('$supplier_name','$supplier_phone','$supplier_city')");

//uploading image
$supplier_image = $_FILES['supplier_image']['name'];

$tmp_name = $_FILES['supplier_image']['tmp_name'];

move_uploaded_file($tmp_name,"other_images/$supplier_image");

//check if the Supplier exists
if ($result = mysqli_query($con,"SHOW TABLES LIKE '".$supplier_name."'")) {
    if($result->num_rows == 1) {
        echo "<script>alert('The Supplier already Exists')</script>";
        
    }

//If the supplier does not exist then create the table for the new supplier
else {
$squ="CREATE TABLE ".$supplier_name." (
        supplier_id int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        supplier_name varchar(255) ,
        supplier_email varchar(50) ,
        
        supplier_phone varchar(20),
        supplier_city varchar(50),
        supplier_address varchar(255),
        
        product_category varchar(50),
        supplier_image varchar(50),
        supplier_status varchar(10))";


$res=mysqli_query($con,$squ);

$insert_supplier = "insert into ".$supplier_name." (
    
    supplier_name,
    supplier_email,
    supplier_phone,
    supplier_city ,
    supplier_address,
    supplier_image ,
    supplier_status,
    product_category) values ('$supplier_name','$supplier_email','$supplier_phone',
    '$supplier_city','$supplier_address', '$supplier_image', '$supplier_status','$product_category')";
$run_query = mysqli_query($con,$insert_supplier);

if($run_query){
    

echo "<script>alert('You have successfully added a new Supplier')</script>";

echo "<script>window.open('index.php?view_manufacturers','_self')</script>";

}


}
}


}

?>

<?php } ?>