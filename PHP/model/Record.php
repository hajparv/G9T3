<?php
class Record {
    private $appointmentID;
    private $clinicName;
    private $nric;
    private $mobile;
    private $name;
    private $address;
    private $birthdate;
    private $appointmentDate;
    private $vaccinationStatus;

    public function __construct($appointmentID,$clinicName,$nric,$mobile,$name,$address,$birthdate,$appointmentDate,$vaccinationStatus)
    {
        $this->appointmentID = $appointmentID;
        $this->clinicName = $clinicName;
        $this->nric = $nric;
        $this->mobile = $mobile;
        $this->name = $name;
        $this->address = $address;
        $this->birthdate = $birthdate;
        $this->appointmentDate = $appointmentDate;
        $this->vaccinationStatus = $vaccinationStatus;

    }

    public function getID(){
        return $this->appointmentID;
    }
    public function getClinicName(){
        return $this->clinicName;
    }
    public function getNric(){
        return $this->nric;
    }
    public function getMobile(){
        return $this->mobile;
    }
    public function getName(){
        return $this->name;
    }
    public function getAddress(){
        return $this->address;
    }
    public function getBirthdate(){
        return $this->birthdate;
    }
    public function getAppointmentDate(){
        return $this->appointmentDate;
    }
    public function getVaccinationStatus(){
        return $this->vaccinationStatus;
    }


}
?>