<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

$postId = (int)($_POST['postId']);
$personId = (int)($_POST['personId']);

$sql = "INSERT INTO postlike (postId, personId) VALUES ($postId, $personId)";
$result['added'] = $dal->ExecuteNonQuery($sql);
echo json_encode($result);

// header("Location: news-feed.php");

?>

