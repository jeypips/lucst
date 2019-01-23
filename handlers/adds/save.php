<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("adds");

$students_curriculum_datas = $_POST['add']['students_curriculum_datas'];
unset($_POST['add']['students_curriculum_datas']);

$students_curriculum_dels = $_POST['add']['students_curriculum_dels'];
unset($_POST['add']['students_curriculum_dels']);


if ($_POST['add']['id']) {
	
	$add = $con->updateObj($_POST['add'],'id');
	$enrollment_id = $_POST['add']['enrollment_id'];
	
} else {
	
	$add = $con->insertObj($_POST['add']);
	$enrollment_id = $_POST['add']['enrollment_id'];
	echo $con->insertId;

};

if (count($students_curriculum_dels)) {

	$con->table = "students_curriculum_data";
	$delete = $con->deleteData(array("id"=>implode(",",$students_curriculum_dels)));		
	
};
                                    
if (count($students_curriculum_datas)) {

	$con->table = "students_curriculum_data";
	
	foreach ($students_curriculum_datas as $index => $value) {
		
		$students_curriculum_datas[$index]['enrollment_id'] = $enrollment_id;		
		
	}
	
	foreach ($students_curriculum_datas as $index => $value) {

		if ($value['id']) {
			
			$curriculum_row = $con->updateObj($students_curriculum_datas[$index],'id');
			
		} else {
			
			unset($students_curriculum_datas[$index]['id']);
			$curriculum_row = $con->insertObj($students_curriculum_datas[$index]);
			
		}
	
	}
	
};

?>