<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("enrollment");

$_POST['student']['dob'] = (isset($_POST['student']['dob']))?date("Y-m-d",strtotime($_POST['student']['dob'])):"1970-01-01";

if ($_POST['student']['id']) {
	
	$student = $con->updateData($_POST['student'],'id');
	
} else {
	
	$student = $con->insertData($_POST['student']);
	echo $con->insertId;

}

?>