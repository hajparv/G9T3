<?php

//action.php

$connect = new PDO("mysql:host=localhost;dbname=healthrecord", "root", "root");
$received_data = json_decode(file_get_contents("php://input"));
$data = array();
if($received_data->action == 'fetchall')
{
 $query = "
 SELECT * FROM record
 ORDER BY recordID 
 ";
 $statement = $connect->prepare($query);
 $statement->execute();
 while($row = $statement->fetch(PDO::FETCH_ASSOC))
 {
  $data[] = $row;
 }
 echo json_encode($data);
}
if($received_data->action == 'insert')
{
 $data = array(
  ':recordID' => $received_data->recordID,
  ':name' => $received_data->name
 );

 $query = "
 INSERT INTO record 
 (name, date) 
 VALUES (:name, :date)
 ";

 $statement = $connect->prepare($query);

 $statement->execute($data);

 $output = array(
  'message' => 'Data Inserted'
 );

 echo json_encode($output);
}
if($received_data->action == 'fetchSingle')
{
 $query = "
 SELECT * FROM record 
 WHERE id = '".$received_data->recordID."'
 ";

 $statement = $connect->prepare($query);

 $statement->execute();

 $result = $statement->fetchAll();

 foreach($result as $row)
 {
  $data['recordID'] = $row['recordID'];
  $data['name'] = $row['name'];
  $data['date'] = $row['date'];
  $data['record_location'] = $row['record_location'];
 }

 echo json_encode($data);
}



?>