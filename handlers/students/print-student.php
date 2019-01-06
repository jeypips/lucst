<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$enrollment = $con->getData("SELECT *, DATE_FORMAT(dob, '%M %d, %Y') dob, DATE_FORMAT(date_of_enrollment, '%Y') date_of_enrollment FROM enrollment WHERE id = $_POST[id]");

$course = $con->getData("SELECT * FROM courses WHERE id = ".$enrollment[0]['course']);
$enrollment[0]['course'] = $course[0];

$semester = $con->getData("SELECT id, semester FROM curriculum WHERE id = ".$enrollment[0]['semester']);
$enrollment[0]['semester'] = $semester[0];

$students_curriculum_datas = $con->getData("SELECT * FROM students_curriculum_data WHERE enrollment_id = ".$enrollment[0]['id']);
foreach($students_curriculum_datas as $key => $scd){
	
	$curriculum_data = $con->getData("SELECT *, IFNULL(lec, '0') lec, IFNULL(lab, '0') lab, IFNULL(total, '0') total FROM curriculum_data WHERE id  = ".$scd['curriculum_data_id']);
	$students_curriculum_datas[$key]['curriculum_data_id'] = $curriculum_data[0];
	
};
$enrollment[0]['students_curriculum_datas'] = $students_curriculum_datas;

foreach ($enrollment[0] as $i => $p) {
	
	if ($p == null) $enrollment[0][$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($enrollment[0]);

?>