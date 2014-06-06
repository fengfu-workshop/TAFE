<?php
session_start();
if (isset($_SESSION['personId'])) header("Location: news-feed.php");

require_once('classes/tools.class.php');
require_once('classes/DAL.class.php');

$dal = new DAL();
$errors = array();

if (isset($_POST["login-submit"])) {
    $email = strtolower(safeSQL($_POST['login-email']));
    $password = safeSQL($_POST['login-password']);
    $sql = "SELECT personId, password FROM person WHERE email = '$email'";
    $result = $dal->ExecuteQuery($sql);
    if ($result) {
        $result = $result[0];
        $realPassword = $result['password'];
        $match = ($realPassword == cryptPassword($password));
        if (!$match) $match = ($realPassword == $password);
        if ($match && !empty($password)) {
            $_SESSION['personId'] = $result['personId'];
            header("Location: news-feed.php");
        }
    }
    $errors[] = "Email and password not match";
}
else if (isset($_POST["register-submit"])) {
    $email = safeSQL($_POST['register-email']);
    $password = trim($_POST['register-password']);
    $password2 = trim($_POST['register-password2']);
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "Please enter a valid email address";
    if (empty($password)) $errors[] = "Please enter a password";
    if ($password != $password2) $errors[] = "Password doesn't match";
    if (!count($errors)) {
        $password = cryptPassword($password);
        $email = strtolower($email);
        $sql = "INSERT INTO person (email, password) VALUES ('$email', '$password')";
        $dal->ExecuteNonQuery($sql);
        $sql = "SELECT personID FROM person WHERE email = '$email'";
        $_SESSION['personId'] = $dal->ExecuteScalar($sql);
        header("Location: news-feed.php");
    }
}

?>
<!doctype html>
<html lang="en">
    <head>
        <title>tafebook - The social network for TAFE students</title>
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
                </nav>
            </div>
        </header>
        <section id="main" class="content-wrapper">
            <section id="content">

                <section id="welcome">
                    <p id="welcome-text">Welcome to</p>
                    <p id="welcome-logo"><img src="images/tafebook-logo-medium.png" alt="tafebook logo" width="700" height="156" /></p>
                    <h1>The <em>social network</em><br />for <em>TAFE</em> students</h1>
                </section>

                <section id="login-register">
                    <?php if (count($errors)) displayErrors($errors); ?>
                    <form id="login-form" class="login-form" action="index.php" method="post" class="clearFix">
                        <h2>Login</h2>
                        <fieldset>
                            <p>
                                <label for="login-email">Email:</label>
                                <input type="text" id="login-email" name="login-email" placeholder="Email" value='<?php echo $email ?>' maxlength="50" />
                            </p>
                            <p>
                                <label for="login-password">Password:</label>
                                <input type="password" id="login-password" name="login-password" placeholder="Password" maxlength="50" />
                            </p>
                            <p class="button-row">
                                <input type="submit" name="login-submit" value="Login" />
                            </p>
                        </fieldset>
                    </form>

                    <p class="line-through"><span>OR</span></p>

                    <form id="register-form" class="login-form" action="index.php" method="post" class="clearFix">
                        <h2>Register</h2>
                        <fieldset>
                            <p>
                                <label for="register-email">Email:</label>
                                <input type="text" id="register-email" name="register-email" placeholder="Email" value='<?php echo $email ?>' maxlength="50" />
                            </p>
                            <p>
                                <label for="register-password">Password:</label>
                                <input type="password" id="register-password" name="register-password" placeholder="Password" maxlength="50" />
                            </p>
                            <p>
                                <label for="register-password2">Re-enter:</label>
                                <input type="password" id="register-password2" name="register-password2" placeholder="Confirm password" maxlength="50" />
                            </p>
                            <p class="button-row">
                                <input type="submit" name="register-submit" value="Register" />
                            </p>
                        </fieldset>
                    </form>
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