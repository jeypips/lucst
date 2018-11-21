<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("users");

if ($_POST['user']['id']) {
	
	$user = $con->updateData($_POST['user'],'id');
	
} else {
	
	$user = $con->insertData($_POST['user']);
	echo $con->insertId;

}

?>