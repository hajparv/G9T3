<?php

require_once 'common.php';
$dao = new RecordDAO();
$schedules = $dao->getAll(); // Get an Indexed Array of Post objects

$info = [];
foreach ($schedules as $schedule){
    $info["scheduleID"] = $schedule->getID();
    $info["scheduleName"] = $schedule->getScheuleName();
    $info["scheduleDescription"] = $schedule->getScheduleDescription();
    $info["date"] = $schedule->getDate();
    $info["time"] = $schedule->getTime();
    $info[] = $info;
}
$postJSON = json_encode($info);
echo $postJSON;
?>