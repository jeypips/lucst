<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$codes = $con->getData("SELECT * FROM codes");

header("Content-Type: application/json");
echo json_encode($codes);

?>