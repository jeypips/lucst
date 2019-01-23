<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$adds = $con->getData("SELECT * FROM adds");

foreach($adds as $key => $add){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id  = ".$add['enrollment_id']);
	$adds[$key]['enrollment_id'] = $students[0];
	
};
header("Content-Type: application/json");
echo json_encode($adds);

?>