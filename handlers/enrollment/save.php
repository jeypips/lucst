<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("enrollment");

$_POST['enrollment']['dob'] = (isset($_POST['enrollment']['dob']))?date("Y-m-d",strtotime($_POST['enrollment']['dob'])):"1970-01-01";
$_POST['enrollment']['date_of_enrollment'] = (isset($_POST['enrollment']['date_of_enrollment']))?date("Y-m-d",strtotime($_POST['enrollment']['date_of_enrollment'])):date("Y-m-d");

$students_curriculum_datas = $_POST['enrollment']['students_curriculum_datas'];
unset($_POST['enrollment']['students_curriculum_datas']);

$students_curriculum_dels = $_POST['enrollment']['students_curriculum_dels'];
unset($_POST['enrollment']['students_curriculum_dels']);

if ($_POST['enrollment']['id']) {
	
	$enrollment = $con->updateObj($_POST['enrollment'],'id');
	$enrollment_id = $_POST['enrollment']['id'];
	
} else {
	
	$enrollment = $con->insertObj($_POST['enrollment']);
	$enrollment_id = $con->insertId;
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