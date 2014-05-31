<?php
session_start();

$_SESSION = array();
header("Location: index.php");

/*
    require_once('classes/DAL.class.php');
    $dal = new DAL();

    $sql = "SELECT * FROM person WHERE personId = :personId";
    $parameters = array (
        array (
            'name' => ':personId',
            'value' => 2,
            'type' => PDO::PARAM_INT
        )
    );

    $result = $dal->ExecuteQuery($sql, $parameters);
    var_dump($result);
*/
?>

