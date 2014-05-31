<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

if ($_POST['comment'] == '') {
	$result['added'] = false;
	echo json_encode($result);
}
else if (isset($_POST['postId'])) {
	$postId = (int)($_POST['postId']);
	$personId = (int)($_POST['personId']);
	// $comment = safeSQL($_POST['comment']);

	// $sql = "INSERT INTO comment (postId, personId, comment) VALUES ($postId, $personId, '$comment')";
	// $result['added'] = $dal->ExecuteNonQuery($sql);

	$comment = removeScript($_POST['comment']);

   	$sql = "INSERT INTO comment (postId, personId, comment) VALUES (:postId, :personId, :comment)";
	$parameters = array (
        array (
            'name' => ':postId',
            'value' => $postId,
            'type' => PDO::PARAM_INT
        ),
        array (
            'name' => ':personId',
            'value' => $personId,
            'type' => PDO::PARAM_INT
        ),
        array (
            'name' => ':comment',
            'value' => $comment,
            'type' => PDO::PARAM_STR
        )
    );

    $result['added'] = $dal->ExecuteNonQuery($sql, $parameters);

	echo json_encode($result);
}

?>

