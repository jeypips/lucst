<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("religions");

if ($_POST['religion']['id']) {
	
	$religion = $con->updateData($_POST['religion'],'id');
	
} else {
	
	$religion = $con->insertData($_POST['religion']);
	echo $con->insertId;

}

?>