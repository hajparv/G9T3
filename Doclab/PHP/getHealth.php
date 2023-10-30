<?php
require_once 'common.php';

$sdao = new HealthDAO();
$schedules = $sdao->getAll();
$items = [];

foreach ($schedules as $schedule) {
    $item = [];
    $item["recordID"] = $schedule->getID();
    $item["name"] = $schedule->getName();
    $item['date'] = $schedule->getDate();
    $item['location'] = $schedule->getLocation();
    $items[] = $item;
}

?>
