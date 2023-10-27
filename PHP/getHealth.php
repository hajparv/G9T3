<?php
require_once 'common.php';
$dao = new HealthDAO();
$records = $dao->getAll();
$information = [];
foreach( $records as $record ) {
    
    $information['recordID'] = $record->getID();
    $information['name'] = $record->getName();
    $information['date'] = $record->getDate();
    $information['location'] = $record->getLocation();
    $information[] = $information;
}
var_dump($information);
// make posts into json and return json data
$postJSON = json_encode($information);
echo $postJSON;

?>