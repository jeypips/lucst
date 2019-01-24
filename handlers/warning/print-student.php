<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$disciplinary = $con->getData("SELECT * FROM disciplinary WHERE id = $_POST[id]");

$disciplinary_datas = $con->getData("SELECT * FROM disciplinary_data WHERE disciplinary_id = ".$disciplinary[0]['id']);
foreach($disciplinary_datas as $key => $disciplinary_data){
	
	$code_n = $con->getData("SELECT * FROM codes WHERE id  = ".$disciplinary_data['code_number']);
	$disciplinary_datas[$key]['code_number'] = $code_n[0];
	
};
$disciplinary[0]['datas'] = $disciplinary_datas;

$student = $con->getData("SELECT *, DATE_FORMAT(dob, '%M %d, %Y') dob, DATE_FORMAT(date_of_enrollment, '%Y') date_of_enrollment FROM enrollment WHERE id = ".$disciplinary[0]['enrollment_id']);

$semester = $con->getData("SELECT id, semester FROM curriculum WHERE id = ".$student[0]['semester']);
$student[0]['semester'] = $semester[0];

$disciplinary[0]['student'] = $student[0];



$course = $con->getData("SELECT * FROM courses WHERE id = ".$student[0]['course']);
$disciplinary[0]['student']['course'] = $course[0];

foreach ($disciplinary[0] as $i => $p) {
	
	if ($p == null) $disciplinary[0][$i] = "n/a"; // pdf equals null
	
};

foreach ($disciplinary[0]['student'] as $i => $p) {
	
	if ($p == null) $disciplinary[0]['student'][$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($disciplinary[0]);

?>