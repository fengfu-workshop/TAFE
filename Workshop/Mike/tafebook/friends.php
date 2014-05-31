<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

$personId = $_SESSION['personId'];
//$sql = "SELECT FROM friendship WHERE personId1 = '$personId' or personId2 = '$personId'";
$sql = "SELECT personId1, personId2 FROM friendship WHERE personId1 = $personId";
$friends = $dal->ExecuteQuery($sql);
$totalFriends = count($friends);

?>
<!doctype html>
<html lang="en">
    <head>
        <title>Friends - tafebook - The social network for TAFE students</title>
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
                    <li><a class="active" href="friends.php">Friends</a></li>
                    <li><a href="messages.php">Messages</a></li>
                    <li><a href="profile.php">Profile</a></li>
                </ul>
            </section>
            <section id="content">

                <h1>Friends</h1>

                <p>You currently have <strong><?php echo $totalFriends ? $totalFriends : 'no'; ?></strong> "friends"</p>

                <?php if ($totalFriends) { ?>
                <section id="friends">
                    <div class="person-list">
                        <?php foreach($friends as $friend) {
                            $friendId = $friend['personId2'];
                            $sql = "SELECT firstName, lastName FROM person WHERE personId = $friendId";
                            $person = $dal->ExecuteQuery($sql)[0];
                        ?>
                        <article>
                            <a href="<?php echo 'profile.php?Id='.$friendId; ?>">
                                <img class="person-image" src="images/person/no-image-100.jpg" alt="Profile photo" width="70" height="70" />
                                <span class="person-name"><?php echo $person['firstName'], ' ', $person['lastName'] ?></span>
                            </a>
                        </article>
                        <?php } ?>
                    </div>
                </section>
                <?php } ?>

            </section>
        </section>
        <footer>
            <div class="content-wrapper">
                <p>&copy; 2014 Mike Kirkwood-Smith</p>
            </div>
        </footer>
    </body>
</html>