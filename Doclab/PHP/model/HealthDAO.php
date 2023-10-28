<?php
require_once 'common.php';
class HealthDAO{
    public function getAll(){
        $connMgr = new ConnectionManager();
        $conn = $connMgr->connect();
        $sql = "SELECT * FROM healthrecord.healthrecord;
        ";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $health = [];
        while ($row = $stmt->fetch()) {
            $health[] = 
            new Health(
                $row['recordID'],
                $row['name'],
                $row['date'],
                $row['location']
            );
        }
        $stmt = null;
        $conn = null;
        return $health;
    }

    public function get($recordID)
{
    // STEP 1
    $connMgr = new ConnectionManager();
    $conn = $connMgr->connect();

    // STEP 2
    $sql = "SELECT * FROM healthrecord WHERE recordID = :recordID";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':recordID', $recordID, PDO::PARAM_INT);

    // STEP 3
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);

    // STEP 4
    $health_object = null; // Change to null initially
    if ($row = $stmt->fetch()) {
        $health_object =
            new Health(
                $row['recordID'],
                $row['name'],
                $row['date'],
                $row['location']
            );
    }

    // STEP 5
    $stmt = null;
    $conn = null;

    // STEP 6
    return $health_object;
}

}
?>