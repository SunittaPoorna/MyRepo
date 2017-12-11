<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class notifications extends CI_Controller{
	
    function __construct(){
            parent::__construct();
            $this->load->model("adminmodel","",true);
            if($this->session->userdata('rk_adminid')==null){ // Function to check Session is set or not	
                    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH'])=='xmlhttprequest')
                    {
                            $value=array(
                                    'session'=>'false'
                            );			
                            echo json_encode($value);
                            exit();
                    }else{
                            redirect('login');
                    }
            }
            $this->admin->nocache(); 
    }

    function index(){
        $uid=$this->session->userdata("rk_adminid");
        $data['title']="Raksha Kids Admin | Notification Details";
        
        $data['notificationsQ'] = $this->adminmodel->getNotifications("","","");
        
        $data['sidemenu']=$this->load->view("sidemenuview",$data,true);
        $data['content']=$this->load->view("notifications/notificationsview",$data,true);
        $this->load->view("headerbodyview",$data);
    }
    
    function addeditnotification(){
        
        $data['id'] = $this->input->get_post("id");
        
        $str = $this->load->view("notifications/addeditnotificationview",$data,true);
        
        $value = array(
            
            "str"=>$str
        );
        
        echo json_encode($value);
        
    }
    
    function save(){
        
        $data =  $_POST;
        
        $data['typeId'] = 1;
        
        $data['status'] =2;
        
        $data['sentDate'] = $this->admin->getCustomDate("%Y-%m-%d %h:%i:%s",  now());
        
        $result = $this->adminmodel->saveNotification($data);
        
        if($result>0){
            
            $this->send();
            
        }
        
        $value = array(
            
            "result" => $result
            
        );
        
        echo json_encode($value);
        
    }
    
    function send(){
        
        $notificationsQ = $this->adminmodel->getUnsendNotifications();
        
        $users = $this->adminmodel->getUsers(1);
        
        foreach ($notificationsQ->result() as $rowNotification){
            
            $notificationId = $rowNotification->notificationId;
            
            $heading = $rowNotification->heading;
            
            $imType = "NOTIFICATION";
            
            $url = substr_replace(base_url() ,"",-1);
            
            foreach ($users as $value) {
                
                $message = $heading." from ". $value['schoolName'];
                
                $ids[]= $value['deviceId'];
                
//                $payload = array(
//                    "sid"=>$value['studentId'],
//                    "imType"=>"NOTIFICATION",
//                    "type"=>"alert",
//                    "message" => $message
//                );
                
                $payload = array(
                "sid"=>$value['studentId'],
                "url"=>$url,
                "imType"=>$imType,
                "type"=>"alert",
                "message" => $message
                );

                $this->admin->send_notification($ids, $payload);
                
                unset($ids); 
                
            }
            
            $this->adminmodel->updateNotification($notificationId);  
            
        }
        
//        echo json_encode($users);
        
    }
    
    function test(){
        echo substr_replace(base_url() ,"",-1);
    }
    
    function testgcm(){
        
        $message=$this->input->get_post("message");
        
        $type = $this->input->get_post("type");
        
        $sid = 1;
        
        $ids = array($this->input->get_post("deviceId"));
        //$type = "alert";
        $payload = array(
            "sid"=>$sid,
            "imType"=>$type,
            "type"=>"alert",
            "message" => $message
        );
    
        echo json_encode($this->admin->send_notification($ids, $payload));
        
    }
        
        
}

