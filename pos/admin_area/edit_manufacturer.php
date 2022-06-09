<?php


if(!isset($_SESSION['admin_email'])){

echo "<script>window.open('login.php','_self')</script>";

}

else {


?>

<?php

if(isset($_GET['edit_manufacturer'])){

$edit_manufacturer = $_GET['edit_manufacturer'];

$get_manufacturer = "select * from suppliers where supplier_id='$edit_manufacturer'";

$run_manufacturer = mysqli_query($con,$get_manufacturer);

$row_manufacturer = mysqli_fetch_array($run_manufacturer);

$s_id = $row_manufacturer['supplier_id'];


$s_name = $row_manufacturer['supplier_name'];

$s_city = $row_manufacturer['supplier_city'];

$s_phone = $row_manufacturer['supplier_phone'];

//$new_m_image = $row_manufacturer['manufacturer_image'];


}
//get the table associated with the supplier name
$get_table="select * from ".$s_name."";
$run_table=mysqli_query($con, $get_table);
$rows=mysqli_fetch_array($run_table);
//supplier status as either top 
$status=$rows['supplier_status'];



?>

<div class="row"><!-- 1 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<ol class="breadcrumb"><!-- breadcrumb Starts -->

<li class="active">

<i class="fa fa-dashboard"></i> Dashboard / Edit Supplier

</li>

</ol><!-- breadcrumb Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 1 row Ends -->


<div class="row"><!-- 2 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<div class="panel panel-default"><!-- panel panel-default Starts -->

<div class="panel-heading"><!-- panel-heading Starts -->

<h3 class="panel-title"><!-- panel-title Starts -->

<i class="fa fa-money fa-fw"> </i> Edit Supplier

</h3><!-- panel-title Ends -->

</div><!-- panel-heading Ends -->

<div class="panel-body"><!-- panel-body Starts -->

<form class="form-horizontal" action="" method="post" enctype="multipart/form-data"><!-- form-horizontal Starts -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> Supplier Name </label>

<div class="col-md-6">

<input type="text" name="manufacturer_name" class="form-control" value="<?php echo $s_name; ?>">

</div>

</div><!-- form-group Ends -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> Show as Top Supplier </label>

<div class="col-md-6">

<input type="radio" name="manufacturer_top" value="yes" 
<?php if($status == 'no'){}else{ echo "checked='checked'"; } ?> >

<label> Yes </label>

<input type="radio" name="manufacturer_top" value="no" 
<?php if($status == 'no'){ echo "checked='checked'"; }else{} ?> >

<label> No </label>

</div>

</div><!-- form-group Ends -->

<div class="form-group"><!-- form-group Starts -->


<label class="col-md-3 control-label"> Assign New product Category </label>
<div class="col-md-6">
<select name="product_cat" class="form-control" >

<option> Select  a Product Category </option>

    <?php
    $get_p_cats = "select * from product_categories ";

    $run_p_cats = mysqli_query($con,$get_p_cats);
    
    while ($row_p_cats=mysqli_fetch_array($run_p_cats)) {
    
    $p_cat = $row_p_cats['p_cat_title'];
    
    $p_id = $row_p_cats['p_cat_id'];
    
    echo "<option value='$p_cat' >$p_cat</option>";
    
    }
    ?>

    </select>
</div><form action="" method="post"><input class="add_btn" type="submit" name="new_cat"value="Add"></form>
<?php
//Adding a new category to the supplier

if(isset($_POST['new_cat'])){
    $product_cat=$_POST['product_cat'];
    //check if the category exist before adding another one
    $prod_cat=str_replace(' ', '_', $product_cat);
    $chek="select * from ".$s_name." where product_category= '".$prod_cat."'";
    if(mysqli_query($con, $chek)->num_rows==1){
        echo "<script>alert(' The selected product category already exists. ');</script>";
    }else{
        //add the new Product category
        $add_cat="insert into ".$s_name." (product_category) values('$prod_cat')";
        $exe_add=mysqli_query($con, $add_cat);
        if($exe_add){
            echo '<script>alert("You have Successfully added a new category to this supplier");</script>';
            
        }
    }
   
    
}
?>
</div>
<div class="form-group"><!-- form-group Starts -->
<label class="col-md-3 control-label"> Select Supplier's Image </label>

<div class="col-md-6">

<input type="file" name="manufacturer_image" class="form-control" >

<br>

<img src="other_images/<?php echo $m_image; ?>" width="70" height="70" alt="No image selected">

</div>

</div><!-- form-group Ends -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> </label>

<div class="col-md-6">

<input type="submit" name="update" class="form-control btn btn-primary" value=" Update Supplier " >

</div>

</div><!-- form-group Ends -->

</form><!-- form-horizontal Ends -->

</div><!-- panel-body Ends -->

</div><!-- panel panel-default Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 2 row Ends -->

<?php

if(isset($_POST['update'])){

$manufacturer_name = $_POST['manufacturer_name'];

$manufacturer_top = $_POST['manufacturer_top'];

$manufacturer_image = $_FILES['manufacturer_image']['name'];

$tmp_name = $_FILES['manufacturer_image']['tmp_name'];

move_uploaded_file($tmp_name,"other_images/$manufacturer_image");

if(empty($manufacturer_image)){

$manufacturer_image = $new_m_image;

}

$update_manufacturer = "update manufacturers set manufacturer_title='$manufacturer_name',manufacturer_top='$manufacturer_top',manufacturer_image='$manufacturer_image' where manufacturer_id='$m_id'";

$run_manufacturer = mysqli_query($con,$update_manufacturer);

if($run_manufacturer){

echo "<script>alert('The Supplier Has Been Updated')</script>";

echo "<script>window.open('index.php?view_manufacturers','_self')</script>";

}

}

?>

<?php } ?>