<?php

/**
 * Events Class
 *
 * @package     Rakshakids
 * @subpackage  Admin
 * @category    Calender Events
 * @author      Rex,Nalini
 * @link        Https://www.rakshakids.com
 */

     

class Events extends CI_Controller{
	
    function __construct(){
        parent::__construct();
 //       $this->admin->nocache(); 
    }

    /**
     * Shows list of events in database
     *
     * @param       None
     * @return      View page 
     */
    function index()
    {

        $url = 'https://localhost:8080';

        $curl = curl_init();
 
         curl_setopt_array($curl, array(
         CURLOPT_URL => $url . "/events",
         CURLOPT_RETURNTRANSFER => true,
         CURLOPT_ENCODING => "",
         CURLOPT_MAXREDIRS => 10,
         CURLOPT_TIMEOUT => 30,
         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
         
         CURLOPT_HTTPHEADER => array(
           "accept: application/json",
           "cache-control: no-cache",
           "content-type: application/json"
         ),
        ));
        //print_r($url . "/events");exit;
        $response = curl_exec($curl);

        //print_r($response);exit;
        $err = curl_error($curl);
        //print_r($err );exit;
         
        curl_close($curl);
         
        if ($err) {
         echo "cURL Error #:" . $err;
        } else {
         echo $response;
        }
            //print_r($err);exit;
        $data['title']="Raksha Kids Admin | Event Details";
        
        //$data['sidemenu']=$this->load->view("sidemenuview",$data,true);
        $data['content']=$this->load->view("events/eventsview",$data,true);
        $this->load->view("headerbodyview",$data);
    }
}

