<nav>
	<h2>Main Menu</h2>
	<ul>
		<li <?php echo "class=" . ($_SESSION["active"] == "home" ? "active" : "") ?> ><a href="index.php">Home</a></li>
		<li <?php echo "class=" . ($_SESSION["active"] == "view" ? "active" : "") ?> ><a href="view.php">View Files</a></li>
		<li <?php echo "class=" . ($_SESSION["active"] == "upload" ? "active" : "") ?> ><a href="upload.php">Upload Files</a></li>
	</ul>

</nav>