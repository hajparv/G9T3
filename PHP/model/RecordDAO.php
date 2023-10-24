<?php
require_once 'common.php';
class RecordDAO {
    public function getAll(){
        $connMgr = new ConnectionManager();
        $conn = $connMgr->connect();
        $sql = "SELECT * FROM appointment.appointment";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $records = [];
        while ($row = $stmt->fetch()){
            $records[] = 
            new Record (
                $row['appointmentID'],
                $row['clinicName'],
                $row['nric'],
                $row['mobile'],
                $row["name"],
                $row['address'],
                $row['dob'],
                $row['datetime'],
                $row['vaccinationStatus']

            );
        }
        $stmt = null;
        $conn = null;
        return $records;
     
    }

    public function get($appointmentId){
        // STEP 1
        $connMgr = new ConnectionManager();
        $conn = $connMgr->connect();

        // STEP 2
        $sql = "SELECT
                    *
                FROM post
                WHERE 
                    appointmentID = :appointmentID";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        // STEP 3
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);

        // STEP 4
        $appointment_object = null;
        if( $row = $stmt->fetch() ) {
            $post_object = 
                new Record(
                    $row['appointmentID'],
                $row['clinicName'],
                $row['nric'],
                $row['mobile'],
                $row["name"],
                $row['address'],
                $row['dob'],
                $row['datetime'],
                $row['vaccinationStatus']
                );
                    
        }

        // STEP 5
        $stmt = null;
        $conn = null;

        // STEP 6
        return $appointment_object;
    }
    

    
}
?>