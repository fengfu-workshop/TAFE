<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

if (isset($_POST['postId'])) {
	$postId = (int)($_POST['postId']);
	$personId = (int)($_POST['personId']);

	$sql = "INSERT INTO postlike (postId, personId) VALUES ($postId, $personId)";
	$result['added'] = $dal->ExecuteNonQuery($sql);
	echo json_encode($result);
}
else if (isset($_GET['postId'])) {
	$postId = (int)($_GET['postId']);
	$personId = (int)($_GET['personId']);

	$sql = "INSERT INTO postlike (postId, personId) VALUES ($postId, $personId)";
	$dal->ExecuteNonQuery($sql);

  	header("Location: news-feed.php");
}

?>

