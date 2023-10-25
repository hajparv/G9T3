<?php

require_once 'common.php';
$dao = new ScheduleDAO();
$schedules = $dao->getAll(); // Get an Indexed Array of Post objects

$info = [];
foreach ($schedules as $schedule) {
    $scheduleInfo = [
        "scheduleID" => $schedule->getID(),
        "scheduleName" => $schedule->getScheduleName(),
        "scheduleDescription" => $schedule->getScheduleDescription(),
        "date" => $schedule->getDate(),
        "time" => $schedule->getTime(),
    ];
    $info[] = $scheduleInfo;
}

$postJSON = json_encode($info);
echo $postJSON;
?>