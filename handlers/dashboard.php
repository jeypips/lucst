<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

$con = new pdo_db();

$users = $con->getData("SELECT count(*) no_users FROM users");
$students = $con->getData("SELECT count(*) no_students FROM enrollment");
$instructor = $con->getData("SELECT count(*) no_instructor FROM instructor");
$no_courses = $con->getData("SELECT count(*) no_courses FROM courses");
$no_female = $con->getData("SELECT count(sex) no_female FROM enrollment WHERE sex = 'Female'");
$no_male = $con->getData("SELECT count(sex) no_male FROM enrollment WHERE sex = 'Male'");

$dashboard = array(
	"no_users"=>(count($users))?$users[0]['no_users']:0,
	"no_students"=>(count($students))?$students[0]['no_students']:0,
	"no_instructor"=>(count($instructor))?$instructor[0]['no_instructor']:0,
	"no_courses"=>(count($no_courses))?$no_courses[0]['no_courses']:0,
	"no_female"=>(count($no_female))?$no_female[0]['no_female']:0,
	"no_male"=>(count($no_male))?$no_male[0]['no_male']:0,

);

echo json_encode($dashboard);

?>