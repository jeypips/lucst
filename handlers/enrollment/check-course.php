<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$curriculum = $con->getData("SELECT * FROM curriculum WHERE course_id = ".$_POST['id']);

echo json_encode($curriculum);

?>