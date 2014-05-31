<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();

$personId = isset($_GET['Id']) ? $_GET['Id'] : $_SESSION['personId'];
$sql = "SELECT email, firstName, lastName, email, about, gender FROM person WHERE personId = $personId";
$person = $dal->ExecuteQuery($sql);
if (count($person) < 1) header("Location: index.php");
$person    = $person[0];
$firstName = $person['firstName'];
$lastName  = $person['lastName'];
$email     = safeHTML($person['email']);;
$about     = $person['about'];
$gender    = $person['gender'];

?>
<!doctype html>
<html lang="en">
    <head>
        <title>Profile - tafebook - The social network for TAFE students</title>
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
                    <li><a href="messages.php">Messages</a></li>
                    <li><a class="active" href="profile.php">Profile</a></li>
                </ul>
            </section>
            <section id="content">

                <h1>Profile</h1>

                <section id="profile">

                    <h2>Information about the person...</h2>

                    <h3><?php echo $firstName, ' ', $lastName; ?></h3>
                    <p><?php echo $email; ?></p>
                    <p><?php echo ($gender=='M') ? 'male' : 'female' ?></p>
                    <p><?php echo $about; ?></p>

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