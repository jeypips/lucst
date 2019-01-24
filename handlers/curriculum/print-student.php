<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$curriculum = $con->getData("SELECT * FROM curriculum WHERE id = $_POST[id]");

$course = $con->getData("SELECT * FROM courses WHERE id = ".$curriculum[0]['course_id']);
$curriculum[0]['course_id'] = $course[0];

$curriculum_data = $con->getData("SELECT id, curriculum_id, course_id, subject_code, descriptive_title, IFNULL(units, '') units, IFNULL(pre_req, '') pre_req, IFNULL(grade, '') grade FROM curriculum_data WHERE curriculum_id = ".$curriculum[0]['id']);
$curriculum[0]['curriculum_data'] = $curriculum_data;

$total = $con->getData("SELECT SUM(units) total FROM curriculum_data WHERE curriculum_id = ".$curriculum[0]['id']);
$curriculum[0]['total'] = $total[0];

/* foreach($clubs as $i => $club){
	
	$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$club['enrollment_id']);
	$clubs[$i]['enrollment_id'] = $students[0];
	
}; */


foreach ($curriculum as $i => $p) {
	
	if ($p == null) $curriculum[$i] = ""; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($curriculum[0]);

?>