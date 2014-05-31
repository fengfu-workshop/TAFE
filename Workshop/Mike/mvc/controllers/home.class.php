<?php

class HomeController extends Controller {

	public function __construct() {
		parent::__construct();
	}

	public function index() {

		// gotoPage('/home/post');

		if ($_SERVER['REQUEST_METHOD'] == 'GET') {
			$args = func_get_args();
			$this->viewData->FirstName = safeHTML("   Tiger<script>alert('Tiger');</script>    ");
			$this->viewData->LastName = $_SERVER['REQUEST_METHOD'];
			$this->viewData->message = "It's my home.";
			$this->viewData->messageId = isset($args[0]) ? $args[0] : "not set";

			$this->callView(array(
				// "_layout_" => "default empty page",
				// "_layout_" => "/views/layout.view.html",
				// "_partial_view_" => "views/Home/post.view.html",
				"message" => safeHTML("@I'm from parameter list"),
				"title" => "<Home Page>"
			));
		}
		else if ($_SERVER['REQUEST_METHOD'] == 'POST') {

		}

	}

	public function post(/*argv*/) {

		// $argv == args[0], use $argv if there is only one parameter
		$args = func_get_args();
		$this->viewData->title = "Post Page";
		$this->viewData->FirstName = "Michael";
		$this->viewData->LastName = "Jordan";
		$this->viewData->message = "It's a great post.";
		$this->viewData->messageId = isset($args[0]) ? $args[0] : "not set";
		// $this->viewData->messageId = "<script>alert('Hello');</script>";

		$this->callView();
	}

}

?>