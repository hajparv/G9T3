<?php

require_once 'common.php';
$dao = new RecordDAO();
$records = $dao->getAll(); // Get an Indexed Array of Post objects

$information = [];
foreach( $records as $record ) {
    
    $information["appointmentID"] = $record->getID();
    $information["clinicName"] = $record->getClinicName();
    $information["nric"] = $record->getNric();
    $information["mobile"] = $record->getMobile();
    $information["name"] = $record->getName();
    $information["dob"] = $record->getBirthdate();
    $information["address"] = $record->getAddress();
    $information["datetime"] = $record->getAppointmentDate();
    $information["vaccinationStatus"] = $record->getVaccinationStatus();
    $information[] = $information;
}
var_dump($information);
// make posts into json and return json data
$postJSON = json_encode($information);
echo $postJSON;
?>