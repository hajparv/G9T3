<?php
require_once 'common.php';
$dao = new RecordDAO();
$records = $dao->getAll();
var_dump($records)
?>
<html>
    <body>
        <?php
        var_dump($records);
        ?>
    </body>
</html>