<?php

class Router {

	public static function routing($request = 'home') {
		// $request = filter_var($request, FILTER_SANITIZE_URL);
		$parts = explode('/', $request);

		while (count($parts) && ($parts[0] == SITE_PREFIX || $parts[0] == "")) array_shift($parts);
		//while (count($parts) && ($parts[0] == "")) array_shift($parts);
		$controller = ($c = array_shift($parts))? $c: 'home';
		$method = ($c = array_shift($parts))? $c: 'index';
		$args = (isset($parts[0])) ? $parts : array();

		$controllerFile = SITE_DIR.CONTROLLER_DIR.$controller.'.class.php';
		// out($controllerFile); die();
		$controller = ucfirst($controller) . 'Controller';

		if (is_readable($controllerFile)) {
			require_once $controllerFile;

			$controller = new $controller;
			$method = (is_callable(array($controller,$method))) ? $method : 'index';

			if(empty($args)) {
				call_user_func(array($controller, $method));
			}
			else {
				call_user_func_array(array($controller, $method), $args);
			}
			return;
		}

		pageNotFound();
	}
}

class ViewData {

	private static $instance;
	private $buffer;
	private function __construct() {}

	public static function getInstance() {

		if (!self::$instance instanceof self) {
			self::$instance = new ViewData;
		}
		return self::$instance;
	}

	public function __set($key, $val) {
		$this->buffer[$key] = $val;
	}

	public function __get($key){
		if(isset($this->buffer[$key])) {
			return $this->buffer[$key];
		}
		return false;
	}

	public function getViewData() {
		return $this->buffer;
	}

}

abstract class Controller {

	protected $viewData;
	private   $viewBag;

	public function __construct() {
		$this->viewData = ViewData::getInstance();
	}

	abstract public function index();

	private function injectViewData($template) {
		$viewContent = is_readable($template) ? file_get_contents($template) : "";

		if (isset($this->viewBag)) {
			foreach ($this->viewBag as $key => $value) {
				if (! (substr($key, 0, 1) =='_' && substr($key, strlen($key)-1, 1) == '_') )
					$viewContent = str_replace(TEMPLATE_OPEN.$key.TEMPLATE_CLOSE, $value, $viewContent);
			}
		}
		return $viewContent;
	}

	private function preparePHP($viewFile) {
		if (isset($this->viewBag)) {
			extract($this->viewBag);
		}
		if (is_readable($viewFile)) {
			ob_start();
		    include $viewFile;
		    return ob_get_clean();
		}
		else return "";
	}

	private function prepareHTML($viewFile, $layout = false) {
		if (isset($this->viewBag)) {
			extract($this->viewBag);
		}
		$htmlFile = $layout ? SITE_DIR."lib/views/empty.view.html" : "lib/views/view_not_found.view.html";
		return is_readable($viewFile) ? $this->injectViewData($viewFile) : $this->injectViewData($htmlFile);
	}

	private function renderLayout($controller) {

		// $viewBag = $this->viewData->getViewData();
		if (isset($this->viewBag)) {
			extract($this->viewBag);
		}
		if ($this->viewData->_layout_ != "") {
			$_layout_ = $this->viewData->_layout_;
			$ext = strtolower(pathinfo($_layout_, PATHINFO_EXTENSION));
			$_layout_ = SITE_DIR.$_layout_;
			return ($ext == 'php') ? $this->preparePHP($_layout_) : $this->prepareHTML($_layout_, true);
		}

		$tplFile = SITE_DIR.VIEW_DIR.$controller.DIRECTORY_SEPARATOR.'layout.view.php';
		if (is_readable($tplFile)) {
			return $this->preparePHP($tplFile);
		}
		else {
			$tplFile = SITE_DIR.VIEW_DIR.'layout.view.php';
			if (is_readable($tplFile)) {
				return $this->preparePHP($tplFile);
			}
			else {
				$tplFile = SITE_DIR.VIEW_DIR.$controller.DIRECTORY_SEPARATOR.'layout.view.html';
				if (is_readable($tplFile)) {
					return $this->injectViewData($tplFile);
				}
				else {
					$tplFile = SITE_DIR.VIEW_DIR.'layout.view.html';
					if (is_readable($tplFile)) {
						return $this->injectViewData($tplFile);
					}
				}
			}
		}
	}

	private function renderPartial($controller, $view) {
		if ($this->viewData->_partial_view_ != "") {
			$_partial_view_ = $this->viewData->_partial_view_;
			$ext = strtolower(pathinfo($_partial_view_, PATHINFO_EXTENSION));
			$_partial_view_ = SITE_DIR.$_partial_view_;
			return ($ext == 'php') ? $this->preparePHP($_partial_view_) : $this->prepareHTML($_partial_view_);
		}
		$viewFile = SITE_DIR.VIEW_DIR.$controller.DIRECTORY_SEPARATOR.$view.'.view.php';
		if (is_readable($viewFile)) {
			return $this->preparePHP($viewFile);
		}
		else {
			$viewFile = SITE_DIR.VIEW_DIR.$controller.DIRECTORY_SEPARATOR.$view.'.view.html';
			return $this->prepareHTML($viewFile);
		}
	}

	private function render($controller, $view) {
		//$this->viewData->_ROOT_ = "/".SITE_PREFIX;
		// $this->viewData->_ROOT_ = "";
		if ($this->viewData->_partial_view_ != "" && $this->viewData->_partial_view_[0] == '/') {
			$this->viewData->_partial_view_ = stbstr($this->viewData->_partial_view_, 1);
		}

		$tpl = $this->renderLayout($controller);
		$viewContent = $this->renderPartial($controller, $view);
		$result = str_replace(TEMPLATE_BODY_OPEN."body".TEMPLATE_BODY_CLOSE, $viewContent, $tpl);
		echo $result;
	}

	protected function callView($extension=array()) {
		if (isset($extension)) {
			foreach ($extension as $key => $value) {
				$this->viewData->$key = $value;
			}
		}
		$this->viewBag = $this->viewData->getViewData();
		$callers = debug_backtrace();
		$view = $callers[1]['function'];
		$controller = $callers[1]['class'];
		$controller = str_replace("Controller", "", $controller);
		$viewFile = SITE_DIR.VIEW_DIR.$controller.DIRECTORY_SEPARATOR.$view.'.view';

		$this->render($controller, $view);

	}
}

class Database {

}

class Table {

}

?>