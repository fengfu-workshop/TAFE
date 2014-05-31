<?php

class AdminController extends Controller {

	public function __construct() {
		parent::__construct();
	}

	public function index() {
		if ($_SERVER['REQUEST_METHOD'] == 'GET') {
			$this->callView();
		}
		else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$this->viewData->email = $_POST['email'];
			$this->viewData->password = $_POST['password'];
			$this->callView(array(
				"_partial_view_" => "views/admin/indexPost.view.html"
			));
		}

	}

	public function indexPost() {
		$this->viewData->email = $_POST['email'];
		$this->viewData->password = $_POST['password'];
		$this->callView();
	}

}

?>