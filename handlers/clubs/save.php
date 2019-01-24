<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("clubs");

$awards = $_POST['club']['awards'];
unset($_POST['club']['awards']);

$dels = $_POST['club']['dels'];
unset($_POST['club']['dels']);

if ($_POST['club']['id']) {
	
	$club = $con->updateObj($_POST['club'],'id');
	$club_id = $_POST['club']['id'];
	
} else {
	
	$club = $con->insertObj($_POST['club']);
	$club_id = $con->insertId;
	echo $con->insertId;

};

if (count($dels)) {

	$con->table = "club_awards";
	$delete = $con->deleteData(array("id"=>implode(",",$dels)));		
	
};
                                    
if (count($awards)) {

	$con->table = "club_awards";
	
	foreach ($awards as $index => $value) {
		
		$awards[$index]['clubs_id'] = $club_id;		
		
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