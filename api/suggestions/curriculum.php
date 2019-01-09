<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db();

$curriculum = $con->getData("SELECT id, descriptive_title FROM curriculum_data");

header("Content-Type: application/json");
echo json_encode($curriculum);

?>