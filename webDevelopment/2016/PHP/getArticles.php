<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>View the years</title>
</head>
<body>
<h1>Years</h1>
<hr/>
<p>Select a year to view of list of letters from that year</p>
<ul>
<?php
    require_once("config.php");
    $contents = REST_PATH . "/db/queries/articleDates.xql";
    $result = file_get_contents($contents);
    echo $result;
?>
</ul>
</body>
</html>
