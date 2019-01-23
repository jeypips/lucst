<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$clubs = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM clubs");

foreach($clubs as $key => $club){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id  = ".$club['enrollment_id']);
	$clubs[$key]['enrollment_id'] = $students[0];
	
};
header("Content-Type: application/json");
echo json_encode($clubs);

?>