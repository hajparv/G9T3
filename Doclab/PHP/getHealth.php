<?php
require_once 'common.php';

$dao = new HealthDAO();
$schedules = $dao->getAll();
$items = [];

foreach ($schedules as $schedule) {
    $item = [];
    $item["recordID"] = $schedule->getID();
    $item["name"] = $schedule->getName();
    $item["record_date"] = $schedule->getDate();
    $item["location"] = $schedule->getLocation();
    $items[] = $item;
}

?>
