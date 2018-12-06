<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$curriculum = $con->getData("SELECT * FROM curriculum WHERE id = $_POST[id]");

$course = $con->getData("SELECT id, course_name FROM courses WHERE id = ".$curriculum[0]['course_id']);
$curriculum[0]['course_id'] = $course[0];

header("Content-Type: application/json");
echo json_encode($curriculum[0]);

?>