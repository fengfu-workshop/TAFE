<?php
session_start();
if (!isset($_SESSION['personId'])) header("Location: index.php");
require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');
$dal = new DAL();
$errors = array();

$personId = $_SESSION['personId'];
if ( isset($_POST["new-post-submit"]) && !empty($_POST['new-post-content']) ) {
    $postDateTime = date("Y-m-d H:i:s");
    $post = safeSQL($_POST['new-post-content']);

    $sql = "INSERT INTO post (personId, postDateTime, post) VALUES ('$personId', '$postDateTime', '$post')";
    // out($sql);die();
    $dal->ExecuteNonQuery($sql);
    $_SESSION['Logined'] = true;
    header("Location: news-feed.php");
}

// $sql = "SELECT postId, personId, postDateTime, post FROM post WHERE personId = '$personId'";
$sql = "SELECT postId, personId, postDateTime, post FROM post ORDER BY postDateTime DESC LIMIT 20";
$posts = $dal->ExecuteQuery($sql);

?>
<!doctype html>
<html lang="en">
    <head>
        <title>News Feed - tafebook - The social network for TAFE students</title>
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
                    <li><a class="active" href="news-feed.php">News feed</a></li>
                    <li><a href="friends.php">Friends</a></li>
                    <li><a href="messages.php">Messages</a></li>
                    <li><a href="profile.php">Profile</a></li>
                </ul>
            </section>
            <section id="content">

                <h1>News Feed</h1>

                <section id="new-post" class="new-post">

                    <h2>Add a post</h2>

                    <form action="" method="post" class="clearFix">
                        <textarea name="new-post-content" id="new-post-content" cols="30" rows="10"></textarea>
                        <input type="submit" name="new-post-submit" value="Send" />
                    </form>
                </section>

                <section id="lastest-posts">

                    <h2>Latest posts</h2>

                    <div class="post-list">
                        <?php foreach($posts as $post) {
                            $personId = $post['personId'];
                            $sql = "SELECT firstName, lastName FROM person WHERE personId = '$personId'";
                            $person = $dal->ExecuteQuery($sql)[0];
                            // out_r($person);
                            $firstName = $person['firstName'];
                            $lastName = $person['lastName'];
                            $postDate = date("m/d/y g:i A", strtotime($post['postDateTime']));
                            $postId = $post['postId'];
                            $sql = "SELECT personId, commentDateTime, comment FROM comment WHERE postId = '$postId' ORDER BY commentDateTime DESC";
                            $comments = $dal->ExecuteQuery($sql);
                            $sql = "SELECT count(*) FROM postlike WHERE postId = '$postId'";
                            $totalLikes = $dal->ExecuteScalar($sql);
                        ?>
                        <article>
                            <header>
                                <img class="person-image" src="images/person/no-image-40.jpg" alt="Profile photo" width="40" height="40" />
                                <span class="person-name"><a href="<?php echo 'profile.php?Id='.$personId; ?>"><?php echo $firstName, " ", $lastName ?></a></span>
                                <span class="post-date"><?php echo $postDate; ?></span>
                            </header>
                            <p class="post-content"><?php echo safeHTML($post['post']) ?></p>
                            <footer>
                                <span class="post-stats"><span class='total-likes'><?php echo $totalLikes; ?></span> likes</span>
                                <a class="like" href="<?php echo 'postlike.php?personId='.$_SESSION['personId'].'&postId='.$postId ?>">Like</a>
                                <a class="comment" href="">Comment</a>
                                <input type="hidden" name="personId" value="<?php echo $_SESSION['personId'];?>" />
                                <input type="hidden" name="postId" value="<?php echo $postId;?>" />
                            </footer>
                            <?php if (count($comments)) { ?>

                            <div class="post-comment-list">
                                <?php  foreach ($comments as $comment) {
                                    $commentDateTime = date("m/d/y g:i A", strtotime($comment['commentDateTime']));
                                    $personId = safeHTML($comment['personId']);
                                    $sql = "SELECT firstName, lastName FROM person WHERE personId = '$personId'";
                                    $person = $dal->ExecuteQuery($sql)[0];
                                ?>
                                <article>
                                    <img class="person-image" src="images/person/no-image-30.jpg" alt="Profile photo" width="30" height="30" />
                                    <span class="person-name"><a href=""><?php echo $person['firstName'].' '.$person['lastName'] ?></a></span>
                                    <span class="post-date"><?php echo $commentDateTime; ?></span>
                                    <!-- <p class="post-content"><?php echo safeHTML($comment['comment']); ?></p> -->
                                    <p class="post-content"><?php echo $comment['comment']; ?></p>
                                </article>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        </article>
                        <?php } ?>

                    </div>

                </section>

            </section>
        </section>
        <footer>
            <div class="content-wrapper">
                <p>&copy; 2014 Mike Kirkwood-Smith</p>
            </div>
        </footer>
    </body>

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/improvement.js"></script>
</html>