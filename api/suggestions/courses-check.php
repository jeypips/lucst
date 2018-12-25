<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$courses = $con->getData("SELECT * FROM courses");

foreach ($courses as $key => $course) {		

	$curriculum = $con->getData("SELECT id, course_id, semester FROM curriculum WHERE course_id = ".$course['id']);

	foreach ($curriculum as $i => $c) {
		
		$curriculum_data = $con->getData("SELECT id, curriculum_id, descriptive_title FROM curriculum_data WHERE curriculum_id = ".$c['id']);
		$curriculum[$i]['curriculum_data'] = $curriculum_data;

	};

	$courses[$key]['curriculum'] = $curriculum;	

};

header("Content-Type: application/json");
echo json_encode($courses);

?>