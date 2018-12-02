<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("curriculum");

if ($_POST['curriculum']['id']) {
	
	$curriculum = $con->updateObj($_POST['curriculum'],'id');
	
} else {
	
	$curriculum = $con->insertObj($_POST['curriculum']);
	echo $con->insertId;

}

?>