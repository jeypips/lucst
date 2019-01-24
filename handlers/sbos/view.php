<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$sbo = $con->getData("SELECT * FROM sbos WHERE id = $_POST[id]");

$student = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$sbo[0]['enrollment_id']);
$sbo[0]['enrollment_id']= $student[0];

foreach($sbo as $key => $s){
	
	$awards = $con->getData("SELECT * FROM sbo_awards WHERE sbos_id  = ".$s['id']);
	$sbo[$key]['awards'] = $awards;
	
};
$sbo[0]['dels'] = [];

header("Content-Type: application/json");
echo json_encode($sbo[0]);

?>