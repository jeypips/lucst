<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$code = $con->getData("SELECT * FROM codes WHERE id = $_POST[id]");

header("Content-Type: application/json");
echo json_encode($code[0]);

?>