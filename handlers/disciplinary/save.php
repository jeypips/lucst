<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("disciplinary");


$disciplinary_datas = $_POST['disciplinary']['disciplinary_datas'];
unset($_POST['disciplinary']['disciplinary_datas']);

$disciplinary_dels = $_POST['disciplinary']['disciplinary_dels'];
unset($_POST['disciplinary']['disciplinary_dels']);

if ($_POST['disciplinary']['id']) {
	
	$disciplinary = $con->updateObj($_POST['disciplinary'],'id');
	$disciplinary_id = $_POST['disciplinary']['id'];
	
} else {
	
	$disciplinary = $con->insertObj($_POST['disciplinary']);
	$disciplinary_id = $con->insertId;
	echo $con->insertId;

};


if (count($disciplinary_dels)) {

	$con->table = "disciplinary_data";
	$delete = $con->deleteData(array("id"=>implode(",",$disciplinary_dels)));		
	
};
                                    
if (count($disciplinary_datas)) {

	$con->table = "disciplinary_data";
	
	foreach ($disciplinary_datas as $index => $value) {
		
		$disciplinary_datas[$index]['disciplinary_id'] = $disciplinary_id;		
		
	}
	
	foreach ($disciplinary_datas as $index => $value) {

		if ($value['id']) {
			
			$disciplinary_row = $con->updateObj($disciplinary_datas[$index],'id');
			
		} else {
			
			unset($disciplinary_datas[$index]['id']);
			$disciplinary_row = $con->insertObj($disciplinary_datas[$index]);
			
		}
	
	}
	
};

?>