<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$completion = $con->getData("SELECT * FROM completion WHERE id = $_POST[id]");

$student = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$completion[0]['enrollment_id']);
$completion[0]['enrollment_id']= $student[0];

$students_curriculum_datas = $con->getData("SELECT * FROM students_curriculum_data WHERE students_curriculum_data.enrollment_id = ".$completion[0]['enrollment_id']['id']);
foreach($students_curriculum_datas as $key => $scd){
	
	$curriculum_data = $con->getData("SELECT id, descriptive_title FROM curriculum_data WHERE id  = ".$scd['curriculum_data_id']);
	$students_curriculum_datas[$key]['curriculum_data_id'] = $curriculum_data[0];
	
};
$completion[0]['students_curriculum_datas'] = $students_curriculum_datas;
$completion[0]['students_curriculum_dels'] = [];

header("Content-Type: application/json");
echo json_encode($completion[0]);

?>