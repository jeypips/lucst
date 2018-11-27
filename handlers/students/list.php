<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$students = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname, sex, home_address, course FROM students");

$course = $con->getData("SELECT id, course_name FROM courses WHERE id = ".$students[0]['course']);
$students[0]['course'] = $course[0];	

header("Content-Type: application/json");
echo json_encode($students);

?>