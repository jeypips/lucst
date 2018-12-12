<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$enrollments = $con->getData("SELECT *, DATE_FORMAT(date_of_enrollment, '%M %d, %Y') date_of_enrollment FROM enrollment");

foreach($enrollments as $key => $e){
	
	$student = $con->getData("SELECT id, course, CONCAT(firstname,' ',lastname) fullname FROM students WHERE id = ".$e['students_id']);
		
		foreach($student as $i => $s){
			
			$course = $con->getData("SELECT * FROM courses WHERE id = ".$s['course']);
			
			$student[$i]['course'] = $course[0];	
		};
		
	$enrollments[$key]['students_id'] = $student[0];	
};

header("Content-Type: application/json");
echo json_encode($enrollments);

?>