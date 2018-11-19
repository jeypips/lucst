<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("enrollment");

if ($_POST['student']['id']) {
	
	$student = $con->updateData($_POST['student'],'id');
	
} else {
	
	$student = $con->insertData($_POST['student']);
	echo $con->insertId;

}

?>