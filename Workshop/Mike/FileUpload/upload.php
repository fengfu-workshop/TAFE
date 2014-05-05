<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<title>Upload Files</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="wrapper">
		<?php $_SESSION["active"] = "upload" ?>
		<?php include 'inc/header.php'; ?>
		<div class="middle clear_fix">
			<?php include 'inc/nav.php'; ?>

			<section> 
           		<h1>Upload Files</h1>

                <p>Below you can upload your files to either the "project" or "exercises" directories.</p>

                
                <form id="c" name="uploadFiles" action="uploader.php" method="post" enctype="multipart/form-data">
                	<div class="b">
                    	<label for="directory">Choose a directory:</label>
                        <select id="directory" name="directory">
                            <option value="project">project</option><option value="exercises">exercises</option>                        </select>
                    </div>
                	<div class="b">
                    	<label for="file">Choose a file:</label>
                        <input id="file" name="file" type="file" />
                    </div>
                	<div class="c">
                        <input id="submit" type="submit" value="Upload File" />
                    </div>
                </form>

			</section>

		</div>
		<?php include 'inc/footer.php'; ?>

	</div>
</body>
</html>