<?php
    class Schedule {
        private $scheduleID;
        private $scheduleName;
        private $scheduleDescription;
        private $date;
        private $time;
    

    public function __construct($scheduleID,$scheduleName,$scheduleDescription,$date,$time){
        $this->scheduleID = $scheduleID;
        $this->scheduleName = $scheduleName;
        $this->scheduleDescription = $scheduleDescription;
        $this->date = $date;
        $this->time =$time;

    }
    public function getID(){
        return $this->scheduleID;
    }
    public function getScheuleName(){
        return $this->scheduleName;
    }
    public function getScheduleDescription(){
        return $this->scheduleDescription;
    }
    public function getDate(){
        return $this->date;
    }
    public function getTime(){
        return $this->time;
    }

}
?>