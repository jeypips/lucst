<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$drops = $con->getData("SELECT * FROM drops");

foreach($drops as $key => $drop){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id  = ".$drop['enrollment_id']);
	$drops[$key]['enrollment_id'] = $students[0];
	
};
header("Content-Type: application/json");
echo json_encode($drops);

?>