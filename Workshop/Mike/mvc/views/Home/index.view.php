<?php

echo "That's from index view" . "<br />";
echo $FirstName . " " . $LastName . "<br />";
echo 'Message: ' . $message . "<br />";
echo 'Message Id: ' . $messageId . "<br />";
echo urldecode($messageId). "<br />";

?>

<a href="/home/post">Post</a>