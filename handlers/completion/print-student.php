<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../../db.php';

$con = new pdo_db();

$id = $_POST['id'];

$completion = $con->getData("SELECT *, DATE_FORMAT(date, '%M %d, %Y') date FROM completion WHERE id = $_POST[id]");

$student = $con->getData("SELECT id, id_number,firstname, lastname, middlename, course, year_level FROM enrollment WHERE id = ".$completion[0]['enrollment_id']);
$completion[0]['enrollment_id'] = $student[0];

$course = $con->getData("SELECT * FROM courses WHERE id = ".$completion[0]['enrollment_id']['course']);
$completion[0]['enrollment_id']['course'] = $course[0];



$students_curriculum_datas = $con->getData("SELECT *, IFNULL(written_works, '0') written_works, IFNULL(obe, '0') obe, IFNULL(att, '0') att, IFNULL(exam, '0') exam, IFNULL(previous_grade, '0') previous_grade,  IFNULL(tentative_grade, '0') tentative_grade, IFNULL(remarks, 'n/a') remarks, IFNULL(final_grade, '0') remarks, (written_works + obe + att + exam) final_grade FROM students_curriculum_data WHERE adding = '3' AND enrollment_id = ".$completion[0]['enrollment_id']['id']);
foreach($students_curriculum_datas as $key => $scd){
	
	$curriculum_data = $con->getData("SELECT *, IFNULL(lec, '0') lec, IFNULL(lab, '0') lab, IFNULL(total, '0') total FROM curriculum_data WHERE id  = ".$scd['curriculum_data_id']);
		
		foreach($curriculum_data as $i => $cd){
			
			$instructor = $con->getData("SELECT id, CONCAT(firstname,' ',lastname) fullname FROM instructor WHERE id = ".$cd['instructor']);
			$curriculum_data[$i]['instructor'] = $instructor[0];
		};
		
	$students_curriculum_datas[$key]['curriculum_data_id'] = $curriculum_data[0];
	
};
$completion[0]['students_curriculum_datas'] = $students_curriculum_datas;

foreach ($completion[0] as $i => $p) {
	
	if ($p == null) $completion[0][$i] = "n/a"; // pdf equals null
	
};

header("Content-Type: application/json");
echo json_encode($completion[0]);

?>