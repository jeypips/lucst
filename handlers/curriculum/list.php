<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$curriculums = $con->getData("SELECT * FROM curriculum");

foreach($curriculums as $key => $c){
	
	$course = $con->getData("SELECT id, course_name FROM courses WHERE id = ".$c['course_id']);
	$curriculums[$key]['course_id'] = $course[0];	
};

header("Content-Type: application/json");
echo json_encode($curriculums);

?>