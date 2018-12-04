<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("students");

$_POST['student']['dob'] = (isset($_POST['student']['dob']))?date("Y-m-d",strtotime($_POST['student']['dob'])):"1970-01-01";
$_POST['student']['date_of_enrollment'] = (isset($_POST['student']['date_of_enrollment']))?date("Y-m-d",strtotime($_POST['student']['date_of_enrollment'])):date("Y-m-d");

if ($_POST['student']['id']) {
	
	$student = $con->updateObj($_POST['student'],'id');
	
} else {
	
	$student = $con->insertObj($_POST['student']);
	echo $con->insertId;

}

?>