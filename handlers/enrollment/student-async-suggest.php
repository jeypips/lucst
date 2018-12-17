<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db("students");

$filter = " WHERE CONCAT(lastname, ', ', firstname, ' ', IFNULL(middlename,'')) LIKE '%$_POST[filter]%'";

$sql = "SELECT id, CONCAT(lastname, ', ', firstname, ' ', IFNULL(middlename,'')) fullname FROM students".$filter;

$students = $con->getData($sql);

echo json_encode($students);

?>