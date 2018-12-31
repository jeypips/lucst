<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("instructor");

if ($_POST['instructor']['id']) {
	
	$instructor = $con->updateObj($_POST['instructor'],'id');
	
} else {
	
	$instructor = $con->insertObj($_POST['instructor']);
	echo $con->insertId;

}

?>