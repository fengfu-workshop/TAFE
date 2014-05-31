<?php
	ini_set('session.cookie_httponly',1);
	session_start();

	// define('SITE_ROOT', realpath(dirname(__FILE__)));
	define('SITE_DIR', realpath(dirname(__FILE__)).DIRECTORY_SEPARATOR);

	$_SESSION["userName"] = "ForTestOnly";
	//setcookie("name", "value", NULL, NULL, NULL, NULL, TRUE);
	$targetPage = isset($_SESSION["userName"]) ? $_SERVER["REQUEST_URI"] : "/home";
	$_SESSION = array();
	// $_SESSION["userName"] = null;


	require_once(SITE_DIR.'config/config.php');
	require_once(SITE_DIR.'lib/tools.php');
	require_once(SITE_DIR.'lib/base.php');

	Router::routing($targetPage);

 ?>