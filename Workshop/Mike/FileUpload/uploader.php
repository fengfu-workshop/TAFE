<?php 

$allowedExts = array("htm", "html", "css", "js", "php", "png", "gif", "jpg", "jpeg", "swf");
$allowedTypes = array("image/png", "image/gif", "image/jpeg", "text/html", "text/css", 
					  "application/javascript", 'application/x-shockwave-flash');

$filename = $_FILES['file']['name'];
$type = $_FILES["file"]["type"];
$ext = pathinfo($filename, PATHINFO_EXTENSION);	
if(in_array($ext, $allowedExts) && in_array($type, $allowedTypes)) {
	echo $_POST["directory"] . "<br/>";
	if ($_FILES["file"]["error"] > 0)  {
		echo "Error: " . $_FILES["file"]["error"] . "<br>";
	}
	else {
		$filename = "uploads/" . $_POST["directory"] . "/" . $filename;

		if (file_exists($filename)) {
			echo $_FILES["file"]["name"] . " already exists. ";
		}
		else {
			echo "Upload: " . $_FILES["file"]["name"] . "<br>";
			echo "Type: " . $_FILES["file"]["type"] . "<br>";
			echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";	
			echo "Stored in: " . $filename. " kB<br>";			
			move_uploaded_file($_FILES["file"]["tmp_name"],	$filename);
			// $fi = new finfo(FILEINFO_MIME, $filename);
			// $mime_type = $fi->buffer(file_get_contents($filename));
			// echo "Mime-Type: " . $mime_type;
			// echo mime_content_type ( $filename )
			header( 'Location: /FileUpload/view.php' ) ;
		}
	}
}
else {
	echo 'File type not allowed';
}

?>