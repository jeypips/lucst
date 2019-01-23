<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

// $id = $_POST['id'];

$clubs = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM clubs");

foreach($clubs as $i => $club){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$club['enrollment_id']);
	$clubs[$i]['enrollment_id'] = $students[0];
	
};
foreach ($clubs as $i => $p) {
	
	if ($p == null) $clubs[$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($clubs);

?>