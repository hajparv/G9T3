<?php
require_once 'common.php';
class ScheduleDAO{
    public function getAll(){
        $connMgr = new ConnectionManager;
        $conn = $connMgr->connect();
        $sql = "SELECT * FROM schedule.schedule;";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $schedules = [];
        while ($row = $stmt->fetch()){
            $schedules[] = 
            new Schedule(
                $row['scheduleID'],
                $row['scheduleName'],
                $row['scheduleDescription'],
                $row['date'],
                $row['time']
            );
        }
        $stmt = null;
        $conn = null;
        return $schedules;
    }

    public function get($scheduleID){
        $connMgr = new ConnectionManager();
        $conn = $connMgr->connect();
        $sql = "SELECT * FROM schedule WHERE scheduleID = :scheduleID";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam("scheduleID",$scheduleID,PDO::PARAM_INT);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $schedule_object = null;
        if ($row = $stmt->fetch()){
            $schedule_object = 
            new Schedule(
                $row['scheduleID'],
                $row['scheduleName'],
                $row['scheduleDescription'],
                $row['date'],
                $row['time']

            );
        }
        $stmt = null;
        $conn = null;
        return $schedule_object;
        
    }

}
?>