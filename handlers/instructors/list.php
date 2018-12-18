<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$instructors = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname, office FROM instructor");

header("Content-Type: application/json");
echo json_encode($instructors);

?>