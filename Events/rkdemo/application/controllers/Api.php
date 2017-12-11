<?php
class api extends CI_Controller{
    /*
     * Constructor
     */
    function __construct(){
        parent::__construct();
        $this->load->model("apimodel","",true);
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

    /**
     * Sending Push Notification
     */
    public function eventApi() {

        // Set POST variables
       //next example will insert new conversation
    if($id!=""){
        
        $eventQ = $this->adminmodel->getEvent($id);
    
        foreach ($eventQ->result() as $rowEvent){

            $eventId = $rowEvent->eventId;
            
            $eventName = $rowEvent->eventName;
            
            $details = $rowEvent->details;
    
            $eventDate = $rowEvent->eventDate;
            
            $status = $rowEvent->status;
            $service_url = 'http://example.com/api/conversations';
            $curl = curl_init($service_url);
            $curl_post_data = array(
                    'eventId' => $rowEvent->eventId,
                    'eventName' => $rowEvent->eventName,
                    'details' => $rowEvent->details,
                    'eventDate' => $rowEvent->eventDate,
                    'status' => $rowEvent->status,
                    //'apikey' => 'key001'
            );
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);
            $curl_response = curl_exec($curl);
            if ($curl_response === false) {
                $info = curl_getinfo($curl);
                curl_close($curl);
                die('error occured during curl exec. Additioanl info: ' . var_export($info));
            }
            curl_close($curl);
            $decoded = json_decode($curl_response);
            if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
                die('error occured: ' . $decoded->response->errormessage);
            }
            echo 'response ok!';
    //var_export($decoded->response);

        }
     
    }  
    } 
}