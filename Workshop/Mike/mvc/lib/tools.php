<?php
	require_once(SITE_DIR.'config/config.php');

	function out($devStr, $liveStr="") {
		echo ((DEVELOPMENT) ? $devStr : $liveStr) . '<br />';
	}

	function out_r($devStr, $liveStr="") {
		echo '<pre>' . print_r((DEVELOPMENT) ? $devStr : $liveStr) . '</pre>' . '<br />';
	}

	function safeHTML($str) {
		return(htmlentities(trim($str)));
	}

	function gotoPage($page) {
		header("Location: " . $page);
	}

	function pageNotFound() {
		header("HTTP/1.0 404 Not Found");
		echo "<h1>404 Not Found</h1>";
	    echo "The page that you have requested could not be found.";
	}
 ?>