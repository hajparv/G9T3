<?php
require_once 'common.php';
$dao = new RecordDAO();
$records = $dao->getAll();

?>
<html>

<body>
    <?php
    echo "
        <table border='1'>
            <tr>
                <th>AppointmentID</th>
                <th>Clinic Name</th>
                <th>NRIC</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Date Of Birth</th>
                <th>Appointment Date</th>
                <th>Vaccination Status</th>
            </tr>
    ";

    foreach ($records as $record) {
        echo "
            <tr>
                <td>
                    {$record->getID()}
                </td>
                <td>
                    {$record->getClinicName()}
                </td>
                <td>
                    {$record->getNric()}
                </td>
                <td>
                    {$record->getMobile()}
                </td>
                <td>
                    {$record->getAddress()}
                </td>
                <td>
                    {$record->getBirthdate()}
                </td>
                <td>
                    {$record->getAppointmentDate()}
                </td>
                <td>
                {$record->getVaccinationStatus()}
                </td>
                
            </tr>
        ";
    }
    ?>
</body>

</html>