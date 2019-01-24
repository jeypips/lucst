<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db("disciplinary");

$disciplinary = $con->getData("SELECT * FROM disciplinary_data WHERE code_number = ".$_POST['id']);

foreach($disciplinary as $z => $x){
	
	$code = $con->getData("SELECT * FROM codes WHERE id = ".$x['code_number']);
	$disciplinary[$z]['code_number'] = $code[0];

}; 

foreach($disciplinary as $key => $d){
	
	$disciplinaries = $con->getData("SELECT * FROM disciplinary WHERE id = ".$d['disciplinary_id']);
		
		foreach($disciplinaries as $i => $dis){
		
			$students = $con->getData("SELECT id, id_number, CONCAT(firstname,' ',lastname) fullname FROM enrollment WHERE id = ".$dis['enrollment_id']);
			$disciplinaries[$i]['enrollment_id'] = $students[0];
		
		};
		
	$disciplinary[$key]['disciplinary_id'] = $disciplinaries[0];
	
};

header("Content-Type: application/json");
echo json_encode($disciplinary);

?>