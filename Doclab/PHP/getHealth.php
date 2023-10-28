<?php
require_once 'common.php';

$sdao = new HealthDAO();
$schedules = $sdao->getAll();
$dataArray = [];

foreach ($schedules as $schedule) {
    $dataArray[] = [
        'recordID' => $schedule->getID(),
        'name' => $schedule->getName(),
        'date' => $schedule->getDate(),
        'location' => $schedule->getLocation()
    ];
}


// Now, $dataArray should contain the data as an array of records
echo json_encode($dataArray); // Return the data as JSON
?>
