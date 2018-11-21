<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$student = $con->getData("SELECT * FROM enrollment WHERE id = $_POST[id]");

$course = $con->getData("SELECT * FROM courses WHERE id = ".$student[0]['course']);
$student[0]['course'] = $course[0];	

header("Content-Type: application/json");
echo json_encode($student[0]);

?>