<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$course = $con->getData("SELECT * FROM courses WHERE id = $_POST[id]");

foreach($course as $key => $co){

	$curriculum = $con->getData("SELECT * FROM curriculum WHERE course_id = ".$co['id']);
		foreach($curriculum as $i => $c){
			
			$curriculum_data = $con->getData("SELECT * FROM curriculum_data WHERE curriculum_id = ".$c['id']);
			$curriculum[$i]['curriculum_data'] = $curriculum_data;
			
		};
	$course[$key]['curriculum'] = $curriculum;
};

foreach ($course as $i => $p) {
	
	if ($p == null) $course[$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($course[0]);

?>