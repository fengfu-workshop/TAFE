<!DOCTYPE html>
<html>
<head>
	<title>Enrolment Form</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="wrap">

	<header>
		<h1>Honsby TAFE Enrolment System</h1>
	</header>
	<div class="sub_header">
		<h2>Enter your information</h2>
	</div>

	<?php if($_SERVER["REQUEST_METHOD"] == "POST") { ?>
	
		<!-- code moved to get_enrollment.php -->

	<?php } else { ?>

		<!-- <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="POST"> -->
		<form action="get_enrolment.php" method="POST">

			<fieldset>
				<legend>Course:</legend>
				<span>Course:</span>
				<select name="Course">
					<option value="Software Applications">Certificate III – Software Applications</option>
					<option value="Website Design">Certificate IV – Website Design</option>
					<option value="Programming">Certificate IV – Programming</option>
					<option value="Digital Media">Certificate IV – Digital Media</option>
					<option value="Website Development">Diploma – Website Development</option>
					<option value="Software Development">Diploma – Software Development</option>
				</select>
			</fieldset>

			<fieldset>
				<legend>Name:</legend>
				<span>First Name: </span>
				<input type="text" name="FirstName"> <br /> <br />
				<span>Middle Name: </span>
				<input type="text" name="MiddleName"> <br /> <br />
				<span>Last Name: </span>
				<input type="text" name="LastName">
			</fieldset>

			<fieldset>
				<legend>Other Personal Information:</legend>
				<span>Gender:</span>
				<input type="radio" name="Gender" value="male">M
				<input type="radio" name="Gender" value="female">F <br /> <br />
				<span>Date of Birth:</span>
				<input type="date" name="BirthDate">
			</fieldset>

			<fieldset>
				<legend>Address:</legend>
				<span>Street:</span>
				<input type="text" name="Street"> <br /> <br />
				<span>Suburb:</span>
				<input type="text" name="Suburb"> <br /> <br />
				<span>Postcode:</span>
				<input type="text" name="PostCode"> <br /> <br />
				<span>State:</span>
				<select name="State">
					<option value="ACT">ACT</option>
					<option value="NSW">NSW</option>
					<option value="NT">NT</option>
					<option value="QLD">QLD</option>
					<option value="SA">SA</option>
					<option value="TAS">TAS</option>
					<option value="VIC">VIC</option>
					<option value="WA">WA</option>
				</select>
			</fieldset>

			<fieldset>
				<legend>Others:</legend>
				<span>Australian Resident:</span>				
				<input type="checkbox" name="Resident" value="Yes"> <br /> <br />
				<span>Disability support required:</span>
				<input type="checkbox" name="Disability" value="Yes">
			</fieldset>

			<input class="button" type='submit' value="Process Enrolment">

		</form>

	<?php } ?>
</div>
</body>
</html>