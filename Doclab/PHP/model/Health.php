<?php
class Health{
    private $recordID;
    private $name;
    private $date;
    private $location;


public function __construct($recordID,$name,$date,$location){
    $this->recordID = $recordID;
    $this->name = $name;
    $this->date = $date;
    $this->location = $location;

}
public function getID(){
    return $this->recordID;
}
public function getName(){
    return $this->name;
}
public function getDate(){
    return $this->date;
}
public function getLocation(){
    return $this->location;
}
}
?>