<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$sbos = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM sbos");

foreach($sbos as $key => $sbo){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id  = ".$sbo['enrollment_id']);
	$sbos[$key]['enrollment_id'] = $students[0];
	
};
header("Content-Type: application/json");
echo json_encode($sbos);

?>