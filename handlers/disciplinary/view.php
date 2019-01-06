<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$disciplinary = $con->getData("SELECT * FROM disciplinary WHERE id = $_POST[id]");

$student = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$disciplinary[0]['enrollment_id']);
$disciplinary[0]['enrollment_id']= $student[0];

$disciplinary_datas = $con->getData("SELECT * FROM disciplinary_data WHERE disciplinary_id = ".$disciplinary[0]['id']);
foreach($disciplinary_datas as $key => $disciplinary_data){
	
	$code_n = $con->getData("SELECT * FROM codes WHERE id  = ".$disciplinary_data['code_number']);
	$disciplinary_datas[$key]['code_number'] = $code_n[0];
	
	$code_t = $con->getData("SELECT * FROM codes WHERE id  = ".$disciplinary_data['code_title']);
	$disciplinary_datas[$key]['code_title'] = $code_t[0];
	
};
$disciplinary[0]['disciplinary_datas'] = $disciplinary_datas;
$disciplinary[0]['disciplinary_dels'] = [];

header("Content-Type: application/json");
echo json_encode($disciplinary[0]);

?>