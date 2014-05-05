<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<title>View Files</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="wrapper">
		<?php $_SESSION["active"] = "view" ?>
		<?php include 'inc/header.php'; ?>
		<div class="middle clear_fix">
			<?php include 'inc/nav.php'; ?>

			<section> 
				<?php include 'inc/view_content.php'; ?>
			</section>

		</div>
		<?php include 'inc/footer.php'; ?>

	</div>
</body>
</html>