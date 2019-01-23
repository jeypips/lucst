<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$instructor = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM instructor");

header("Content-Type: application/json");
echo json_encode($instructor);

?>