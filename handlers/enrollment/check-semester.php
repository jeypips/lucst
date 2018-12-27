<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$students_curriculum_datas = $con->getData("SELECT * FROM curriculum_data WHERE curriculum_id = ".$_POST['id']);

echo json_encode($students_curriculum_datas);

?>