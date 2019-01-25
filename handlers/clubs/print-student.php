<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$club = $con->getData("SELECT *, DATE_FORMAT(date_added, '%M %d, %Y') date_added FROM clubs WHERE id = $_POST[id]");

foreach($club as $i => $c){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$c['enrollment_id']);
	$club[$i]['enrollment_id'] = $students[0];
	
	$awards = $con->getData("SELECT * FROM club_awards WHERE clubs_id = ".$c['id']);
	$club[$i]['club_awards'] = $awards;
};


foreach ($club as $i => $p) {
	
	if ($p == null) $club[$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($club[0]);

?>