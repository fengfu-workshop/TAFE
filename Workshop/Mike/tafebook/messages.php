<?php

session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

$personId = $_SESSION['personId'];
$sql = "SELECT personId2 FROM friendship WHERE personId1 = $personId";
$friends = $dal->ExecuteQuery($sql);
if ( isset($_POST["new-message-submit"]) && !empty($_POST["new-message-content"]) ) {
    $messageDateTime = date("Y-m-d H:i:s");
    $message = safeSQL($_POST['new-message-content']);
    $personTo = safeSQL($_POST['new-message-to']);

    $sql = "INSERT INTO message (personFrom, personTo, messageDateTime, message) VALUES ($personId, $personTo, '$messageDateTime', '$message')";
    // out($sql);die();
    $dal->ExecuteNonQuery($sql);
    header("Location: messages.php");
}

// $sql = "SELECT personFrom, messageDateTime, message, firstName, lastName
//         FROM message, person
//         WHERE message.personFrom = person.personId AND message.personTo = $personId";
$sql = "SELECT personFrom, messageDateTime, message, firstName, lastName
        FROM message, person
        WHERE message.personFrom = person.personId AND message.personTo = $personId
        ORDER BY messageDateTime DESC";
$messages = $dal->ExecuteQuery($sql);
$totalMessages = count($messages);

?>
<!doctype html>
<html lang="en">
    <head>
        <title>Messages - tafebook - The social network for TAFE students</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <header>
            <div class="content-wrapper">
                <a id="header-logo" href="index.php"><img src="images/tafebook-logo-white-smallest.png" alt="tafebook logo" width="200" height="45" /></a>
                <nav>
                    <a href="about.php">About</a>
                    <a href="contact.php">Contact</a>
                    <a href="logout.php">Logout</a>
                </nav>
            </div>
        </header>
        <section id="main" class="content-wrapper">
            <section id="sidebar">
                <h2>Menu</h2>
                <ul id="sidebar-options">
                    <li><a href="news-feed.php">News feed</a></li>
                    <li><a href="friends.php">Friends</a></li>
                    <li><a class="active" href="messages.php">Messages</a></li>
                    <li><a href="profile.php">Profile</a></li>
                </ul>
            </section>
            <section id="content">

                <h1>Messages</h1>

                <section id="new-message">

                    <h2>Write a new message</h2>

                    <form action="" method="post" class="clearFix">
                        <label for="new-message-to">To:</label>
                        <select name="new-message-to" id="new-message-to">
                           <?php foreach($friends as $friend) {
                                $friendId = $friend['personId2'];
                                $sql = "SELECT personId, firstName, lastName FROM person WHERE personID = '$friendId'";
                                $person = $dal->ExecuteQuery($sql)[0];
                                $firstName = $person['firstName'];
                                $lastName = $person['lastName'];

                            ?>
                            <option value='<?php echo $friendId; ?>'><?php echo $firstName, ' ', $lastName; ?></option>
                            <?php } ?>
                        </select>
                        <label for="new-message-content">Message:</label>
                        <textarea name="new-message-content" id="new-message-content" cols="30" rows="10"></textarea>
                        <input type="submit" name="new-message-submit" value="Send" />
                    </form>
                </section>

                <section id="all-messages">

                    <h2>All messages</h2>
                    <?php if ($totalMessages) { ?>
                    <div class="message-list">
                        <?php foreach ($messages as $message) {
                            $firstName = safeHTML($message['firstName']);
                            $lastName = safeHTML($message['lastName']);
                            $myMessage = safeHTML($message['message']);
                            $personFrom = safeHTML($message['personFrom']);
                            $messageDateTime = date("m/d/y g:i A", strtotime($message['messageDateTime']));

                         ?>
                        <article>
                            <header>
                                <img class="person-image" src="images/person/no-image-40.jpg" alt="Profile photo" width="40" height="40" />
                                <span class="person-name"><a href="<?php echo 'profile.php?Id='.$personFrom ?>"><?php echo $firstName, ' ', $lastName ?></a></span>
                                <span class="message-date"><?php echo $messageDateTime; ?></span>
                            </header>
                            <p class="message-content"><?php echo $myMessage ?></p>
                        </article>
                        <?php } ?>
                    </div>
                    <?php } ?>

                </section>

            </section>
        </section>
        <footer>
            <div class="content-wrapper">
                <p>&copy; 2014 Mike Kirkwood-Smith</p>
            </div>
        </footer>
    </body>
</html>