<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$enrollments = $con->getData("SELECT id, home_address,id_number,DATE_FORMAT(date_of_enrollment, '%M %d, %Y') date_of_enrollment, course, CONCAT(firstname,' ',lastname) fullname FROM enrollment");


foreach($enrollments as $i => $s){
	
	$course = $con->getData("SELECT * FROM courses WHERE id = ".$s['course']);
	
	$enrollments[$i]['course'] = $course[0];	
};


header("Content-Type: application/json");
echo json_encode($enrollments);

?>