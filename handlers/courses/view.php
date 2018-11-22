<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$course = $con->getData("SELECT * FROM courses WHERE id = $_POST[id]");

header("Content-Type: application/json");
echo json_encode($course[0]);

?>