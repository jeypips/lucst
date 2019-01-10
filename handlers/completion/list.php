<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$completions = $con->getData("SELECT * FROM completion");

foreach($completions as $key => $completion){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id  = ".$completion['enrollment_id']);
	$completions[$key]['enrollment_id'] = $students[0];
	
};
header("Content-Type: application/json");
echo json_encode($completions);

?>