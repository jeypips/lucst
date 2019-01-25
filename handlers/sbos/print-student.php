<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

// $id = $_POST['id'];

$sbo = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM sbos");

foreach($sbo as $i => $s){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$s['enrollment_id']);
	$sbo[$i]['enrollment_id'] = $students[0];
	
	$awards = $con->getData("SELECT * FROM sbo_awards WHERE sbos_id = ".$s['id']);
	$sbo[$i]['sbo_awards'] = $awards;
	
};
foreach ($sbo as $i => $p) {
	
	if ($p == null) $sbo[$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($sbo[0]);

?>