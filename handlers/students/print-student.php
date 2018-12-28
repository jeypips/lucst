<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$enrollment = $con->getData("SELECT *, DATE_FORMAT(dob, '%M %d, %Y') dob, DATE_FORMAT(date_of_enrollment, '%Y') date_of_enrollment FROM enrollment WHERE id = $_POST[id]");

foreach ($enrollment[0] as $i => $p) {
	
	if ($p == null) $enrollment[0][$i] = ""; // pdf equals null
	
}

header("Content-Type: application/json");
echo json_encode($enrollment[0]);

?>