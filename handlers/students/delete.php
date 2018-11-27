<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

header("Content-Type: application/json");
$con = new pdo_db("students");

$delete = $con->deleteData(array("id"=>implode(",",$_POST['id'])));	

$pictures = array("front");

foreach ($_POST['id'] as $id) {
	
	foreach($pictures as $picture) {
		
		$file = "../../pictures/".$id."_".$picture.".png";
		if (file_exists($file)) unlink($file);
		
	}
	
};

?>