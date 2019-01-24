<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

session_start();

$con = new pdo_db("codes");

$filter = " WHERE code_number LIKE '%$_POST[filter]%'";

$sql = "SELECT * FROM codes".$filter;

$codes = $con->getData($sql);

echo json_encode($codes);

?>