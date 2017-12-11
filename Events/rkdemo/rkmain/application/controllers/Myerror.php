<?php
class myerror extends CI_Controller{
	function __construct(){
		parent::__construct();
	}
	
	function index(){
		
		$value=array(
			'errorCode'=>1,
			'msg'=>'404 Page Not Found!!!'
		);
		
		echo json_encode($value);
	}
	
	
}