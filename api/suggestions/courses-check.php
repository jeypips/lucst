<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$courses = $con->getData("SELECT * FROM courses");

foreach ($courses as $key => $course) {		

	$curriculum = $con->getData("SELECT id, course_id, semester FROM curriculum WHERE course_id = ".$course['id']);

	foreach ($curriculum as $i => $c) {
		
		$students_curriculum_datas = $con->getData("SELECT id, curriculum_id, descriptive_title FROM curriculum_data WHERE curriculum_id = ".$c['id']);
		$curriculum[$i]['students_curriculum_datas'] = $students_curriculum_datas;

	};

	$courses[$key]['curriculum'] = $curriculum;	

};

header("Content-Type: application/json");
echo json_encode($courses);

?>