<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

// $id = $_POST['id'];

$sbos = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM sbos");

foreach($sbos as $i => $sbo){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$sbo['enrollment_id']);
	$sbos[$i]['enrollment_id'] = $students[0];
	
};
foreach ($sbos as $i => $p) {
	
	if ($p == null) $sbos[$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($sbos);

?>