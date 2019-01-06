<?php

$_POST = json_decode(file_get_contents('php://input'), true);

include_once '../../db.php';

header("Content-Type: application/json");
$con = new pdo_db("codes");

if ($_POST['code']['id']) {
	
	$code = $con->updateData($_POST['code'],'id');
	
} else {
	
	$code = $con->insertData($_POST['code']);
	echo $con->insertId;

}

?>