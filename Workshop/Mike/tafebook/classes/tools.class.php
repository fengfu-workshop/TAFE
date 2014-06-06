<?php
	const DEVELOPMENT = true;

	function out($str) {
		if (is_array($str) || is_object($str)) {
			echo '<pre>', print_r($str), '</pre> <br />';
		}
		else {
			echo $str . '<br />';
		}
	}

	function safeHTML($str) {
		return htmlentities(trim($str));
	}

	function safeSQL($str) {
		return addslashes($str);
		//return addcslashes(mysqli_real_escape_string($str), "%");
	}

	function gotoPage($page) {
		header("Location: " . $page);
	}

	function cryptPassword($password) {
		return crypt($password, 'put salt here');
		// $options = [
		//     'cost' => 12,
		//     'salt' => mcrypt_create_iv(22, MCRYPT_DEV_URANDOM),
		// ];
		// return password_hash($password, PASSWORD_BCRYPT, $options);
	}

	function removeScript($html) {
		$doc = new DOMDocument();
		// IBXML_HTML_NOIMPLIED turns off the automatic adding of implied html/body elements
		// LIBXML_HTML_NODEFDTD prevents a default doctype being added when one is not found.
		if (strpos($html,'<') == false) {
		    return $html;
		}
		$doc->loadHTML($html, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
		$script_tags = $doc->getElementsByTagName('script');
		$length = $script_tags->length;
		for ($i = 0; $i < $length; $i++) {
		  $script_tags->item($i)->parentNode->removeChild($script_tags->item($i));
		}
		// $result = $doc->saveHT, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTDML();
		// $result = preg_replace('~<(?:!DOCTYPE|/?(?:html|head|body))[^>]*>\s*~i', '', $result);
		// return $result;

		return $doc->saveHTML();
	}

	function displayErrors($errors) {
		echo "<div class = 'error'> <ul>";
		foreach ($errors as $error) {
			echo "<li>$error</li>";
		}
		echo "</ul></div>";

	}
 ?>