<?php
class api extends CI_Controller{
    /*
     * Constructor
     */
    function __construct(){
        parent::__construct();
        $this->load->model("apimodel","",true);
        $this->date=$this->apilib->getCustomDate("%Y-%m-%d",now());
        $query=$this->apimodel->getacademic($this->date);
        if($query->num_rows()>0)
        {
            foreach($query->result() as $val)
            {
                $this->startDate=$val->startDate;
                $this->academicId=$val->academicId;
            }
        }
    }
    /*
     * Index
     */
     /**
     * Welcome json  
     *
     * @param       None
     * @return     View page
     */
    function index()
    {
        $value=array(
            'errorCode'=>0,
            'msg'=>'Welcome to Rakasha Kids API...'
        );
        echo json_encode($value);
    }
    /**
     * Sending Push Notification
     */
    public function send_notification($ids, $message) {

        // Set POST variables
        $url = 'https://android.googleapis.com/gcm/send';

        $fields = array(
            'registration_ids' => $ids,
            'data' => $message,
        );

        $googleapi=$this->config->item('GOOGLE_GCM_SERVER_API');
        $headers = array(
            'Authorization: key=' . $googleapi,
            'Content-Type: application/json'
        );
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

        // Execute post
        $result = curl_exec($ch);
        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }

        // Close connection
        curl_close($ch);
        return $result;
    }   
    
    function testURL(){
        
        echo str_replace("/rkapi/", "", base_url());
        
    }
 /*
     * save location
     */
    
        function saveLocation()
        {
        $staffId=  $this->input->get_post("staffId");
        $vehicleId=  $this->input->get_post("vehicleId");
        $travelType=  $this->input->get_post("travelType");
        $lat=  $this->input->get_post("lat");
        $lng=  $this->input->get_post("lng");
        $location=  $this->input->get_post("location");
        
        $data_location=array(
            "staffId"=>$staffId,
            "vehicleId"=>$vehicleId,
            "travelDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
            "travelType"=>$travelType,
            "lat"=>$lat,
            "lng"=>$lng,
            "location"=>$location,
            "status"=>1
        );
        $q=$this->apimodel->saveLocation($data_location);

        $travelDate = $this->apilib->getCustomDate("%Y-%m-%d",  now());

        //print_r($q1);exit;

        $result=$this->apimodel->getVehicleStudentLocation($staffId,$travelType);

        /*$travelTime=$this->apilib->getCustomDate("%H:%i:%s",  now());

         //print_r($travelTime);
         sleep(180);

         $travelTime=$this->apilib->getCustomDate("%H:%i:%s",  now());*/

          //print_r($travelTime);exit;

        
        $errorCode = "1";
        
        $msg = "Failed";

        $notification="";
        
        $imType = "VEHICLE";
        $url = str_replace("/rkapi/", "", base_url());
        $type="alert";
        if($q>0){

                $errorCode = "0";

                $msg = "Success";

                $message="";

                //$travelType =  "";
             foreach ($result->result() as $row) 
             { 
                $studentId = $row->studentId;

                $url = str_replace("/rkapi/", "", base_url());
                $imType="Vehicle";
                $type="alert";
                $userDetails = $this->apimodel->getUsers($studentId);

                foreach ($userDetails as  $rowUser) 
                {
                    
                    $studentName = $rowUser['studentName'];
                    $deviceType= $rowUser['deviceType'];
                    $deviceId = $rowUser['deviceId'];

                    $travelDate = $this->apilib->getCustomDate("%Y-%m-%d",  now());

                    $time = $this->apilib->getCustomDate("%h:%i %A",  now());

                    $test_query = $this->db->select('*')
                                    ->from('travel_details')->
                                    where(array('studentId'=> $studentId, 'travelDate'=>$travelDate, 'travelType'=>$travelType));
                        $this->stdtravel = $test_query->get()->result();

                    $query1 =  $this->apimodel->getLeavesData($studentId);//print_r($query1->result());exit;

                    if(empty($query1->result())){
                        //print_r("Hi");exit;

                        if($deviceId!="" && count($this->stdtravel)==0)/*&& $echo_time + $interval >= time())*/
                            {                    

                                $deviceIds[]=$deviceId;

                                //print_r();exit;

                                $time = $this->apilib->getCustomDate("%h:%i %A",  now());

                                if($location!="" ){

                                    $message = "Now ".$studentName ." bus location is ".$location;

                                }
                                
                                if($deviceType == "iOS" && $deviceId!="nil"){
         
                                    $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,$type);

                                } else {
                                    
                                    if(count($deviceIds)>0 && $message!=""){
                                        $payload = array(
                                            "sid"=>$studentId,
                                            "url"=>$url,
                                            "imType"=>$imType,
                                            "type"=>$type,
                                            "message" => $message
                                            );
                                        //if(count($this->stdtravel)==0)

                                //echo $this->db->last_query();print_r(count($this->stdtravel));exit;                    //print_r($stdtravel);exit;

                                        $notification = ($this->send_notification($deviceIds, $payload));

                                        //print_r($notification);exit;

                                        unset($deviceIds); 
                                    }
                                    
                                                     

                                }
                        }


                    }else{
                        //print_r("Helloooo");exit;
                    foreach($query1->result() as $que)
                    {

                        $fromDate = $que->fromDate;

                        $toDate  = $que->toDate;
                
                        if($deviceId!="" && count($this->stdtravel)==0 && ($fromDate<$travelDate && $toDate<$travelDate))/*&& $echo_time + $interval >= time())*/
                            {                    

                                $deviceIds[]=$deviceId;

                                $time = $this->apilib->getCustomDate("%h:%i %A",  now());

                                if($location!="" ){

                                    $message = "Now ".$studentName ." bus location is ".$location;

                                }
                                
                                if($deviceType == "iOS" && $deviceId!="nil"){
         
                                    $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,$type);

                                } else {
                                    
                                    if(count($deviceIds)>0 && $message!=""){
                                        $payload = array(
                                            "sid"=>$studentId,
                                            "url"=>$url,
                                            "imType"=>$imType,
                                            "type"=>$type,
                                            "message" => $message
                                            );
                                        //if(count($this->stdtravel)==0)

                                //echo $this->db->last_query();print_r(count($this->stdtravel));exit;                    //print_r($stdtravel);exit;

                                        $notification = ($this->send_notification($deviceIds, $payload));

                                        //print_r($notification);exit;

                                        unset($deviceIds); 
                                    }
                                    
                                                     

                                }

                            }
                        }
                    }

                    }
                }
            }
        
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "notification"=>$notification,
            //"inTime"=>$inTime
        );
        
        echo json_encode($value);
        
    }
}