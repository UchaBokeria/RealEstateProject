<?php 
    include_once "./vendor/AutoLoader.php";
    include_once "./vendor/Database.php";
    include_once "./Configs/SQL.php";

    // display errors
    ini_set("display_errors", true);
    error_reporting(E_ERROR);

    if(!isset($_REQUEST["route"]) || !isset($_REQUEST["act"])) {
        echo " <br> !!!!! WRONG ROUTE OR ACT !!!!!<br>";
    }
    else {
        $className = $_REQUEST["route"];
        include "App".DIRECTORY_SEPARATOR.$className.DIRECTORY_SEPARATOR.$className."Class.php";
        
        $class = $_REQUEST["route"];
        $method = $_REQUEST["act"];

        $newRequest = new $class();
        $data = $newRequest->$method();
        echo json_encode($data);
    }