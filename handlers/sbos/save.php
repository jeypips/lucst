<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("sbos");

$awards = $_POST['sbo']['awards'];
unset($_POST['sbo']['awards']);

$dels = $_POST['sbo']['dels'];
unset($_POST['sbo']['dels']);

if ($_POST['sbo']['id']) {
	
	$sbo = $con->updateObj($_POST['sbo'],'id');
	$sbo_id = $_POST['sbo']['id'];
	
} else {
	
	$sbo = $con->insertObj($_POST['sbo']);
	$sbo_id = $con->insertId;
	echo $con->insertId;

};

if (count($dels)) {

	$con->table = "sbo_awards";
	$delete = $con->deleteData(array("id"=>implode(",",$dels)));		
	
};
                                    
if (count($awards)) {

	$con->table = "sbo_awards";
	
	foreach ($awards as $index => $value) {
		
		$awards[$index]['sbos_id'] = $sbo_id;		
		
	}
	
	foreach ($awards as $index => $value) {

		if ($value['id']) {
			
			$curriculum_row = $con->updateObj($awards[$index],'id');
			
		} else {
			
			unset($awards[$index]['id']);
			$curriculum_row = $con->insertObj($awards[$index]);
			
		}
	
	}
	
};

?>