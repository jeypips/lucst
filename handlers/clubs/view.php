<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$club = $con->getData("SELECT * FROM clubs WHERE id = $_POST[id]");

$student = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$club[0]['enrollment_id']);
$club[0]['enrollment_id']= $student[0];

foreach($club as $key => $c){
	
	$awards = $con->getData("SELECT * FROM club_awards WHERE clubs_id  = ".$c['id']);
	$club[$key]['awards'] = $awards;
	
};
$club[0]['dels'] = [];

header("Content-Type: application/json");
echo json_encode($club[0]);

?>