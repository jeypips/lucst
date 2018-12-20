<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("enrollment");

$_POST['enrollment']['dob'] = (isset($_POST['enrollment']['dob']))?date("Y-m-d",strtotime($_POST['enrollment']['dob'])):"1970-01-01";
$_POST['enrollment']['date_of_enrollment'] = (isset($_POST['enrollment']['date_of_enrollment']))?date("Y-m-d",strtotime($_POST['enrollment']['date_of_enrollment'])):date("Y-m-d");

if ($_POST['enrollment']['id']) {
	
	$enrollment = $con->updateObj($_POST['enrollment'],'id');
	
} else {
	
	$enrollment = $con->insertObj($_POST['enrollment']);
	echo $con->insertId;

}

?>