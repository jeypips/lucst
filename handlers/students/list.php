<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname, sex, home_address, course FROM students");

foreach($students as $key => $student){
	
	$course = $con->getData("SELECT id, course_name FROM courses WHERE id = ".$student['course']);
	$students[$key]['course'] = $course[0];	
};

header("Content-Type: application/json");
echo json_encode($students);

?>