<!DOCTYPE html>
<html>
<head>
	<title>Get Enrolment</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="wrap">
	<header>
		<h1>Honsby TAFE Enrolment System</h1>
	</header>
	<div class="sub_header">
		<h2>IT Course Enrolment Confirmation</h2>
	</div>
	
	<?php 
		$errors = 0;
		$output = "";
		if (empty($_POST["Course"])) {
			$output .= "<li>". "Please select a course". "</li>";
			$errors++;
		}
		if (empty($_POST["FirstName"]) or empty($_POST["LastName"])) {
			$output .= "<li>". "Please enter a first name and last name". "</li>";
			$errors++;
		}
		if (empty($_POST["Street"]) or empty($_POST["Suburb"]) or empty($_POST["PostCode"])) {
			$output .= "<li>". "Please enter a street. suburb and postcode". "</li>";
			$errors++;
		}
		if (empty($_POST["Gender"])) {
			$output .= "<li>". "Please select a gender". "</li>";
			$errors++;
		}
		if (empty($_POST["BirthDate"])) {
			$output .= "<li>". "Please enter a valid date of birth". "</li>";
			$errors++;
		}
		if (empty($_POST["State"])) {
			$output .= "<li>". "Please select a State". "</li>";
			$errors++;
		}
	?>

	<?php if ($errors) {?>

		<ul class="error">
			<?php echo $output; ?>
		</ul>

		<a href="index.php"> Go back to the enrolment form </a>

	<?php } else { ?>

		Hi <?php echo $_POST["LastName"] ?>, <?php echo $_POST["FirstName"] ?> <?php echo substr($_POST["MiddleName"], 0, 1) ?>
		<br /><br />
		You are a <?php echo date("Y") - date_format( date_create($_POST["BirthDate"]) , "Y") ?> years old <?php echo $_POST["Gender"] ?> who has applied to do a course at Hornsby TAFE. The 
		<?php echo $_POST["Course"] ?> is a fantastic course that we think you will enjoy greatly.
		<br /><br />
		You have marked that you are <?php if (!isset($_POST["Resident"])) echo "not"; ?> an Australian resident.
		<br /><br />
		<?php echo isset($_POST["Disability"]) ? "Your disability support contact is John Smith. <br /><br />" : "" ?>

		All TAFE mail will be sent to:
		<br /><br />
		<?php echo $_POST["Street"] ?>
		<br />
		<?php echo $_POST["Suburb"] . " " .  $_POST["State"] . " " . $_POST["PostCode"] ?>
		<br /><br /><br />
		Thank you for applying to study at Hornsby TAFE.
		<br /><br />
		Your Teachers

	<?php } ?>

</div>
</body>
</html>