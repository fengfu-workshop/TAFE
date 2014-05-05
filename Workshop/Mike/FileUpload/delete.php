<?php 

	unlink($_GET["filepath"]);
	header( 'Location: /FileUpload/view.php' ) ;

?>