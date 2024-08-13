<?php
$host = "localhost";
$username = "root";
$password = ""; 
$database = "kalamitc_ks";

$connection = mysqli_connect($host, $username, $password, $database);

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Perform operations with the database

$type = $_REQUEST['type'];

if ($type == "GET1") {
    
    $query = "SELECT * FROM `categories_tb`";
    $result = mysqli_query($connection, $query);
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

    function buildCategoryTree($rows, $parent_id = 0) {
        $tree = array();

        foreach ($rows as $row) {
            if ($row['parent_id'] == $parent_id) {
                $row[] = buildCategoryTree($rows, $row['id']);
                $tree[] = $row;
            }
        }

        return $tree;
    }

    $data = buildCategoryTree($rows);

    // Convert to indexed array
    $jsonResult = json_encode($data);
    echo $jsonResult;
}else if($type=="getPro"){
    $id = $_REQUEST['id'];

    $query = "SELECT * FROM `product_tb`";
    $result = mysqli_query($connection, $query);
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    function buildCategoryTree($rows, $parent_id = null) {
        $tree = array();
    
        foreach ($rows as $row) {
            if ($row['cat_id'] == $parent_id) {
                $children = buildCategoryTree($rows, $row['id']);
                if ($children) {
                    $row['children'] = $children;
                } else {
                    $row['children'] = array(); // Empty array for categories without children
                }
                $tree[] = $row;
            }
        }
    
        return $tree;
    }
    
    $data = buildCategoryTree($rows);
    
    // Convert to indexed array
    $jsonResult = json_encode($data);
    echo $jsonResult;
   
}


mysqli_close($connection); // Close the connection when done
?>