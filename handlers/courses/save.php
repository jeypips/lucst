<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("courses");

if ($_POST['course']['id']) {
	
	$course = $con->updateData($_POST['course'],'id');
	
} else {
	
	$course = $con->insertData($_POST['course']);
	echo $con->insertId;

}

?>