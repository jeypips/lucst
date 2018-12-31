<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("curriculum");

$curriculum_datas = $_POST['curriculum']['curriculum_datas'];
unset($_POST['curriculum']['curriculum_datas']);

$curriculum_dels = $_POST['curriculum']['curriculum_dels'];
unset($_POST['curriculum']['curriculum_dels']);

if ($_POST['curriculum']['id']) {
	
	$curriculum = $con->updateObj($_POST['curriculum'],'id');
	$curriculum_id = $_POST['curriculum']['id'];
	
} else {
	
	$curriculum = $con->insertObj($_POST['curriculum']);
	$curriculum_id = $con->insertId;
	echo $con->insertId;

};

if (count($curriculum_dels)) {

	$con->table = "curriculum_data";
	$delete = $con->deleteData(array("id"=>implode(",",$curriculum_dels)));		
	
};
                                    
if (count($curriculum_datas)) {

	$con->table = "curriculum_data";
	
	foreach ($curriculum_datas as $index => $value) {
		
		$curriculum_datas[$index]['curriculum_id'] = $curriculum_id;
		
	}
	
	foreach ($curriculum_datas as $index => $value) {

		if ($value['id']) {
			
			$curriculum_row = $con->updateData($curriculum_datas[$index],'id');
			
		} else {
			
			unset($curriculum_datas[$index]['id']);
			$curriculum_row = $con->insertData($curriculum_datas[$index]);
			
		}
	
	}
	
};
?>