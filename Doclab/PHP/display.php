<?php
require_once 'common.php';

$sdao = new HealthDAO();
$schedules = $sdao->getAll();
var_dump($schedules);
?>
<html>

<body>
    <?php
    echo "
        <table border='1'>
            <tr>
                <th>recordID</th>
                <th>Name</th>
                <th>Date</th>
                <th>Location</th>
                
            </tr>
    ";

    foreach ($schedules as $schedule) {
        echo "
            <tr>
                <td>
                    {$schedule->getID()}
                </td>
                <td>
                    {$schedule->getName()}
                </td>
                <td>
                    {$schedule->getDate()}
                </td>
                <td>
                    {$schedule->getLocation()}
                </td>
            </tr>
        ";
    }
    ?>
</body>

</html>