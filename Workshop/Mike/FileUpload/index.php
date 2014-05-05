<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<title>File Upload</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="wrapper">
		<?php $_SESSION["active"] = "home" ?>
		<?php include 'inc/header.php'; ?>
		<div class="middle clear_fix">
			<?php include 'inc/nav.php'; ?>

			<section>
				<h1>Home</h1>
                <p>Welcome to the 19019 Advanced PHP File Upload project!</p>
                <p>With this utility, you can upload files onto our PHP testing server from both TAFE and home. Once files are uploaded, you can view them and test them!</p>
                <p>Please use the main menu to the left to upload and view your files.</p>				
			</section>

		</div>
		<?php include 'inc/footer.php'; ?>

	</div>
</body>
</html>