<?php
$host = "localhost";
$username = "root";
$password = ""; 
$database = "kalamitc_ks_abcd";

$connection = mysqli_connect($host, $username, $password, $database);

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Perform operations with the database

$type = $_REQUEST['Type'];



if ($type=="1"){
    
    $query="INSERT INTO `categories_tb`(`id`, `parent_id`, `name`, `images`, `status`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')";
    
}else if($type=='GET2'){

    // $proid=$_GET['proid'];
 
    // $query = "SELECT `name`, `images` FROM `categories_tb` WHERE `parent_id` = '$proid'";
    // $result = mysqli_query($connection, $query);
    
    // $data = array();
    
    // while ($row = mysqli_fetch_assoc($result)) {
    //     $data[] = $row;
    // }
    
    // // Encode the retrieved data to JSON
    // $jsonData = json_encode($data);
    
    // echo $jsonData;

}




mysqli_close($connection); // Close the connection when done
?>