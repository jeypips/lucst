<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$disciplinarys = $con->getData("SELECT * FROM disciplinary");


foreach($disciplinarys as $i => $s){
	
	$student = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$s['enrollment_id']);
	
	$disciplinarys[$i]['enrollment_id'] = $student[0];	
};

header("Content-Type: application/json");
echo json_encode($disciplinarys);

?>