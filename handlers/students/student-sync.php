<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("detainee_infos");

$enrollment = $con->getData("SELECT * FROM enrollment WHERE id = ".$_POST['id']);

header("Content-Type: application/json");
echo json_encode($enrollment[0]);

?>